library NasalReconstructiveSurgery version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Deviated Nasal Septum": '2.16.840.1.113883.3.6037.1001.23.93.101'
valueset "Nasal Obstruction": '2.16.840.1.113883.3.6037.1001.23.93.102'
valueset "Congenital Deflect Diagnosis": '2.16.840.1.113883.3.6037.1001.23.93.98'
valueset "Functional Impairments Secondary To Nasal Obstruction": '2.16.840.1.113883.3.6037.1001.23.93.108'
valueset "Vestibular Symptoms": '2.16.840.1.113762.1.4.1206.40'
valueset "Nasal Fracture": '2.16.840.1.113883.3.6037.1001.23.93.99'
valueset "Nasal Deformity": '2.16.840.1.113883.3.6037.1001.23.93.103'
valueset "Qualified Nasal Reconstructive Diseases": '2.16.840.1.113883.3.6037.1001.23.93.100'
valueset "Chronic Sinusitis Diagnosis": '2.16.840.1.113883.3.6037.1001.23.93.104'
valueset "Epistaxis Diagnosis": '2.16.840.1.113883.3.6037.1001.23.93.105'
valueset "Obstructive Sleep Disorder": '2.16.840.1.113883.3.6037.1001.23.93.106'
valueset "Intranasal Surgeries": '2.16.840.1.113883.3.6037.1001.23.93.107'
valueset "Rehabilitation Prosthesis": '2.16.840.1.113883.3.6037.1001.23.93.109'
valueset "Antihistamine Prophylaxis": '2.16.840.1.113883.3.6037.1001.23.93.110'
valueset "Moderate Respiratory Complications Procedures": '2.16.840.1.113762.1.4.1029.174'
valueset "Partially successful": '2.16.840.1.113883.3.6037.1001.23.93.47'
valueset "Successful": '2.16.840.1.113883.3.6037.1001.23.93.48'
valueset "Procedure for Medication Administration": '2.16.840.1.113883.3.6037.1001.23.96.12'
valueset "Unsuccessful": '2.16.840.1.113883.3.6037.1001.23.99.50'
valueset "Intranasal Antihistamines": '1.3.6.1.4.1.6997.4.1.2.268.13.35211.1.11.1.999.319'
valueset "Antibiotic Medical Therapy": '2.16.840.1.113883.3.6037.1001.23.93.111'
valueset "Intranasal Corticosteroids": '1.3.6.1.4.1.6997.4.1.2.268.15.35221.1.11.1.999.315'
valueset "Immunosuppressants Drug Therapy": '2.16.840.1.113883.3.6037.1001.23.93.112'
valueset "Septoplasty Procedure Codes": '2.16.840.1.113883.3.6037.1001.23.93.113'
valueset "Turbinectomy Procedure Codes": '2.16.840.1.113883.3.6037.1001.23.93.114'
valueset "Bleeding Disorder": '2.16.840.1.113762.1.4.1029.287'
valueset "Immunosuppressant Adverse Reaction": '2.16.840.1.113883.3.6037.1001.23.93.115'
valueset "Allergy to Amoxicillin": '2.16.840.1.113883.3.6037.1001.23.93.116'
valueset "Nasal Trauma": '2.16.840.1.113883.3.6037.1001.23.93.118'
valueset "Cleft Lip Or Cleft Palate Diagnosis": '2.16.840.1.113883.3.6037.1001.23.93.119'
valueset "Vestibular Stenosis Diagnosis": '2.16.840.1.113883.3.6037.1001.23.93.117'
valueset "Acetaminophen / Dextromethorphan / Doxylamine / Pseudoephedrine": '2.16.840.1.113883.3.464.1003.196.12.1329'
valueset "Instillation Of Nasal Spray": '2.16.840.1.113883.3.6037.1001.23.93.122'
valueset "Antihistamines Adverse Reaction": '2.16.840.1.113883.3.6037.1001.23.93.123'
valueset "Antibiotics Oral and Injectables": '2.16.840.1.113762.1.4.1106.75'


parameter "ServiceRequest" ServiceRequest
parameter "QuestionnaireResponse" QuestionnaireResponse

context Patient

define Request:
	"ServiceRequest"

define NasalObstructionCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Nasal Obstruction")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define NasalSeptumDeviationCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Deviated Nasal Septum")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define SurgeryPurpose:
	if (exists("NasalObstructionCondition")
				or exists("NasalSeptumDeviationCondition"))
								then 'Reconstructive'
									else 'Cosmetic'

define NasalAirwayObstruction:
	if exists("NasalObstructionCondition")
			then true
				else false

define CongenitalDeflectDiagnosis:
  [Condition]C
    where exists(C.code.coding C where C in "Congenital Deflect Diagnosis")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define CongenitalDefect:
	if exists("CongenitalDeflectDiagnosis")
		then true
			else false

define SecondaryFunctionalImpairmentConditions:
	[Condition]C
    where exists(C.code.coding C where C in "Functional Impairments Secondary To Nasal Obstruction")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define FunctionalImpairment:
	if exists("SecondaryFunctionalImpairmentConditions")
		then true
			else false

define VestibularStenosisCondition:
  [Condition]C
    where exists(C.code.coding C where C in "Vestibular Symptoms")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define VestibularStenosis:
	if exists("VestibularStenosisCondition")
		then true
			else false

define NasalTrauma:
  [Condition]C
    where exists(C.code.coding C where C in "Nasal Trauma")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define NasalFracture:
  [Condition]C
    where exists(C.code.coding C where C in "Nasal Fracture")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define Trauma:
	if (exists("NasalTrauma")
			or exists("NasalFracture"))
				then true
					else false

define NasalBoneFracture:
	if exists("NasalFracture")
		then true
			else false

define BenignDiseases:
  [Condition]C
    where exists(C.code.coding C where C in "Qualified Nasal Reconstructive Diseases")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define BenignDiseasesCausingNasalObstruction:
	if exists("BenignDiseases")
			then true
				else false

define ObstructiveSleepDisorderCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Obstructive Sleep Disorder")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define ObstructiveSleepDisorder:
	if exists("ObstructiveSleepDisorderCondition")
		then true
			else false

define SeptalDeviation:
	[Condition]C
    where exists(C.code.coding C where C in "Deviated Nasal Septum")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define NasalSeptumDeviationOrDeformity:
	if exists("SeptalDeviation")
		then true
			else false

define CleftLipOrPalateCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Cleft Lip Or Cleft Palate Diagnosis")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define ClefLipOrPalateRepair:
	if (exists("CleftLipOrPalateCondition")
				and ("NasalSeptumDeviationOrDeformity" = true)
					and ("FunctionalImpairment" = true))
						then true
							else false

define RecurrentEpistaxisCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Epistaxis Diagnosis")
      and First(C.clinicalStatus.coding).code.value = 'recurrence'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define RecurrentEpistaxis:
 if (exists("RecurrentEpistaxisCondition")
		and ("NasalSeptumDeviationOrDeformity" = true))
			then true
				else false

define RecurrentSinusitisCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Chronic Sinusitis Diagnosis")
      and First(C.clinicalStatus.coding).code.value = 'recurrence'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define RecurrentSinusitis:
	if (exists("RecurrentSinusitisCondition")
		and ("NasalSeptumDeviationOrDeformity" = true))
			then true
				else false

define IntranasalSurgeriesContraindication:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value in {'not-done','stopped'}
		and exists(P.code.coding C where C in "Intranasal Surgeries")
		and P.statusReason.coding in "Deviated Nasal Septum"

define IntranasalSurgeriesInterference:
 if (exists("IntranasalSurgeriesContraindication")
			and ("NasalAirwayObstruction" = false)
				and ("NasalSeptumDeviationOrDeformity" = true))
				then true
					else false

define RehabilitationProsthesisTherapy:
	[Procedure]P where P.status.value = 'completed'
		and exists(P.code.coding C where C in "Rehabilitation Prosthesis")

define RehabilitationProsthesis:
	if exists("RehabilitationProsthesisTherapy")
		then true
			else false

define ProsthesisUsageMoreThanSixWeeks:
	[Procedure]P
		where P.status.value = 'completed'
			and exists(P.code.coding C where C in "Rehabilitation Prosthesis")
				and "LengthInDays"("Normalize Interval Procedure"(P.performed)) > 42

define ProsthesisForSixWeeks:
	if exists("ProsthesisUsageMoreThanSixWeeks")
		then true
			else null

define ImprovementPostProsthesis:
	exists([Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and exists(P.code.coding C where C in "Rehabilitation Prosthesis")
		and ((First(P.outcome.coding) in "Successful") or First(P.outcome.coding) in "Partially successful"))

define CPAPInterference:
	exists([Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 					and P.status.value in {'not-done','stopped'}
						and exists(P.code.coding C where C in "Moderate Respiratory Complications Procedures")
							and P.statusReason.coding in "Deviated Nasal Septum")

define ContraindicationOfCPAP:
	if (("CPAPInterference" = true)
				and exists("ObstructiveSleepDisorderCondition"))
					then true
						else false

define AntiHistaminesMedicationAdministration:
	[MedicationAdministration]M
	where M.subject.reference.value = 'Patient/'+ Patient.id.value
	and M.status.value = 'completed'
	and First((M.medication as CodeableConcept).coding) in "Intranasal Antihistamines"

define AntiHistamineProcedureResources:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and (First(P.code.coding) in "Procedure for Medication Administration" or First(P.code.coding) in "Antihistamine Prophylaxis")

define CheckAntiHistamineAdministration:
	"AntiHistaminesMedicationAdministration" M
		with "AntiHistamineProcedureResources" P
			such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)

define SpecifyAntiHistamineAdministrationMedicationCode:
		"AntiHistaminesMedicationAdministration".medication M

define AntiHistamineMedicalTherapy:
  if Last("CheckAntiHistamineAdministration") is not null
		then true
			else false

define AntiHistamineTherapyForSixWeeks:
	exists("AntiHistaminesMedicationAdministration" M
		with "AntiHistamineProcedureResources" P
			such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
				and "LengthInDays"("Normalize Interval Procedure"(P.performed)) > 42)

define SpecifyAntiHistamineMedication:
	"SpecifyAntiHistamineAdministrationMedicationCode".coding M
		return (M.display.value)

define PostAntiHistamineSuccessfulOutcome:
	if exists("AntiHistaminesMedicationAdministration" M
							with "AntiHistamineProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and (First(P.outcome.coding) in "Successful" or First(P.outcome.coding) in "Partially successful"))
					then true
						else false

define PostAntiHistamineUnsuccessfulOutcome:
	if exists("AntiHistaminesMedicationAdministration" M
							with "AntiHistamineProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and First(P.outcome.coding) in "Unsuccessful")
					then true
						else false

define ImprovementPostAntiHistamineMedicalTherapy:
	if ("PostAntiHistamineSuccessfulOutcome" = true)
		then true
			else if ("PostAntiHistamineUnsuccessfulOutcome" = true)
				then false
					else null

define AntibioticsMedicationAdministration:
	[MedicationAdministration]M
	where M.subject.reference.value = 'Patient/'+ Patient.id.value
	and M.status.value = 'completed'
	and First((M.medication as CodeableConcept).coding) in "Antibiotics Oral and Injectables"

define AntibioticsProcedureResources:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and (First(P.code.coding) in "Procedure for Medication Administration" or First(P.code.coding) in "Antibiotic Medical Therapy")

define CheckAntibioticsAdministration:
	"AntibioticsMedicationAdministration" M
		with "AntibioticsProcedureResources" P
			such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)

define SpecifyAntibioticsAdministrationMedicationCode:
		"AntibioticsMedicationAdministration".medication M

define AntibioticMedicalTherapy:
  if Last("CheckAntibioticsAdministration") is not null
		then true
			else false

define AntibioticTherapyForSixWeeks:
	exists("AntibioticsMedicationAdministration" M
		with "AntibioticsProcedureResources" P
			such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
				and "LengthInDays"("Normalize Interval Procedure"(P.performed)) > 42)

define SpecifyAntibioticsMedication:
	"SpecifyAntibioticsAdministrationMedicationCode".coding M
		return (M.display.value)

define PostAntibioticsSuccessfulOutcome:
	if exists("AntibioticsMedicationAdministration" M
							with "AntibioticsProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and (First(P.outcome.coding) in "Successful" or First(P.outcome.coding) in "Partially successful"))
					then true
						else false

define PostAntibioticsUnsuccessfulOutcome:
	if exists("AntibioticsMedicationAdministration" M
							with "AntibioticsProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and First(P.outcome.coding) in "Unsuccessful")
					then true
						else false

define PostAntibioticMedicalTherapy:
	if ("PostAntibioticsSuccessfulOutcome" = true)
		then true
			else if ("PostAntibioticsUnsuccessfulOutcome" = true)
				then false
					else null

define ImmunosuppressantsMedicationAdministration:
	[MedicationAdministration]M
	where M.subject.reference.value = 'Patient/'+ Patient.id.value
	and M.status.value = 'completed'
	and First((M.medication as CodeableConcept).coding) in "Intranasal Corticosteroids"

define ImmunosuppressantsProcedureResources:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and (First(P.code.coding) in "Procedure for Medication Administration" or First(P.code.coding) in "Immunosuppressants Drug Therapy")

define CheckImmunosuppressantsAdministration:
	"ImmunosuppressantsMedicationAdministration" M
		with "ImmunosuppressantsProcedureResources" P
			such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)

define SpecifyImmunosuppressantsMedicationCode:
		"CheckImmunosuppressantsAdministration".medication M

define ImmunosuppressantsMedicalTherapy:
  if Last("CheckImmunosuppressantsAdministration") is not null
		then true
			else false

define ImmunosuppressantsTherapyForSixWeeks:
	exists("ImmunosuppressantsMedicationAdministration" M
		with "ImmunosuppressantsProcedureResources" P
			such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
				and "LengthInDays"("Normalize Interval Procedure"(P.performed)) > 42)

define SpecifyImmunosuppressantsMedication:
	"SpecifyImmunosuppressantsMedicationCode".coding M
		return (M.display.value)

define PostImmunosuppressantsSuccessfulOutcome:
	if exists("ImmunosuppressantsMedicationAdministration" M
							with "ImmunosuppressantsProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and (First(P.outcome.coding) in "Successful" or First(P.outcome.coding) in "Partially successful"))
					then true
						else false

define PostImmunosuppressantsUnsuccessfulOutcome:
	if exists("ImmunosuppressantsMedicationAdministration" M
							with "ImmunosuppressantsProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and First(P.outcome.coding) in "Unsuccessful")
					then true
						else false

define PostImmunosuppressantsMedicalTherapy:
	if ("PostImmunosuppressantsSuccessfulOutcome" = true)
		then true
			else if ("PostImmunosuppressantsUnsuccessfulOutcome" = true)
				then false
					else null

define DecongestantsMedicalAdministration:
	[MedicationAdministration]M
		where M.subject.reference.value = 'Patient/'+ Patient.id.value
			and M.status.value = 'completed'
				and First((M.medication as CodeableConcept).coding) in "Acetaminophen / Dextromethorphan / Doxylamine / Pseudoephedrine"

define DecongestantsProcedureResources:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and (First(P.code.coding) in "Procedure for Medication Administration" or First(P.code.coding) in "Instillation Of Nasal Spray")

define CheckDecongestantsAdministration:
	"DecongestantsMedicalAdministration" M
		with "DecongestantsProcedureResources" P
			such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)

define DecongestantsMedicalTherapy:
	if Last("CheckDecongestantsAdministration") is not null
		then true
			else false

define SpecifyDecongestantsMedicationCode:
		"CheckDecongestantsAdministration".medication M

define SpecifyDecongestantsMedication:
	"SpecifyDecongestantsMedicationCode".coding M
		return (M.display.value)

define DecongestantsTherapyForSixWeeks:
	exists("DecongestantsMedicalAdministration" M
		with "DecongestantsProcedureResources" P
			such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
				and "LengthInDays"("Normalize Interval Procedure"(P.performed)) > 42)

define PostDecongestantsSuccessfulOutcome:
	exists("DecongestantsMedicalAdministration" M
							with "DecongestantsProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and (First(P.outcome.coding) in "Successful" or First(P.outcome.coding) in "Partially successful"))

define PostDecongestantsUnsuccessfulOutcome:
	exists("DecongestantsMedicalAdministration" M
							with "DecongestantsProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and First(P.outcome.coding) in "Unsuccessful")

define PostDecongestantsMedicalTherapy:
	if ("PostDecongestantsSuccessfulOutcome" = true)
		then true
			else if ("PostDecongestantsUnsuccessfulOutcome" = true)
				then false
					else null

define PreviousSeptoplastyOrTurbinectomyProcedure:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and P.status.value = 'completed'
			and (First(P.code.coding) in "Septoplasty Procedure Codes" or First(P.code.coding) in "Turbinectomy Procedure Codes")

define PreviousSeptoplastyOrTurbinectomy:
	if exists("PreviousSeptoplastyOrTurbinectomyProcedure")
		then true
			else false

define NasalObstructionImprovementPostSeptoplastyOrTurbinectomy:
	exists(([Condition]C where First(C.clinicalStatus.coding).code.value in {'active', 'resolved'}
		and First(C.code.coding C where C in "Nasal Obstruction") is not null
        and First(C.verificationStatus.coding).code.value = 'confirmed') C
		with "PreviousSeptoplastyOrTurbinectomyProcedure" P
			such that end of "Normalize Interval"(C.onset) after end of "Normalize Interval"(P.performed))

define SeptalDeviationImprovementPostSeptoplastyOrTurbinectomy:
	exists(([Condition]C where First(C.clinicalStatus.coding).code.value in {'resolved', 'inactive'}
		and exists(C.code.coding C where C in "Deviated Nasal Septum")
        and First(C.verificationStatus.coding).code.value = 'confirmed') Co
		with "PreviousSeptoplastyOrTurbinectomyProcedure" P
		such that end of "Normalize Interval"(Co.onset) after end of "Normalize Interval"(P.performed)
	sort by end of "Normalize Interval"(onset)
	)

define SeptoplastyOrTurbinectomySuccessfulOutcome:
	exists([Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and (First(P.code.coding) in "Septoplasty Procedure Codes" or First(P.code.coding) in "Turbinectomy Procedure Codes")
		and (First(P.outcome.coding) in "Successful" or First(P.outcome.coding) in "Partially successful"))

define SeptoplastyOrTurbinectomyUnsuccessfulOutcome:
	exists([Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and (First(P.code.coding) in "Septoplasty Procedure Codes" or First(P.code.coding) in "Turbinectomy Procedure Codes")
		and (First(P.outcome.coding) in "Unsuccessful"))

define SeptoplastyOrTurbinectomyOutcome:
	if ("SeptoplastyOrTurbinectomySuccessfulOutcome" = true)
		then true
			else if ("SeptoplastyOrTurbinectomyUnsuccessfulOutcome" = true)
				then false
					else null

define AdditionalSurgeries:
	exists([Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value in {'preparation','in-progress'}
		and (First(P.code.coding) in "Septoplasty Procedure Codes" or First(P.code.coding) in "Turbinectomy Procedure Codes"))

define BleedingDisorders:
	exists([Condition]C
    where exists(C.code.coding C where C in "Bleeding Disorder")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed')

define SteroidsAdverseReactions:
	exists([AdverseEvent]A
					where A.actuality in {'actual', 'potential'}
      			and First((A.event as CodeableConcept).coding) in "Immunosuppressant Adverse Reaction")

define AmoxicillinAllergy:
	exists([AllergyIntolerance]A
		where First(A.clinicalStatus.coding).code.value = 'active'
    and exists(A.code.coding x where x in "Allergy to Amoxicillin"))

define AntiHistaminesAdverseReaction:
	exists([AdverseEvent]A
					where A.actuality in {'actual', 'potential'}
      			and First((A.event as CodeableConcept).coding) in "Antihistamines Adverse Reaction")


define function "Normalize Interval Procedure"(choice Choice<FHIR.dateTime, FHIR.Age, FHIR.Period, FHIR.Range, FHIR.string>):
 	 if choice is FHIR.dateTime then
 		  Interval[FHIRHelpers.ToDateTime(choice as FHIR.dateTime), FHIRHelpers.ToDateTime(choice as FHIR.dateTime)]
	  else if choice is FHIR.Period then
		  FHIRHelpers.ToInterval(choice as FHIR.Period)
		else if choice is FHIR.string then
    Message(null as Interval<DateTime>, true, '1', 'Error', 'Cannot compute an interval from a String value')
	  else if choice is FHIR.Age then
	 	  Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(choice as FHIR.Age),
 		FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(choice as FHIR.Age) + 1 year)
		else if choice is FHIR.Range then
	  Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((choice as FHIR.Range).low),
		  FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((choice as FHIR.Range).high) + 1 year)
	  else null

define function "LengthInDays"(Value Interval<DateTime>):
	difference in days between start of Value and end of Value

define function "Normalize Interval"(choice Choice<FHIR.dateTime, FHIR.Age, FHIR.Period, FHIR.Range, FHIR.string>):
 	 if choice is FHIR.dateTime then
 		  Interval[FHIRHelpers.ToDateTime(choice as FHIR.dateTime), FHIRHelpers.ToDateTime(choice as FHIR.dateTime)]
	  else if choice is FHIR.Period then
		  FHIRHelpers.ToInterval(choice as FHIR.Period)
		else if choice is FHIR.string then
    Message(null as Interval<DateTime>, true, '1', 'Error', 'Cannot compute an interval from a String value')
	  else if choice is FHIR.Age then
	 	  Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(choice as FHIR.Age),
 		FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(choice as FHIR.Age) + 1 year)
		else if choice is FHIR.Range then
	  Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((choice as FHIR.Range).low),
		  FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((choice as FHIR.Range).high) + 1 year)
	  else null

define function "Normalize Onset"(onset Choice<FHIR.dateTime, FHIR.Age, FHIR.Period, FHIR.Range, FHIR.string>):
  if onset is FHIR.dateTime then
	  Interval[FHIRHelpers.ToDateTime(onset as FHIR.dateTime), FHIRHelpers.ToDateTime(onset as FHIR.dateTime)]
	else if onset is FHIR.Period then
	  FHIRHelpers.ToInterval(onset as FHIR.Period)
	else if onset is FHIR.string then
    Message(null as Interval<DateTime>, true, '1', 'Error', 'Cannot compute an interval from a String value')
	else if onset is FHIR.Age then
	  Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(onset as FHIR.Age),
		  FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(onset as FHIR.Age) + 1 year)
	else if onset is FHIR.Range then
	  Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((onset as FHIR.Range).low),
		  FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((onset as FHIR.Range).high) + 1 year)
	else null
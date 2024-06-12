library BotulinumUrinaryIncontinence version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'


//Valuesets for Spasticity
valueset "Spasticity Condition Codes": '2.16.840.1.113883.3.6037.1001.23.93.72'
valueset "Ischemic Stroke": '2.16.840.1.113883.3.117.1.7.1.247'
valueset "Multiple Sclerosis (ICD10CM)": '2.16.840.1.113762.1.4.1034.99'
valueset "Brain Injury": '2.16.840.1.113883.3.7587.2.1015'
valueset "Cerebral Palsy": '2.16.840.1.113883.3.7587.2.1012'
valueset "Physiotherapy Codes": '2.16.840.1.113883.3.6037.1001.23.93.89'
valueset "Chemodenervation of Muscle(s); Muscle(s) innervated by Facial Nerve,Unilateral": '2.16.840.1.113883.3.6037.1001.23.99.41'
valueset "Chemodenervation of Muscle(s); Muscle(s) innervated by Facial, Trigeminal, Cervical, Spinal and Accessory Nerves, Bilateral": '2.16.840.1.113883.3.6037.1001.23.99.47'
valueset "Chemodenervation of Neck Muscle(s)": '2.16.840.1.113883.3.6037.1001.23.93.73'
valueset "Chemodenervation of Larynx Muscle(s)": '2.16.840.1.113883.3.6037.1001.23.93.74'
valueset "Laryngoscopy Codes": '2.16.840.1.113883.3.6037.1001.23.93.80'
valueset "Chemodenervation Of Trunk Muscle(S); 1-5 Muscle(S)": '2.16.840.1.113883.3.6037.1001.23.93.75'
valueset "Chemodenervation Of Trunk Muscle(S); 6 Or More Muscles": '2.16.840.1.113883.3.6037.1001.23.93.78'
valueset "Chemodenervation Of One Extremity; 1-4 Muscle(S)": '2.16.840.1.113883.3.6037.1001.23.93.76'
valueset "Chemodenervation Of One Extremity; 5 Or More Muscles": '2.16.840.1.113883.3.6037.1001.23.93.77'
valueset "Chemodenervation of Extraocular Muscle": '2.16.840.1.113883.3.6037.1001.23.99.45'

//Valuesets for Blepharospasm
valueset "Blepharospasm Condition Codes": '2.16.840.1.113883.3.6037.1001.23.93.79'
valueset "Abnormal Involuntary Movements": '2.16.840.1.113883.3.6037.1001.23.93.57'
valueset "Keratopathy": '2.16.840.1.113883.3.6037.1001.23.93.58'
valueset "Disorder of Eye": '2.16.840.1.113883.3.6037.1001.23.93.59'

//Valuesets for Sialorrhea
valueset "Sialorrhea Diagnosis Codes": '2.16.840.1.113883.3.6037.1001.23.99.27'
valueset "Parkinson’s disease (Disorders) (ICD10CM)": '2.16.840.1.113762.1.4.1146.1047'
valueset "Dental Caries": '2.16.840.1.113883.3.464.1003.125.11.1009'
valueset "Dental Conditions": '2.16.840.1.113883.3.6037.1001.23.93.45'
valueset "Adverse Effects causing Sialorrhea": '2.16.840.1.113883.3.6037.1001.23.93.46'
valueset "Biobehavioral Therapy": '2.16.840.1.113762.1.4.1034.570'
valueset "Partially successful": '2.16.840.1.113883.3.6037.1001.23.93.47'
valueset "Successful": '2.16.840.1.113883.3.6037.1001.23.93.48'
valueset "Glycopyrrolate": '2.16.840.1.113883.3.3616.200.110.102.2067'
valueset "Scopolamine": '2.16.840.1.113883.3.6037.1001.23.93.82'
valueset "Sialorrhea Injection Procedures": '2.16.840.1.113883.3.6037.1001.23.93.97'

//Valuesets for Achalasia
valueset "Esophagoscopy Codes": '2.16.840.1.113883.3.6037.1001.23.99.28'
valueset "Hypertensive LOS": '2.16.840.1.113883.3.6037.1001.23.93.61'
valueset "Malnutrition": '2.16.840.1.113883.3.6037.1001.23.93.62'
valueset "Oesophageal Biopsy": '2.16.840.1.113883.3.6037.1001.23.93.63'
valueset "Esophagus Disease Codes": '2.16.840.1.113883.3.6037.1001.23.93.64'
valueset "Epiphrenic Diverticulum": '2.16.840.1.113883.3.6037.1001.23.93.65'
valueset "Pneumatic Dilation": '2.16.840.1.113883.3.6037.1001.23.93.66'
valueset "Surgical Myotomy Codes": '2.16.840.1.113883.3.6037.1001.23.93.67'

//Valuesets for Anal Fissure
valueset "AnalFissure Codes": '2.16.840.1.113883.3.6037.1001.23.99.29'
valueset "Fiber Supplements RXNORM Codes": '2.16.840.1.113883.3.6037.1001.23.93.68'
valueset "Stool softeners and laxatives": '2.16.840.1.113762.1.4.1032.44'
valueset "Sitz Bath": '2.16.840.1.113883.3.6037.1001.23.93.69'
valueset "Topical Anaesthetic Application": '2.16.840.1.113883.3.6037.1001.23.93.70'

//Valuesets for Hyperhydrosis
valueset "Hyperhidrosis Codes": '2.16.840.1.113883.3.6037.1001.23.99.34'
valueset "Generalised Hyperhidrosis": '2.16.840.1.113883.3.6037.1001.23.93.71'
valueset "Anticholinergic Medication Codes": '2.16.840.1.113883.3.6037.1001.23.93.83'

//Valuesets for Urinary Incontinence
valueset "Cystourethroscopy Codes": '2.16.840.1.113883.3.6037.1001.23.99.30'

//Valuesets for Migraine
valueset "Migraine Codes": '2.16.840.1.113883.3.6037.1001.23.93.84'
valueset "Triptan Medications": '2.16.840.1.113762.1.4.1111.83'
valueset "Migraine Prophylaxis": '2.16.840.1.113883.3.6037.1001.23.93.188'

//Valuesets for Strabismus
valueset "Strabismus Codes": '2.16.840.1.113883.3.6037.1001.23.93.85'
valueset "Binocular Vision Codes": '2.16.840.1.113883.3.6037.1001.23.93.86'
valueset "Strabismus Surgery Codes": '2.16.840.1.113883.3.6037.1001.23.93.87'

//Valuesets for Prior Botox Administration
valueset "Botulinum Toxin RXNORM Codes": '2.16.840.1.113883.3.6037.1001.23.93.60'
valueset "Procedure for Medication Administration": '2.16.840.1.113883.3.6037.1001.23.96.12'
valueset "Unsuccessful": '2.16.840.1.113883.3.6037.1001.23.99.50'
valueset "Botox Injection Procedure": '2.16.840.1.113883.3.6037.1001.23.93.91'
valueset "Intramuscular Injection of Botox": '2.16.840.1.113883.3.6037.1001.23.93.96'
valueset "Botox Injection into Anal Sphincter": '2.16.840.1.113883.3.6037.1001.23.93.93'
valueset "Botox Injection into Peripheral Nerve": '2.16.840.1.113883.3.6037.1001.23.93.94'
valueset "Intralaryngeal Injection of Botox": '2.16.840.1.113883.3.6037.1001.23.93.95'
valueset "Botox Injection into Eye Muscle": '2.16.840.1.113883.3.6037.1001.23.93.92'

//Valuesets for Comorbidities - Sialorrhea and Urinary Incontinence
valueset "Myasthenia Gravis": '2.16.840.1.113883.3.6037.1001.23.93.49'
valueset "Hyperthyroidism": '2.16.840.1.113883.3.464.1003.117.11.1031'
valueset "Glaucoma": '2.16.840.1.113883.3.526.2.1561'
valueset "Benign Prostatic Hyperplasia": '1.2.91.13925.17760.4352590'
valueset "Hypertension": '2.16.840.1.113762.1.4.1029.330'
valueset "Urinary Tract Blockage": '2.16.840.1.113883.3.6037.1001.23.93.50'
valueset "Tachycardia (ICD10CM)": '2.16.840.1.113762.1.4.1146.1238'
valueset "Heart Failure": '2.16.840.1.113762.1.4.1200.123'
valueset "Dry Mouth": '2.16.840.1.113883.3.6037.1001.23.93.51'
valueset "Hiatal Hernia": '2.16.840.1.113883.3.6037.1001.23.93.52'
valueset "Constipation": '2.16.840.1.113883.3.6037.1001.23.93.53'
valueset "Down Syndrome": '2.16.840.1.113883.3.6037.1001.23.93.54'

//Valuesets for Botox Allergy
valueset "Allergy to Clostridium Botulinum": '2.16.840.1.113883.3.6037.1001.23.93.55'

//Valuesets for Botulinum Conditions (Questions yet be added)


parameter "ServiceRequest" ServiceRequest

context Patient

//BOTULINUM CONDITIONS
define SpasticityCondition:
	[Condition]S
		where exists(S.code.coding C where C in "Spasticity Condition Codes")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define BlepharospasmCondition:
	[Condition]S
		where exists(S.code.coding C where C in "Blepharospasm Condition Codes")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define AchalasiaCondition:
	[Condition]S
		where exists(S.code.coding C where C in "Esophagoscopy Codes")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define AnalFissureCondition:
	[Condition]S
		where exists(S.code.coding C where C in "AnalFissure Codes")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define HyperhidrosisCondition:
	[Condition]S
		where exists(S.code.coding C where C in "Hyperhidrosis Codes")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define SialorrheaCondition:
	[Condition]S
		where exists(S.code.coding C where C in "Sialorrhea Diagnosis Codes")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define UrinaryIncontinenceCondition:
	[Condition]S
		where exists(S.code.coding C where C in "Cystourethroscopy Codes")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define MigraineCondition:
	[Condition]S
		where exists(S.code.coding C where C in "Migraine Codes")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define StrabismusCondition:
	[Condition]S
		where exists(S.code.coding C where C in "Strabismus Codes")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define BotoxDiagnosisConditions:
	if exists("AchalasiaCondition")
		then 'Achalasia'
			else if exists("AnalFissureCondition")
				then 'Anal Fissure'
					else if exists("HyperhidrosisCondition")
						then 'Primary Axillary Hyperhidrosis'
							else if exists("SialorrheaCondition")
								then 'Sialorrhea'
									else if exists("UrinaryIncontinenceCondition")
										then 'Urinary Incontinence'
											else if exists("SpasticityCondition")
												then 'Spasticity'
													else if exists("BlepharospasmCondition")
														then 'Blepharospasm'
															else if exists("MigraineCondition")
																then 'Migraine'
																	else if exists("StrabismusCondition")
																		then 'Strabismus'
																			else ''

//PRIOR BOTULINUM ADMINISTRATION
define MedicationAdministrationResources:
		[MedicationAdministration]M
	where M.subject.reference.value = 'Patient/'+ Patient.id.value
	and M.status.value = 'completed'
	and First((M.medication as CodeableConcept).coding) in "Botulinum Toxin RXNORM Codes"

define MedicationResources:
	[Medication]med where (First(med.code.coding) in "Botulinum Toxin RXNORM Codes") is not null

define ProcedureResources:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and First(P.code.coding) in "Procedure for Medication Administration"

define BotoxInjectionProcedure:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and First(P.code.coding) in "Botox Injection Procedure"

define IntramuscularBotoxInjectionProcedure:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and First(P.code.coding) in "Intramuscular Injection of Botox"

define EyeBotoxInjectionProcedure:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and First(P.code.coding) in "Botox Injection into Eye Muscle"

define AnalBotoxInjectionProcedure:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and First(P.code.coding) in "Botox Injection into Anal Sphincter"

define LaryngealBotoxInjectionProcedure:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and First(P.code.coding) in "Intralaryngeal Injection of Botox"

define PeripheralBotoxInjectionProcedure:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and First(P.code.coding) in "Botox Injection into Peripheral Nerve"

define CheckBotoxAdministration:
	"MedicationAdministrationResources" M
		with "ProcedureResources" P
			such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)

define SpecifyBotoxAdministrationMedicationCode:
		"MedicationAdministrationResources".medication M

//SPASTICITY
define Request:
	"ServiceRequest"

define SpasticityFacialUnilateral:
if (exists("Request".code.coding C where C in "Chemodenervation of Muscle(s); Muscle(s) innervated by Facial Nerve,Unilateral"))
	then true
	else false

define SpasticityFacialBilateral:
if (exists("Request".code.coding C where C in "Chemodenervation of Muscle(s); Muscle(s) innervated by Facial, Trigeminal, Cervical, Spinal and Accessory Nerves, Bilateral"))
	then true
	else false

define SpasticityNeck:
if (exists("Request".code.coding C where C in "Chemodenervation of Neck Muscle(s)"))
	then true
	else false

define SpasticityLarynx:
if (exists("Request".code.coding C where C in "Chemodenervation of Larynx Muscle(s)"))
	then true
	else false

define SpasticityLaryngoscopy:
if (exists("Request".code.coding C where C in "Laryngoscopy Codes"))
	then true
	else false

define SpasticityTrunkOneToFiveMuscles:
if (exists("Request".code.coding C where C in "Chemodenervation Of Trunk Muscle(S); 1-5 Muscle(S)"))
	then true
	else false

define SpasticityTrunkSixOrMoreMuscles:
if (exists("Request".code.coding C where C in "Chemodenervation Of Trunk Muscle(S); 6 Or More Muscles"))
	then true
	else false

define SpasticityOneExtremityOneToFourMuscles:
if (exists("Request".code.coding C where C in "Chemodenervation Of One Extremity; 1-4 Muscle(S)"))
	then true
	else false

define SpasticityOneExtremityFiveOrMoreMuscles:
if (exists("Request".code.coding C where C in "Chemodenervation Of One Extremity; 5 Or More Muscles"))
	then true
	else false

define SpasticityExtraocular:
if (exists("Request".code.coding C where C in "Chemodenervation of Extraocular Muscle"))
	then true
	else false

define SpasticityMuscleGroups:
	if (("SpasticityFacialUnilateral" = true)
				or ("SpasticityFacialBilateral"= true))
					then 'Face'
						else if ("SpasticityNeck" = true)
							then 'Neck'
								else if (("SpasticityLarynx" = true)
									or ("SpasticityLaryngoscopy" = true))
										then 'Muscles of larynx'
											else if (("SpasticityTrunkOneToFiveMuscles" = true)
												or ("SpasticityTrunkSixOrMoreMuscles" = true))
													then 'Trunk muscles'
														else if (("SpasticityOneExtremityOneToFourMuscles" = true)
															or ("SpasticityOneExtremityFiveOrMoreMuscles" = true))
																then 'Extremity muscles'
																	else if ("SpasticityExtraocular" = true)
																		then 'Extraocular Mucles'
																			else ''

define SpasticityFaceInjectionSide:
	if ("SpasticityFacialUnilateral" = true)
		then 'Unilateral'
			else if ("SpasticityFacialBilateral"= true)
				then 'Bilateral'
					else ''

define InjectionSideExtremity:
	if ("SpasticityOneExtremityOneToFourMuscles" = true)
		then '1-4 muscle groups'
			else if ("SpasticityOneExtremityFiveOrMoreMuscles" = true)
				then '5 or more muscles'
					else ''

define InjectionSideTrunk:
	if ("SpasticityTrunkOneToFiveMuscles" = true)
		then '1-5 muscles'
			else if ("SpasticityTrunkSixOrMoreMuscles" = true)
				then '6 or more muscles'
					else ''

define IschemicStroke:
	[Condition]C
    where exists(C.code.coding C where C in "Ischemic Stroke")
			and First(C.clinicalStatus.coding).code.value = 'active'
				and First(C.verificationStatus.coding).code.value = 'confirmed'

define MultipleSclerosis:
	[Condition]C
    where exists(C.code.coding C where C in "Multiple Sclerosis (ICD10CM)")
			and First(C.clinicalStatus.coding).code.value = 'active'
				and First(C.verificationStatus.coding).code.value = 'confirmed'

define BrainInjury:
	[Condition]C
    where exists(C.code.coding C where C in "Brain Injury")
			and First(C.clinicalStatus.coding).code.value = 'active'
				and First(C.verificationStatus.coding).code.value = 'confirmed'

define CerebralPalsy:
	[Condition]C
    where exists(C.code.coding C where C in "Cerebral Palsy")
            and First(C.clinicalStatus.coding).code.value = 'active'
			        and First(C.verificationStatus.coding).code.value = 'confirmed'

define Etiology:
	if exists("IschemicStroke")
		then 'Ischemic Stroke'
			else if exists("MultipleSclerosis")
				then 'Multiple Sclerosis'
					else if exists("BrainInjury")
						then 'Traumatic Brain Injury'
							else if exists("CerebralPalsy")
								then 'Cerebral Palsy'
									else ''

define AdjunctivePhysiotherapyProcedure:
	[Procedure]P
		where P.status.value = 'completed'
			and exists(P.code.coding C where C in "Physiotherapy Codes")

define AdjunctivePhysiotherapy:
	if exists("AdjunctivePhysiotherapyProcedure")
		then true
			else false

define SpasticityEarlierBotulinumAdministration:
  if ((Last("CheckBotoxInjectionAdministration") is not null
				or Last("CheckLaryngealBotoxAdministration") is not null)
				and exists("SpasticityCondition"))
	then true
	else false

define SpasticitySpecifyBotoxAdministration:
	"SpecifyBotoxAdministrationMedicationCode".coding M
		return (M.display.value)

define SpasticityPostBotoxInjectionSuccessfulOutcome:
	if exists("MedicationAdministrationResources" M
							with "BotoxInjectionProcedure" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and ((First(P.outcome.coding) in "Successful") or First(P.outcome.coding) in "Partially successful"))
											then true
												else false

define SpasticityPostBotoxInjectionUnsuccessfulOutcome:
	if exists("MedicationAdministrationResources" M
							with "BotoxInjectionProcedure" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and First(P.outcome.coding) in "Unsuccessful")
											then true
												else false

define SpasticityPostLaryngealSuccessfulBotoxOutcome:
	if exists("MedicationAdministrationResources" M
							with "LaryngealBotoxInjectionProcedure" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and (First(P.outcome.coding) in "Successful" or First(P.outcome.coding) in "Partially successful"))
											then true
												else false

define SpasticityPostLaryngealUnsuccessfulBotoxOutcome:
	if exists("MedicationAdministrationResources" M
							with "LaryngealBotoxInjectionProcedure" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and First(P.outcome.coding) in "Unsuccessful")
											then true
												else false

define SpasticityPostBotoxImprovement:
	if ((("SpasticityPostBotoxInjectionSuccessfulOutcome" = true) or "SpasticityPostLaryngealSuccessfulBotoxOutcome" = true)
				and exists("SpasticityCondition"))
					then true
						else if ((("SpasticityPostBotoxInjectionUnsuccessfulOutcome" = true) or "SpasticityPostLaryngealUnsuccessfulBotoxOutcome" = true)
							and exists("SpasticityCondition"))
								then false
									else null

//BLEPHAROSPASM
define BlepharospasmFacialUnilateral:
if (exists("Request".code.coding C where C in "Chemodenervation of Muscle(s); Muscle(s) innervated by Facial Nerve,Unilateral")
			and exists("BlepharospasmCondition"))
	then true
	else false

define BlepharospasmFacialBilateral:
if (exists("Request".code.coding C where C in "Chemodenervation of Muscle(s); Muscle(s) innervated by Facial, Trigeminal, Cervical, Spinal and Accessory Nerves, Bilateral")
			and exists("BlepharospasmCondition"))
	then true
	else false

define BlepharospasmNeck:
if (exists("Request".code.coding C where C in "Chemodenervation of Neck Muscle(s)")
			and exists("BlepharospasmCondition"))
	then true
	else false

define BlepharospasmMuscleGroups:
	if (("BlepharospasmFacialUnilateral" = true)
				or ("BlepharospasmFacialBilateral"= true))
					then 'Face'
						else if ("BlepharospasmNeck" = true)
							then 'Neck'
								else ''

define BlepharospasmFaceInjectionSide:
	if ("BlepharospasmFacialUnilateral" = true)
		then 'Unilateral'
			else if ("BlepharospasmFacialBilateral"= true)
				then 'Bilateral'
					else ''

define KeratopathyCondition:
  [Condition]B
		where exists(B.code.coding C where C in "Keratopathy")
		  and First(B.clinicalStatus.coding).code.value = 'active'
			  and First(B.verificationStatus.coding).code.value = 'confirmed'

define CheckKeratopathy:
  if exists("KeratopathyCondition")
    then true
      else false

define AbnormalInvoluntaryMovements:
  [Condition]B
		where exists(B.code.coding C where C in "Abnormal Involuntary Movements")
		  and First(B.clinicalStatus.coding).code.value = 'active'
			  and First(B.verificationStatus.coding).code.value = 'confirmed'

define CheckAbnormalInvoluntaryMovements:
  if exists("AbnormalInvoluntaryMovements")
    then true
      else false

define OcularIrritation:
  [Condition]B
		where exists(B.code.coding C where C in "Disorder of Eye")
		  and First(B.clinicalStatus.coding).code.value = 'active'
			  and First(B.verificationStatus.coding).code.value = 'confirmed'

define CheckOcularIrritation:
  if exists("OcularIrritation")
    then true
      else false

define BlepharospasmEarlierBotulinumAdministration:
  if (Last("CheckBotoxAdministration") is not null
				and exists("BlepharospasmCondition"))
	then true
	else false

define BlepharospasmSpecifyBotoxAdministration:
	"SpecifyBotoxAdministrationMedicationCode".coding M
		return (M.display.value)

define BlepharospasmPostBotoxOutcome:
	if exists("MedicationAdministrationResources" M
							with "ProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and First(P.outcome.coding) in "Unsuccessful")
					then false
						else true

define BlepharospasmPostBotoxImprovement:
	if ("BlepharospasmPostBotoxOutcome" = true
				and exists("BlepharospasmCondition"))
					then true
						else false

//SIALORRHEA
define ParkinsonDisease:
	[Condition]C
    where exists(C.code.coding C where C in "Parkinson’s disease (Disorders) (ICD10CM)")
              and First(C.clinicalStatus.coding).code.value = 'active'
			          and First(C.verificationStatus.coding).code.value = 'confirmed'

define NeuromuscularSensoryDysfunction:
  if ((exists("CerebralPalsy") 		// The function for this condition has been defined above with Spasticity
			or exists("ParkinsonDisease")
				or exists("IschemicStroke"))      // The function for this condition has been defined above with Spasticity
					and exists("SialorrheaCondition"))
    			then true
      			else false

define DentalCaries:
  [Condition]C
    where exists(C.code.coding C where C in "Dental Caries")
            and First(C.clinicalStatus.coding).code.value = 'active'
			        and First(C.verificationStatus.coding).code.value = 'confirmed'

define DentalConditions:
	[Condition]C
    where exists(C.code.coding C where C in "Dental Conditions")
			and First(C.clinicalStatus.coding).code.value = 'active'
				and First(C.verificationStatus.coding).code.value = 'confirmed'

define LocalFactors:
  if exists("DentalCaries")
			or exists("DentalConditions")
    		then true
      		else false

define AdverseEffectSialorrhea:
		[AdverseEvent]A
					where A.actuality in {'actual', 'potential'}
      			and First((A.event as CodeableConcept).coding) in "Adverse Effects causing Sialorrhea"


define CheckAdverseEffectSialorrhea:
	"SialorrheaCondition" S
		with "AdverseEffectSialorrhea" A
			such that exists(A.resultingCondition r where r.reference.value = 'Condition/'+S.id.value)

define AdverseEffect:
  if exists("CheckAdverseEffectSialorrhea")
    then true
      else false

define BiofeedbackTherapyProcedure:
	[Procedure]P
		where P.status.value = 'completed'
			and exists(P.code.coding C where C in "Biobehavioral Therapy")

define BiofeedbackTherapy:
  if exists("BiofeedbackTherapyProcedure")
    then true
      else false

define BiofeedbackSuccessfulOutcome:
  "BiofeedbackTherapyProcedure" P
		where (First(P.outcome.coding) in "Successful"
            or First(P.outcome.coding) in "Partially successful")

define BiofeedbackUnsuccessfulOutcome:
  "BiofeedbackTherapyProcedure" P
		where First(P.outcome.coding) in "Unsuccessful"

define PostBiofeedbackImprovement:
  if exists("BiofeedbackSuccessfulOutcome")
    then true
      else if exists("BiofeedbackUnsuccessfulOutcome")
				then false
					else null

define CheckBotoxInjectionAdministration:
	"MedicationAdministrationResources" M
		with "BotoxInjectionProcedure" P
			such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)

define CheckLaryngealBotoxAdministration:
	"MedicationAdministrationResources" M
		with "LaryngealBotoxInjectionProcedure" P
			such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)

define SialorrheaEarlierBotulinumAdministration:
  if ((Last("CheckBotoxInjectionAdministration") is not null
				or Last("CheckLaryngealBotoxAdministration") is not null)
					and exists("SialorrheaCondition"))
						then true
							else null

define SialorrheaSpecifyBotoxAdministration:
	First("SpecifyBotoxAdministrationMedicationCode".coding)

define SialorrheaPostBotoxInjectionSuccessfulOutcome:
	if exists("MedicationAdministrationResources" M
							with "BotoxInjectionProcedure" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and ((First(P.outcome.coding) in "Successful") or First(P.outcome.coding) in "Partially successful"))
											then true
												else false

define SialorrheaPostBotoxInjectionUnsuccessfulOutcome:
	if exists("MedicationAdministrationResources" M
							with "BotoxInjectionProcedure" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and First(P.outcome.coding) in "Unsuccessful")
											then true
												else false

define SialorrheaPostLaryngealSuccessfulBotoxOutcome:
	if exists("MedicationAdministrationResources" M
							with "LaryngealBotoxInjectionProcedure" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and (First(P.outcome.coding) in "Successful" or First(P.outcome.coding) in "Partially successful"))
											then true
												else false

define SialorrheaPostLaryngealUnsuccessfulBotoxOutcome:
	if exists("MedicationAdministrationResources" M
							with "LaryngealBotoxInjectionProcedure" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and First(P.outcome.coding) in "Unsuccessful")
											then true
												else false

define SialorrheaPostBotoxImprovement:
	if ((("SialorrheaPostBotoxInjectionSuccessfulOutcome" = true) or "SialorrheaPostLaryngealSuccessfulBotoxOutcome" = true)
				and exists("SialorrheaCondition"))
					then true
						else if ((("SialorrheaPostBotoxInjectionUnsuccessfulOutcome" = true) or "SialorrheaPostLaryngealUnsuccessfulBotoxOutcome" = true)
							and exists("SialorrheaCondition"))
								then false
									else null

define "GlycopyrrolateDrugResources":
	[MedicationAdministration]M
	where M.subject.reference.value = 'Patient/'+ Patient.id.value
	and M.status.value = 'completed'
	and First((M.medication as CodeableConcept).coding) in "Glycopyrrolate"

define "GlycopyrrolateMedicationResources":
	[Medication]med where (First(med.code.coding) in "Glycopyrrolate") is not null

define "SialorrheaInjectionProcedureResources":
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and First(P.code.coding) in "Sialorrhea Injection Procedures"

define "CheckGlycopyrrolateAdministration":
	"GlycopyrrolateDrugResources" M
	with "SialorrheaInjectionProcedureResources" P
	such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)

define "GlycopyrrolateMedication":
  if Last("CheckGlycopyrrolateAdministration") is not null
	then true
	else null

define SpecifyGlycopyrrolateMedicationCode:
		"GlycopyrrolateDrugResources".medication M

define SpecifyGlycopyrrolateMedication:
	First("SpecifyGlycopyrrolateMedicationCode".coding)

define PostGlycopyrrolateSuccessfulOutcome:
	if exists("GlycopyrrolateDrugResources" M
							with "SialorrheaInjectionProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and ((Last(P.outcome.coding) in "Successful") or Last(P.outcome.coding) in "Partially successful"))
					then true
						else false

define PostGlycopyrrolateUnsuccessfulOutcome:
	if exists("GlycopyrrolateDrugResources" M
							with "SialorrheaInjectionProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and Last(P.outcome.coding) in "Unsuccessful")
					then true
						else false

define "PostGlycopyrrolateImprovement":
	if "PostGlycopyrrolateSuccessfulOutcome" = true
		then true
			else if "PostGlycopyrrolateUnsuccessfulOutcome" = true
				then false
					else null

define "ScopolamineDrugResources":
	[MedicationAdministration]M
	where M.subject.reference.value = 'Patient/'+ Patient.id.value
	and M.status.value = 'completed'
	and First((M.medication as CodeableConcept).coding) in "Scopolamine"

define "ScopolamineMedicationResources":
	[Medication]med where (First(med.code.coding) in "Scopolamine") is not null

define "ScopolamineProcedureResources":
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and (First(P.code.coding) in "Procedure for Medication Administration"
					or First(P.code.coding) in "Sialorrhea Injection Procedures")

define "CheckScopolamineAdministration":
	"ScopolamineDrugResources" M
	with "SialorrheaInjectionProcedureResources" P
	such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)

define "ScopolamineMedication":
  if Last("CheckScopolamineAdministration") is not null
	then true
	else null

define SpecifyScopolamineMedicationCode:
		"ScopolamineDrugResources".medication M

define SpecifyScopolamineMedication:
	First("SpecifyScopolamineMedicationCode".coding)

define PostScopolamineSuccessfulOutcome:
	if exists("ScopolamineDrugResources" M
							with "SialorrheaInjectionProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and ((Last(P.outcome.coding) in "Successful") or Last(P.outcome.coding) in "Partially successful"))
					then true
						else false

define PostScopolamineUnsuccessfulOutcome:
	if exists("ScopolamineDrugResources" M
							with "SialorrheaInjectionProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and Last(P.outcome.coding) in "Unsuccessful")
					then true
						else false

define "PostScopolamineImprovement":
	if "PostScopolamineSuccessfulOutcome" = true
		then true
			else if "PostScopolamineUnsuccessfulOutcome" = true
				then false
					else null

define MyastheniaGravis:
	[Condition]S
		where exists(S.code.coding C where C in "Myasthenia Gravis")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define "HyperthyroidismCondition":
  [Condition]S
		where exists(S.code.coding C where C in "Hyperthyroidism")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define GlaucomaCondition:
  [Condition]S
		where exists(S.code.coding C where C in "Glaucoma")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define BenignProstaticHyperplasia:
  [Condition]S
		where exists(S.code.coding C where C in "Benign Prostatic Hyperplasia")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define HypertensionCondition:
  [Condition]S
		where exists(S.code.coding C where C in "Hypertension")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define UrinaryTractBlockage:
  [Condition]S
		where exists(S.code.coding C where C in "Urinary Tract Blockage")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define Tachycardia:
  [Condition]S
		where exists(S.code.coding C where C in "Tachycardia (ICD10CM)")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define HeartFailure:
  [Condition]S
		where exists(S.code.coding C where C in "Heart Failure")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define DryMouth:
  [Condition]S
		where exists(S.code.coding C where C in "Dry Mouth")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define HiatalHernia:
  [Condition]S
		where exists(S.code.coding C where C in "Hiatal Hernia")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define ConstipationCondition:
  [Condition]S
		where exists(S.code.coding C where C in "Constipation")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define DownSyndrome:
  [Condition]S
		where exists(S.code.coding C where C in "Down Syndrome")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define SialorrheaAnticholinergicContraindications:
	if exists("MyastheniaGravis")
		then 'Myasthenia Gravis'
			else if exists("HyperthyroidismCondition")
				then 'Hyperthyroidism'
					else if exists("GlaucomaCondition")
						then 'Glaucoma'
							else if exists("BenignProstaticHyperplasia")
								then 'Enlarged Prostate'
									else if exists("HypertensionCondition")
										then 'Hypertension'
											else if exists("UrinaryTractBlockage")
												then 'Urinary Tract Blockage'
													else if exists("Tachycardia")
														then 'Tachycardia'
															else if exists("HeartFailure")
																then 'Heart Failure'
																	else if exists("DryMouth")
																		then 'Dry Mouth'
																			else if exists("HiatalHernia")
																				then 'Hiatal Hernia'
																					else if exists("ConstipationCondition")
																						then 'Constipation'
																							else if exists("DownSyndrome")
																								then 'Down Syndrome'
																									else ''

//ACHALASIA
define HypertensiveLOSCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Hypertensive LOS")
              and First(C.clinicalStatus.coding).code.value = 'active'
			          and First(C.verificationStatus.coding).code.value = 'confirmed'

define HypertensiveLOS:
	if exists("HypertensiveLOSCondition")
		then true
			else false

define MalnutritionCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Malnutrition")
              and First(C.clinicalStatus.coding).code.value = 'active'
			          and First(C.verificationStatus.coding).code.value = 'confirmed'

define OesophagealBiopsy:
	[Procedure]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
 				and P.status.value = 'completed'
						and First(P.code.coding) in "Oesophageal Biopsy"

define EsophagusDisease:
	[Condition]C
    where exists(C.code.coding C where C in "Esophagus Disease Codes")
              and First(C.clinicalStatus.coding).code.value = 'active'
			          and First(C.verificationStatus.coding).code.value = 'confirmed'

define EpiphrenicDiverticulum:
	[Condition]C
    where exists(C.code.coding C where C in "Epiphrenic Diverticulum")
              and First(C.clinicalStatus.coding).code.value = 'active'
			          and First(C.verificationStatus.coding).code.value = 'confirmed'

define RiskFactorsEsophagealPerforation:
	if (exists("MalnutritionCondition")
				or exists("OesophagealBiopsy")
					or exists("EsophagusDisease")
						or exists("EpiphrenicDiverticulum"))
							then true
								else false

define PneumaticDilation:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and First(P.code.coding) in "Pneumatic Dilation"

define SurgicalMyotomy:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and First(P.code.coding) in "Surgical Myotomy Codes"

define AchalasiaProcedures:
	if exists("PneumaticDilation")
		then 'Pneumatic Dilation'
			else if exists("SurgicalMyotomy")
				then 'Surgical Myotomy'
					else ''

define PostPneumaticDilationImprovement:
	"PneumaticDilation" P
		where First(P.outcome.coding) in "Unsuccessful"

define PostSurgicalMyotomyImprovement:
	"SurgicalMyotomy" P
		where First(P.outcome.coding) in "Unsuccessful"

define AchalasiaPostProceduresImprovement:
	if exists("PostPneumaticDilationImprovement")
		or exists("PostSurgicalMyotomyImprovement")
			then false
				else true

define AchalasiaEarlierBotulinumAdministration:
  if (Last("CheckBotoxAdministration") is not null
				and exists("AchalasiaCondition"))
	then true
	else false

define AchalasiaSpecifyBotoxAdministration:
	"SpecifyBotoxAdministrationMedicationCode".coding M
		return (M.display.value)

define AchalasiaPostBotoxOutcome:
	if exists("MedicationAdministrationResources" M
							with "ProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and First(P.outcome.coding) in "Unsuccessful")
					then false
						else true

define AchalasiaPostBotoxImprovement:
	if ("AchalasiaPostBotoxOutcome" = true
				and exists("AchalasiaCondition"))
					then true
						else false

//ANAL FISSURE
define DurationOfAnalFissure:
	[Condition]S
		where exists(S.code.coding C where C in "AnalFissure Codes")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'
					and duration in days of Interval[start of "Normalize Interval"(S.onset),start of "Normalize Interval"(S.abatement)] > 60 days
						//and "Normalize Interval"(S.onset) after (Today()-120 days)

define CheckDurationOfAnalFissure:
	if exists("DurationOfAnalFissure")
		then true
			else false

define FiberSupplementDrugResources:
		[MedicationAdministration]M
			where M.subject.reference.value = 'Patient/'+ Patient.id.value
				and M.status.value = 'completed'
					and First((M.medication as CodeableConcept).coding) in "Fiber Supplements RXNORM Codes"

define FiberMedicationResources:
	[Medication]med where (First(med.code.coding) in "Fiber Supplements RXNORM Codes") is not null

define FiberProcedureResources:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and First(P.code.coding) in "Procedure for Medication Administration"

define CheckFiberAdministration:
	"FiberSupplementDrugResources" M
		with "FiberProcedureResources" P
			such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)

define StoolSoftenersDrugResources:
		[MedicationAdministration]M
			where M.subject.reference.value = 'Patient/'+ Patient.id.value
				and M.status.value = 'completed'
					and First((M.medication as CodeableConcept).coding) in "Stool softeners and laxatives"

define StoolSoftenersMedicationResources:
	[Medication]med where (First(med.code.coding) in "Stool softeners and laxatives") is not null

define StoolSoftenersProcedureResources:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and First(P.code.coding) in "Procedure for Medication Administration"

define CheckStoolSoftenersAdministration:
	"StoolSoftenersDrugResources" M
		with "StoolSoftenersProcedureResources" P
			such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)

define SitzBath:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and First(P.code.coding) in "Sitz Bath"

define TopicalAnaestheticApplication:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and First(P.code.coding) in "Topical Anaesthetic Application"

define ConservativeTreatmentOptions:
  if Last("CheckFiberAdministration") is not null
		then 'Fiber Supplements'
			else if Last("CheckStoolSoftenersAdministration")  is not null
				then 'Stool Softeners'
					else if exists("SitzBath")
						then 'Sitz Bath'
							else if exists("TopicalAnaestheticApplication")
								then 'Topical Anaesthetic Application'
									else ''

define PostFiberImprovement:
	"FiberSupplementDrugResources" M
		with "FiberProcedureResources" P
			such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
				and First(P.outcome.coding) in "Unsuccessful"


define PostStoolSoftnersImprovement:
	"StoolSoftenersDrugResources" M
		with "StoolSoftenersProcedureResources" P
			such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
				and First(P.outcome.coding) in "Unsuccessful"

define PostSitzBathImprovement:
	"SitzBath" P
			where First(P.outcome.coding) in "Unsuccessful"

define PostTopicalAnaestheticApplicationImprovement:
	"TopicalAnaestheticApplication" P
			where First(P.outcome.coding) in "Unsuccessful"

define PostConservativeTreatmentImprovement:
	if (exists("PostFiberImprovement")
				or exists("PostStoolSoftnersImprovement")
					or exists("PostSitzBathImprovement")
						or exists("PostTopicalAnaestheticApplicationImprovement"))
							then false
								else true

define AnalFissurePriorBotulinumToxin:
  if (Last("CheckBotoxAdministration") is not null
				and exists("AnalFissureCondition"))
	then true
	else false

define AnalFissureSpecifyBotoxAdministration:
	"SpecifyBotoxAdministrationMedicationCode".coding M
		return (M.display.value)

define AnalFissurePostBotoxOutcome:
	if exists("MedicationAdministrationResources" M
							with "ProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and First(P.outcome.coding) in "Unsuccessful")
					then false
						else true

define AnalFissurePostBotoxImprovement:
	if ("AnalFissurePostBotoxOutcome" = true
				and exists("AnalFissureCondition"))
					then true
						else false

//HYPERHIDROSIS
define SevereSweating:
	[Condition]C
    where exists(C.code.coding C where C in "Generalised Hyperhidrosis")
			and First(C.clinicalStatus.coding).code.value = 'active'
				and First(C.verificationStatus.coding).code.value = 'confirmed'

define CheckSevereSweating:
	if exists("SevereSweating")
		then true
			else false

define DurationOfSweating:
	[Condition]C
    where exists(C.code.coding C where C in "Generalised Hyperhidrosis")
			and First(C.clinicalStatus.coding).code.value = 'active'
				and First(C.verificationStatus.coding).code.value = 'confirmed'
					and duration in days of Interval[start of "Normalize Interval"(C.onset),start of "Normalize Interval"(C.abatement)] > 180 days


define CheckDurationOfSweating:
	if exists("DurationOfSweating")
		then true
			else false

define AnticholinergicDrugResources:
		[MedicationAdministration]M
			where M.subject.reference.value = 'Patient/'+ Patient.id.value
				and M.status.value = 'completed'
					and First((M.medication as CodeableConcept).coding) in "Anticholinergic Medication Codes"

define AnticholinergicMedicationResources:
	[Medication]med where (First(med.code.coding) in "Anticholinergic Medication Codes") is not null

define AnticholinergicProcedureResources:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and First(P.code.coding) in "Procedure for Medication Administration"

define CheckAnticholinergicAdministration:
	"AnticholinergicDrugResources" M
		with "AnticholinergicProcedureResources" P
			such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)

define AnticholinergicMedicationsHyperhydrosis:
  if (Last("CheckAnticholinergicAdministration") is not null
		and exists("HyperhidrosisCondition"))
	then true
	else false

define HyperhydrosisCheckPostAnticholinergicImprovement:
	if exists("AnticholinergicDrugResources" M
							with "AnticholinergicProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and First(P.outcome.coding) in "Unsuccessful")
					then false
						else true

define PostAnticholinergicImprovement:
	if ("HyperhydrosisCheckPostAnticholinergicImprovement" = true
				and exists("HyperhidrosisCondition"))
					then true
						else false

define HyperhydrosisPriorBotulinumToxin:
  if (Last("CheckBotoxAdministration") is not null
				and exists("HyperhidrosisCondition"))
	then true
	else false

define HyperhydrosisSpecifyBotoxAdministration:
	"SpecifyBotoxAdministrationMedicationCode".coding M
		return (M.display.value)

define HyperhydrosisPostBotoxOutcome:
	if exists("MedicationAdministrationResources" M
							with "ProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and First(P.outcome.coding) in "Unsuccessful")
					then false
						else true

define HyperhydrosisPostBotoxImprovement:
	if ("HyperhydrosisPostBotoxOutcome" = true
				and exists("HyperhidrosisCondition"))
					then true
						else false

//URINARY INCONTINENCE
define CheckUrinaryIncontinenceAntiCholinergicTreatment: /*Definitions for these have been defined above under Hyperhydrosis*/
  if (Last("CheckAnticholinergicAdministration") is not null
				and exists("UrinaryIncontinenceCondition"))
		then true
			else false

define PostUrinaryIncontinenceAnticholinergicOutcome:
	if exists("AnticholinergicDrugResources" M
							with "AnticholinergicProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and First(P.outcome.coding) in "Unsuccessful")
					then false
						else true

define PostUrinaryIncontinenceAnticholinergicImprovement:
	if ("PostUrinaryIncontinenceAnticholinergicOutcome" = true
				and exists("UrinaryIncontinenceCondition"))
					then true
						else false

define UrinaryIncontinencePriorBotulinumToxin:
  if (Last("CheckBotoxAdministration") is not null
				and exists("UrinaryIncontinenceCondition"))
	then true
	else false

define UrinaryIncontinenceSpecifyBotoxAdministration:
	"SpecifyBotoxAdministrationMedicationCode".coding M
		return (M.display.value)

define UrinaryIncontinencePostBotoxOutcome:
	if exists("MedicationAdministrationResources" M
							with "ProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and First(P.outcome.coding) in "Unsuccessful")
					then false
						else true

define UrinaryIncontinencePostBotoxImprovement:
	if ("UrinaryIncontinencePostBotoxOutcome" = true
				and exists("UrinaryIncontinenceCondition"))
					then true
						else false

define UrinaryIncontinenceAnticholinergicContraindications:
	if exists("MyastheniaGravis")
		then 'Myasthenia Gravis'
			else if exists("HyperthyroidismCondition")
				then 'Hyperthyroidism'
					else if exists("GlaucomaCondition")
						then 'Glaucoma'
							else if exists("BenignProstaticHyperplasia")
								then 'Enlarged Prostate'
									else if exists("HypertensionCondition")
										then 'Hypertension'
											else if exists("UrinaryTractBlockage")
												then 'Urinary Tract Blockage'
													else if exists("Tachycardia")
														then 'Tachycardia'
															else if exists("HeartFailure")
																then 'Heart Failure'
																	else if exists("DryMouth")
																		then 'Dry Mouth'
																			else if exists("HiatalHernia")
																				then 'Hiatal Hernia'
																					else if exists("ConstipationCondition")
																						then 'Constipation'
																							else if exists("DownSyndrome")
																								then 'Down Syndrome'
																									else ''

//MIGRAINE
define MigraineFacialUnilateral:
if (exists("Request".code.coding C where C in "Chemodenervation of Muscle(s); Muscle(s) innervated by Facial Nerve,Unilateral")
			and exists("MigraineCondition"))
	then true
	else false

define MigraineFacialBilateral:
if (exists("Request".code.coding C where C in "Chemodenervation of Muscle(s); Muscle(s) innervated by Facial, Trigeminal, Cervical, Spinal and Accessory Nerves, Bilateral")
			and exists("MigraineCondition"))
	then true
	else false

define MigraineNeck:
if (exists("Request".code.coding C where C in "Chemodenervation of Neck Muscle(s)")
			and exists("MigraineCondition"))
	then true
	else false

define MigraineMuscleGroups:
	if (("MigraineFacialUnilateral" = true)
				or ("MigraineFacialBilateral"= true))
					then 'Face'
						else if ("MigraineNeck" = true)
							then 'Neck'
								else ''

define MigraineFaceInjectionSide:
	if ("MigraineFacialUnilateral" = true)
		then 'Unilateral'
			else if ("MigraineFacialBilateral"= true)
				then 'Bilateral'
					else ''

define Duration:
		[Condition] C
		where exists(C.code.coding C where C in "Migraine Codes")
		and First(C.clinicalStatus.coding).code.value = 'active'
			and First(C.verificationStatus.coding).code.value = 'confirmed'
			and duration in days of Interval[start of "Normalize Interval"(C.onset),start of "Normalize Interval"(C.abatement)] > 14 days
			//and "Normalize Interval"(C.onset) after (Today()-120 days)

define HeadachesForFifteenDays:
	if exists("Duration")
		then true
			else false

define HeadachesForLastThreeMonths:
		if (Count("Duration") > 2)
			then true
			else false

define TriptanMedicationResources:
		[MedicationAdministration]M
	where M.subject.reference.value = 'Patient/'+ Patient.id.value
	and M.status.value = 'completed'
	and First((M.medication as CodeableConcept).coding) in "Triptan Medications"

define TriptanProcedureResources:
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value = 'completed'
		and First(P.code.coding) in "Migraine Prophylaxis"

define CheckTriptanAdministration:
	"TriptanMedicationResources" M
		with "TriptanProcedureResources" P
			such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)

define ConventionalTreatment:
  if (Last("CheckTriptanAdministration") is not null
				and exists("MigraineCondition"))
					then true
						else false

define ConventionalTreatmentImprovement:
	if exists("TriptanMedicationResources" M
							with "TriptanProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and First(P.outcome.coding) in "Unsuccessful")
					then false
						else true

define MigrainePriorBotoxTreatment:
		exists([Procedure]P
				with [Procedure]R
				such that P.status.value = 'completed'
				and R.status.value = 'completed'
				and ((exists(P.code.coding C where C in "Botox Injection Procedure")
							and exists(R.code.coding C where C in "Botox Injection Procedure"))
						or
						(exists(P.code.coding C where C in "Botox Injection Procedure")
							and exists(R.code.coding C where C in "Botox Injection Procedure"))
						or
						(exists(P.code.coding C where C in "Botox Injection Procedure")
							and exists(R.code.coding C where C in "Botox Injection Procedure"))
					)
				and First(P.outcome.coding) in "Unsuccessful"
				and First(R.outcome.coding) in "Unsuccessful"
				and "Normalize Interval"(P.performed) starts before "Normalize Interval"(R.performed))
				//and "Normalize Interval"(R.performed) starts after (Today()-1 year))

define MigrainePostBotoxImprovement:
	exists([Procedure]P
				where P.status.value = 'completed'
				and exists(P.code.coding C where C in "Botox Injection Procedure")
				and First(P.outcome.coding) in "Successful")

define MigraineCheckPriorBotoxTreatment:
	if (("MigrainePriorBotoxTreatment" = true
					or "MigrainePostBotoxImprovement" = true)
						and exists("MigraineCondition"))
					then true
						else false

define MigraineCheckPostBotoxImprovement:
	if (exists("MigraineCondition")
				and ("MigrainePostBotoxImprovement" = true))
					then true
						else false

define MigraineTreatmentFailures:
			if (("MigrainePriorBotoxTreatment" = true)
						and exists("MigraineCondition"))
							then true
								else false

//STRABISMUS
define BinocularVision:
	exists([Condition]S
		where exists(S.code.coding C where C in "Binocular Vision Codes")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed')

define StrabismusCorrectionProcedure:
[Procedure]P
		where P.status.value = 'completed'
			and exists(P.code.coding C where C in "Strabismus Surgery Codes")

define StrabismusSurgery:
	if exists("StrabismusCorrectionProcedure")
		then true
			else false

define StrabismusSurgeryOutcome:
  "StrabismusCorrectionProcedure" P
		where (First(P.outcome.coding) in "Unsuccessful")

define PostStrabismusSurgeryImprovement:
  if exists("StrabismusSurgeryOutcome")
    then false
      else true

define StrabismusPriorBotulinumToxin:
  if (Last("CheckBotoxAdministration") is not null
				and exists("StrabismusCondition"))
	then true
	else false

define StrabismusSpecifyBotoxAdministration:
	"SpecifyBotoxAdministrationMedicationCode".coding M
		return (M.display.value)

define StrabismusPostBotoxOutcome:
	if exists("MedicationAdministrationResources" M
							with "ProcedureResources" P
								such that exists(P.partOf PO where PO.reference.value = 'MedicationAdministration/'+M.id.value)
 										and First(P.outcome.coding) in "Unsuccessful")
					then false
						else true

define StrabismusPostBotoxImprovement:
	if ("StrabismusPostBotoxOutcome" = true
				and exists("StrabismusCondition"))
					then true
						else false

//BOTOX ALLERGY
define BotoxAllergyIntolerance:
	exists([AllergyIntolerance]A
		where First(A.clinicalStatus.coding).code.value = 'active'
    and exists(A.code.coding x where x in "Allergy to Clostridium Botulinum"))

define BotoxAllergy:
	if ("BotoxAllergyIntolerance"  is true)
	then true
	else false

/*define function "Normalize Interval"(choice Choice<FHIR.dateTime, FHIR.Age, FHIR.Period, FHIR.Range, FHIR.string>):
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
	  else null*/

define function "Normalize Interval"(onset Choice<FHIR.dateTime, FHIR.date, FHIR.Age, FHIR.Period, FHIR.Range, FHIR.string>):
	if onset is FHIR.date then
	  Interval[ToDateTime(onset as FHIR.date), ToDateTime(onset as FHIR.date)]
        else if onset is FHIR.dateTime then
	  Interval[FHIRHelpers.ToDateTime(onset as FHIR.dateTime), FHIRHelpers.ToDateTime(onset as FHIR.dateTime)]
	else if onset is FHIR.Period then
	  FHIRHelpers.ToInterval(onset as FHIR.Period)
	else if onset is FHIR.Age then
	  Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(onset as FHIR.Age),
		  FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(onset as FHIR.Age) + 1 year)
	else null
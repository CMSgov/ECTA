library VeinAblation version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Oral venoactive drugs": '2.16.840.1.113883.3.6037.1001.23.99.85'
valueset "Weight Loss (ICD10CM)": '2.16.840.1.113762.1.4.1146.703'
valueset "Daily exercise plan": '2.16.840.1.113883.3.6037.1001.23.99.87'
valueset "Periodic leg elevation": '2.16.840.1.113883.3.6037.1001.23.99.88'
valueset "Compression Therapy":  '2.16.840.1.113883.3.6037.1001.23.99.89'
valueset "Ulceration": '2.16.840.1.113883.3.6037.1001.23.99.90'
valueset "Chronic Pain": '2.16.840.1.113883.3.6037.1001.23.99.91'
valueset "Edema": '2.16.840.1.113883.3.6037.1001.23.99.92'
valueset "Bleeding": '2.16.840.1.113883.3.6037.1001.23.99.93'
valueset "Saphenous Reflux": '2.16.840.1.113883.3.6037.1001.23.99.94'
valueset "Superficial varicosity": '2.16.840.1.113883.3.6037.1001.23.99.95'
valueset "Superficial phlebitis": '2.16.840.1.113883.3.6037.1001.23.99.96'
valueset "Stasis dermatitis": '2.16.840.1.113883.3.6037.1001.23.99.97'
valueset "Perforator reflux": '2.16.840.1.113883.3.6037.1001.23.99.99'
valueset "Deep venous thromboembolism": '2.16.840.1.113883.3.6037.1001.23.95.1'
valueset "Duplex studies of venous system": '2.16.840.1.113883.3.6037.1001.23.95.2'
valueset "Sclerotherapy": '2.16.840.1.113883.3.6037.1001.23.95.3'
valueset "Hereditary hemorrhagic telangiectasia": '2.16.840.1.113883.3.6037.1001.23.95.4'
valueset "Venous Stripping": '2.16.840.1.113883.3.6037.1001.23.95.5'
valueset "Varicose veins of bilateral lower extremities with pain": '2.16.840.1.113883.3.6037.1001.23.95.7'
valueset "Phlebitis and thrombophlebitis": '2.16.840.1.113883.3.6037.1001.23.95.8'
valueset "Klippel-Trenaunay Syndrome": '2.16.840.1.113883.3.6037.1001.23.95.14'
valueset "Congenital venous abnormalities": '2.16.840.1.113883.3.6037.1001.23.95.15'
valueset "Pregnancy equivalent diagnoses": '2.16.840.1.113762.1.4.1138.480'

valueset "VeinAblationPrimaryConditions": 'veinablation-primary-codes'
valueset "Venous insufficiency": 'venous-insufficiency'
valueset "Stasis Ulcer Lower Leg": 'stasis-ulcer-lower-leg'
valueset "Pain Varicode Vein Lower Leg": 'pain-varicose-vein-lower-leg'
valueset "Edema Lower Leg": 'edema-lower-leg'
valueset "Difficulty in daily activities": 'difficulty-in-daily-activities'
valueset "Superficial Phlebitis": 'superficial-phlebitis'
valueset "Stasis Dermatitis": 'stasis-dermatitis'
valueset "Dependent Edema": 'dependent-edema'
valueset "Lower Limb Structure": 'lower-limb-structure'
valueset "Bleeding Diseased Lower Vessels": 'bleeding-diseased-lower-vessels'
valueset "Bleeding Ruptured Superficial Varicosity": 'bleeding-ruptured-superficial-varicosity'
valueset "Localized Edema Fluid Overload" : 'localized-edema-fluid-overload'
valueset "Atherosclerosis of artery of lower limb" : 'atherosclerosis-artery-lower-limb'
valueset "Lymphedema of lower extremity" : 'lymphedema-lower-extremity'
valueset "VeinAblation not necessary conditions": 'veinablation-not-necessary-conditions'
valueset "Weight Reduction": 'weight-reduction'
valueset "Prescribed Physical Activity": 'prescribed-physical-activity'
valueset "Graduated compression therapy": 'graduated-compression-therapy'
valueset "Elevation of Legs": 'elevation-of-legs'
valueset "Vein Ablation ServiceRequestCodes": 'veinablation-serviceRequest-codes'


context Patient

define VeinAblationRequest:
	First([ServiceRequest])

define "ServiceRequestCode":
    FHIRHelpers.ToCode(First("VeinAblationRequest".code.coding))

define VeinAblationEncounter:
	First([Encounter]E where 'Encounter/' + E.id.value = "VeinAblationRequest".encounter.reference.value)
	
define function "GetId"(uri String):
	Last(Split(uri, '/'))
		
define function "EncounterDiagnosis"(Encounter Encounter):
	Encounter.diagnosis D
	return First([Condition]C
				where C.id.value = "GetId"(D.condition.reference.value)
					and FHIRHelpers.ToInteger(D.rank) = 2)

define ServiceCondition:
	"EncounterDiagnosis"("VeinAblationEncounter")

define ServiceDiagnosis:
	// if (ServiceCondition != null) then First("ServiceCondition" S
	// 			 where FHIRHelpers."ToCode"(First(S.code.coding)) in "VeinAblationPrimaryConditions")
	// else First([Condition] C where FHIRHelpers."ToCode"(First(C.code.coding)) in "VeinAblationPrimaryConditions")

	First([Condition]C
		 where First(C.code.coding).code in "VeinAblationPrimaryConditions")

define SupportingSymptomaticDiagnosis:
	"ServiceDiagnosis".code.coding

define PresenceOfVenousInsufficiency:
	if (First([Condition]C
		 where First(C.code.coding).code in "Venous insufficiency") != null) then true else false

define LowerExtremityDiseasedVesselSymptoms:
  { ( if (First([Condition]C
		 where First(C.code.coding).code in "Stasis Ulcer Lower Leg") != null) then '1237117000' 
      else ''
  ), ( if ((First([Condition]C
		 where First(C.code.coding).code in "Pain Varicode Vein Lower Leg") != null) and
		 (First([Condition]C
		 where First(C.code.coding).code in "Edema Lower Leg") != null) and 
		 (First([Condition]C
		 where First(C.code.coding).code in "Difficulty in daily activities") != null)) then 'pain-edema' 
      else ''
  ), ( if (First([Condition]C
		 where First(C.code.coding).code in "Superficial Phlebitis") != null) then '40283005' 
      else ''
  ), ( if (First([Condition]C
		 where First(C.code.coding).code in "Stasis Dermatitis") != null) then '35498005' 
      else ''
  ), ( if (First([Condition]C
		 where First(C.code.coding).code in "Dependent Edema") != null) then 'refractory-edema' 
      else ''
  ), ( if (First([Condition]C
		 where First(C.code.coding).code in "Bleeding Diseased Lower Vessels") != null) then 'bleeding-diseased-lower-vessels' 
      else ''
  ), ( if (First([Condition]C
		 where First(C.code.coding).code in "Bleeding Ruptured Superficial Varicosity") != null) then 'bleeding-ruptured-varicosity' 
      else ''
  ) }

define PresenceOfEvidenceForEdemaOrUlceration:
	if (First([Condition]C
		 where First(C.code.coding).code in "Localized Edema Fluid Overload" and First(C.bodySite.coding) in "Lower Limb Structure") != null ) then 'presence' 
	else if (First([Condition]C
		 where First(C.code.coding).code in "Atherosclerosis of artery of lower limb") != null ) then 'presence' 
	else if (First([Condition]C
		 where First(C.code.coding).code in "Lymphedema of lower extremity") != null ) then 'presence' 
	else 'absence'

define NonVeinAblationConditions:
	if (First([Condition]C
		 where First(C.code.coding).code in "VeinAblation not necessary conditions") != null ) then 
		 First((First([Condition]C
		 where First(C.code.coding).code in "VeinAblation not necessary conditions")).code.coding).code
	else 'N'

define ConservativeTreatments:
	if (First([Procedure]P
		 where First(P.code.coding) in "Weight Reduction") != null ) then '388976009'
	else if (First([Procedure]P
		 where First(P.code.coding) in "Prescribed Physical Activity") != null ) then 
		 First((First([Condition]C
		 where First(C.code.coding).code in "Prescribed Physical Activity")).code.coding).code
	else if (First([Procedure]P
		 where First(P.code.coding) in "Graduated compression therapy") != null ) then '229509005'
	else if (First([Procedure]P
		 where First(P.code.coding) in "Elevation of Legs") != null ) then 
		 First((First([Condition]C
		 where First(C.code.coding).code in "Elevation of Legs")).code.coding).code
	else ''

define CT:
	First([Condition]C
		where ( First(C.code.coding).code in "Weight Loss (ICD10CM)"
			or First(C.code.coding).code in "Periodic leg elevation")
			and First(C.clinicalStatus.coding).code.value = 'active')

define MedicationUsed:
	First([MedicationAdministration]M
			where ((M.medication as CodeableConcept) in "Oral venoactive drugs")
			or exists([Medication:"Oral venoactive drugs" ]med where (M.medication as Reference).reference = 'Medication/'+med.id))

define ExercisePlan:
		First([Procedure]P
				where P.status.value = 'completed'
				and First(P.code.coding) in "Daily exercise plan")


define PeriodicLegElevation:
	First(([Condition]C
		with [Procedure]P
		such that First(C.code.coding).code in "Periodic leg elevation"
			and First(P.code.coding) in "Compression Therapy"
			and P.status.value = 'completed'))
			
define VenousStasis:
	First([Condition]C
		with [Condition]D
			such that First(C.code.coding).code in "Ulceration"
			and First(D.code.coding) in "Venous insufficiency")
			
define SaphenousReflux:
	First([Condition]C
		with [Condition]D
			such that (First(C.code.coding).code in "Chronic Pain"
					or First(C.code.coding).code in "Edema")
			and First(D.code.coding) in "Venous insufficiency")
	
define SuperficialVaricosity:
	First([Condition]C
		with [Condition]D
			such that First(C.code.coding).code in "Bleeding"
			and First(D.code.coding) in "Saphenous Reflux")
			
define SuperficialPhlebitis:
	First([Condition]C
		where First(C.code.coding).code in "Superficial phlebitis"
			and First(C.clinicalStatus.coding).code.value = 'recurrence')
			
define StasisDermatitis:
	First([Condition]C
		where First(C.code.coding).code in "Superficial phlebitis"
			and First(C.clinicalStatus.coding).code.value = 'active')
	
define RefractoryEdema:
	First([Condition]C
		with [Condition]D
			such that (First(C.code.coding).code in "Dependent Edema")
			and First(D.code.coding) in "Venous insufficiency")
				
define PerforatorReflux:
	First([Condition]C
		where First(C.code.coding).code in "Perforator reflux")
		
define VeinStripping:
	First([Condition]C
		where First(C.code.coding).code in "Venous Stripping")
		
define SuperficialVeinTreatment:
	First([Condition]C
		with [Procedure]P
		such that First(P.code.coding) in "Compression Therapy"
		 and First(C.code.coding).code in "Phlebitis and thrombophlebitis"
		 and "LengthInDays"("Normalize Interval Procedure"(P.performed)) > 90 days)
		 
define DeepVenousThromboembolism:
	First([Condition]C
		without [Condition]D
			such that (First(C.code.coding).code in "Deep venous thromboembolism")
			and First(D.code.coding) in "Venous insufficiency")
			
define DuplexStudy:
	First([Procedure]P
		where First(P.code.coding) in "Duplex studies of venous system"
		and P.status.value = 'completed')
		
define KTSyndrome:
	First([Condition]C
		where (First(C.code.coding).code in "Klippel-Trenaunay Syndrome"
			or First(C.code.coding).code in "Congenital venous abnormalities"))
		
define Pregnancy:
	First([Condition]C
		where First(C.code.coding).code in "Pregnancy equivalent diagnoses"
		and First(C.clinicalStatus.coding).code.value = 'active')
			
define Telangiectasis:
	First([Condition]C
		with [Condition]D
			such that First(C.code.coding).code in "Bleeding"
			and First(D.code.coding) in "Hereditary hemorrhagic telangiectasia")
			
define function "Normalize Onset"(onset Choice<FHIR.dateTime, FHIR.Age, FHIR.Period, FHIR.Range, FHIR.string>):
  if onset is FHIR.dateTime then
	  Interval[FHIRHelpers.ToDateTime(onset as FHIR.dateTime), FHIRHelpers.ToDateTime(onset as FHIR.dateTime)]
	else if onset is FHIR.Period then
	  FHIRHelpers.ToInterval(onset as FHIR.Period)
	else if onset is FHIR.string then
    Message(null as Interval<DateTime>, true, '1', 'Error', 'Cannot compute an interval from a String value')
	else if onset is FHIR.Age then
	  Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(onset as FHIR.Age),
		  FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(onset as FHIR.Age) + 1 year]
	else if onset is FHIR.Range then
	  Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((onset as FHIR.Range).low),
		  FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((onset as FHIR.Range).high) + 1 year]
	else null

define function "Normalize Interval Procedure"(choice Choice<FHIR.dateTime, FHIR.Age, FHIR.Period, FHIR.Range, FHIR.string>):
 	 if choice is FHIR.dateTime then
 		  Interval[FHIRHelpers.ToDateTime(choice as FHIR.dateTime), FHIRHelpers.ToDateTime(choice as FHIR.dateTime)]
	  else if choice is FHIR.Period then
		  FHIRHelpers.ToInterval(choice as FHIR.Period)
		else if choice is FHIR.string then
    Message(null as Interval<DateTime>, true, '1', 'Error', 'Cannot compute an interval from a String value')
	  else if choice is FHIR.Age then
	 	  Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(choice as FHIR.Age),
 		FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(choice as FHIR.Age) + 1 year]
		else if choice is FHIR.Range then
	  Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((choice as FHIR.Range).low),
		  FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((choice as FHIR.Range).high) + 1 year]
	  else null
	  
define function "LengthInDays"(Value Interval<DateTime>):
	difference in days between start of Value and end of Value
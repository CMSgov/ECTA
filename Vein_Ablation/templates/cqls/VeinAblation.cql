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
valueset "Dependent edema": '2.16.840.1.113883.3.6037.1001.23.99.98'
valueset "Perforator reflux": '2.16.840.1.113883.3.6037.1001.23.99.99'
valueset "Deep venous thromboembolism": '2.16.840.1.113883.3.6037.1001.23.95.1'
valueset "Duplex studies of venous system": '2.16.840.1.113883.3.6037.1001.23.95.2'
valueset "Sclerotherapy": '2.16.840.1.113883.3.6037.1001.23.95.3'
valueset "Hereditary hemorrhagic telangiectasia": '2.16.840.1.113883.3.6037.1001.23.95.4'
valueset "Venous Stripping": '2.16.840.1.113883.3.6037.1001.23.95.5'
valueset "Venous insufficiency (chronic) (peripheral)": '2.16.840.1.113883.3.6037.1001.23.95.6'
valueset "Varicose veins of bilateral lower extremities with pain": '2.16.840.1.113883.3.6037.1001.23.95.7'
valueset "Phlebitis and thrombophlebitis": '2.16.840.1.113883.3.6037.1001.23.95.8'
valueset "Klippel-Trenaunay Syndrome": '2.16.840.1.113883.3.6037.1001.23.95.14'
valueset "Congenital venous abnormalities": '2.16.840.1.113883.3.6037.1001.23.95.15'
valueset "Pregnancy equivalent diagnoses": '2.16.840.1.113762.1.4.1138.480'


parameter "ServiceRequest" ServiceRequest
parameter "QuestionnaireResponse" QuestionnaireResponse

context Patient

define ServiceEncounter:
	First([Encounter]E where 'Encounter/' + E.id.value = "ServiceRequest".encounter.reference.value)
	
define function "GetId"(uri String):
	Last(Split(uri, '/'))
		
define function "EncounterDiagnosis"(Encounter Encounter):
	Encounter.diagnosis D
	return First([Condition]C
				where C.id.value = "GetId"(D.condition.reference.value)
					and FHIRHelpers.ToInteger(D.rank) = 2)

define ServiceCondition:
	"EncounterDiagnosis"("ServiceEncounter")

define ServiceDiagnosis:
	First("ServiceCondition" S
			where (First(S.code.coding) in "Chronic Pain" 
			or First(S.code.coding) in "Ulceration"
			or First(S.code.coding) in "Edema"
			or First(S.code.coding) in "Bleeding"
			or First(S.code.coding) in "Saphenous Reflux"
			or First(S.code.coding) in "Superficial varicosity"
			or First(S.code.coding) in "Superficial phlebitis"
			or First(S.code.coding) in "Stasis dermatitis"
			or First(S.code.coding) in "Dependent edema"
			or First(S.code.coding) in "Perforator reflux"
			or First(S.code.coding) in "Deep venous thromboembolism"
			or First(S.code.coding) in "Hereditary hemorrhagic telangiectasia"
			or First(S.code.coding) in "Phlebitis and thrombophlebitis"
			or First(S.code.coding) in "Varicose veins of bilateral lower extremities with pain"
			or First(S.code.coding) in "Congenital venous abnormalities"
			or First(S.code.coding) in "Pregnancy equivalent diagnoses"))

define RelevantDiagnosis:
	"ServiceDiagnosis".code.coding[0].display.value

define CT:
	First([Condition]C
		where ( First(C.code.coding) in "Weight Loss (ICD10CM)"
			or First(C.code.coding) in "Periodic leg elevation")
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
		such that First(C.code.coding) in "Periodic leg elevation"
			and First(P.code.coding) in "Compression Therapy"
			and P.status.value = 'completed'))
			
define VenousStasis:
	First([Condition]C
		with [Condition]D
			such that First(C.code.coding) in "Ulceration"
			and First(D.code.coding) in "Venous insufficiency (chronic) (peripheral)")
			
define SaphenousReflux:
	First([Condition]C
		with [Condition]D
			such that (First(C.code.coding) in "Chronic Pain"
					or First(C.code.coding) in "Edema")
			and First(D.code.coding) in "Venous insufficiency (chronic) (peripheral)")
	
define SuperficialVaricosity:
	First([Condition]C
		with [Condition]D
			such that First(C.code.coding) in "Bleeding"
			and First(D.code.coding) in "Saphenous Reflux")
			
define SuperficialPhlebitis:
	First([Condition]C
		where First(C.code.coding) in "Superficial phlebitis"
			and First(C.clinicalStatus.coding).code.value = 'recurrence')
			
define StasisDermatitis:
	First([Condition]C
		where First(C.code.coding) in "Superficial phlebitis"
			and First(C.clinicalStatus.coding).code.value = 'active')
	
define RefractoryEdema:
	First([Condition]C
		with [Condition]D
			such that (First(C.code.coding) in "Dependent edema")
			and First(D.code.coding) in "Venous insufficiency (chronic) (peripheral)")
				
define PerforatorReflux:
	First([Condition]C
		where First(C.code.coding) in "Perforator reflux")
		
define VeinStripping:
	First([Condition]C
		where First(C.code.coding) in "Venous Stripping")
		
define SuperficialVeinTreatment:
	First([Condition]C
		with [Procedure]P
		such that First(P.code.coding) in "Compression Therapy"
		 and First(C.code.coding) in "Phlebitis and thrombophlebitis"
		 and "LengthInDays"("Normalize Interval Procedure"(P.performed)) > 90 days)
		 
define DeepVenousThromboembolism:
	First([Condition]C
		without [Condition]D
			such that (First(C.code.coding) in "Deep venous thromboembolism")
			and First(D.code.coding) in "Venous insufficiency (chronic) (peripheral)")
			
define DuplexStudy:
	First([Procedure]P
		where First(P.code.coding) in "Duplex studies of venous system"
		and P.status.value = 'completed')
		
define KTSyndrome:
	First([Condition]C
		where (First(C.code.coding) in "Klippel-Trenaunay Syndrome"
			or First(C.code.coding) in "Congenital venous abnormalities"))
		
define Pregnancy:
	First([Condition]C
		where First(C.code.coding) in "Pregnancy equivalent diagnoses"
		and First(C.clinicalStatus.coding).code.value = 'active')
			
define Telangiectasis:
	First([Condition]C
		with [Condition]D
			such that First(C.code.coding) in "Bleeding"
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
		  FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(onset as FHIR.Age) + 1 year)
	else if onset is FHIR.Range then
	  Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((onset as FHIR.Range).low),
		  FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((onset as FHIR.Range).high) + 1 year)
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
 		FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(choice as FHIR.Age) + 1 year)
		else if choice is FHIR.Range then
	  Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((choice as FHIR.Range).low),
		  FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity((choice as FHIR.Range).high) + 1 year)
	  else null
	  
define function "LengthInDays"(Value Interval<DateTime>):
	difference in days between start of Value and end of Value
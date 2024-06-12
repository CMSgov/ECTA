library PanniculectomyDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include Panniculectomy version '1.0.0' called PCommon
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

valueset "Panniculectomy": '2.16.840.1.113883.3.6037.1001.23.99.80'
valueset "Abdominal lipectomy Diagnosis": '2.16.840.1.113883.3.6037.1001.23.99.81'
valueset "Erythema intertrigo": '2.16.840.1.113883.3.6037.1001.23.99.82'
valueset "Panniculectomy related diagnoses": '2.16.840.1.113883.3.6037.1001.23.99.84'

parameter "ServiceRequest" ServiceRequest
parameter "QuestionnaireResponse" QuestionnaireResponse

context Patient

define ServiceEncounter:
	PCommon."ServiceEncounter"

define QualifiedConditions:
	PCommon."QualifiedConditions"

define Intertrigo:
    	PCommon."Intertrigo"
   
define PreviousDiagnosis:
    	PCommon.PreviousDiagnosis

define SurgeryPerformed:
    	PCommon."SurgeryPerformed"
    


define IsSurgeryPerformed:
    if ("SurgeryPerformed" is not null)
    then true
    else false

define BSurgery:
    	PCommon."BSurgery"
    	      

 
define QT:
	"QuestionnaireResponse".item

//significant weight loss
define QA21:
	("QT".item I
		where I.linkId.value = '2.1')QR
		return First(QR.answer).value

// there should be evidence that the individual has maintained a stable weight for at least six months
define QA22:
	("QT".item I
		where I.linkId.value = '2.2')QR
		return First(QR.answer).value

// remains refractory to appropriate medical therapy over a period of three months
define QA23:
    ("QT".item I
		where I.linkId.value = '2.3')QR
		return First(QR.answer).value
// body contouring, weight reduction or the harvest of fat tissue for transfer to another body region
define QA24:
    ("QT".item I
		where I.linkId.value = '2.4')QR
		return First(QR.answer).value

//for alteration of appearance or self-image or physical appearance
define QA25:
    ("QT".item I
		where I.linkId.value = '2.5')QR
		return First(QR.answer).value

define function "GetId"(uri String):
	Last(Split(uri, '/'))
		
define function "EncounterDiagnosis"(Encounter Encounter):
	Encounter.diagnosis D
	return First([Condition]C
				where C.id.value = "GetId"(D.condition.reference.value)
					and FHIRHelpers.ToInteger(D.rank) = 1)

define ServiceCondition:
	"EncounterDiagnosis"("ServiceEncounter")

define ServiceDiagnosis:
	First("ServiceCondition" S
			where (First(S.code.coding) in "Abdominal lipectomy Diagnosis" 
			or First(S.code.coding) in "Erythema intertrigo"
			or First(S.code.coding) in "Panniculectomy related diagnoses"))

define NotCoveredConditions:
	"ServiceDiagnosis" C
		where First(C.code.coding) in "Panniculectomy related diagnoses"
			

define ServiceCode1:
	if ((First("ServiceRequest".code.coding) in "Panniculectomy")
	     and (("QualifiedConditions" is not null) or ("Intertrigo" is not null))
	   )
	then true
	else false



define Limitations:
	if (("NotCoveredConditions" is not null)
		or (("IsSurgeryPerformed" = true) and ("BSurgery" is null))
		or (First("QA22") = false)
		or (First("QA24") = true)
		or (First("QA25") = true)
	   )
		then true
		else false

define PrimaryDecision:
	if (("ServiceCode1" = true)
		and (First("QA23") = true)
	    	and ("Limitations" = false))
	        then true
	        else false

define FinalDecision:
	if ("PrimaryDecision" = true)
		then 'YES'
		else 'NO'


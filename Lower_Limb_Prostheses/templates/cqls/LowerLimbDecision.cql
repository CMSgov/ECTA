library LowerLimbDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include LowerLimbProsthesis version '1.0.0' called LLP

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "ICD-9-CM": 'http://hl7.org/fhir/sid/icd-9'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://bluebutton.cms.gov/resources/codesystem/hcpcs'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'
codesystem "NUCCPT":'https://www.nlm.nih.gov/research/umls/sourcereleasedocs/current/NUCCPT/sourcerepresentation.html'

valueset "Musculoskeletal Assessment": '2.16.840.1.113883.3.7643.3.1031'
valueset "Findings of Neurological Assessment for Orientation or Balance": '2.16.840.1.113883.3.7643.3.1032'
valueset "Immobilization": '2.16.840.1.113883.17.4077.3.2006'
valueset "Serious or Life Threatening Illness": '2.16.840.1.113883.3.464.1003.199.12.1055'
valueset "CardioPulmonary Examination": '2.16.840.1.113883.3.6037.1001.23.95.21'
valueset "Body weight": '2.16.840.1.113762.1.4.1045.159'
valueset "Height": '2.16.840.1.113883.3.464.1003.121.12.1014'
valueset "Face to Face Encounter": '2.16.840.1.113762.1.4.1047.428'
valueset "Inpatient Encounter": '2.16.840.1.113883.3.117.1.7.1.23'
valueset "Right Modifier": '2.16.840.1.113883.3.6037.1001.23.95.24'
valueset "Left Modifier": '2.16.840.1.113883.3.6037.1001.23.95.25'
valueset "Functionality Level 0": '2.16.840.1.113883.3.6037.1001.23.95.26'
valueset "Functionality Level 1": '2.16.840.1.113883.3.6037.1001.23.95.27'
valueset "Functionality Level 2": '2.16.840.1.113883.3.6037.1001.23.95.28'
valueset "Functionality Level 3": '2.16.840.1.113883.3.6037.1001.23.95.29'
valueset "Functionality Level 4": '2.16.840.1.113883.3.6037.1001.23.95.30'
valueset "Physical Examination": '2.16.840.1.113883.3.6037.1001.23.95.31'


parameter "DeviceRequest" DeviceRequest
parameter "QuestionnaireResponse" QuestionnaireResponse
parameter "Claim" Claim

context Patient

define QT:
	"QuestionnaireResponse".item

define DeviceRequestHcpcsCoding: 
    LLP."DeviceRequestHcpcsCoding"


define DateOfOrder: 
    LLP."DateOfOrder"


define DescriptionOfItem: 
    LLP."DescriptionOfItem"


define DeviceOrderType: 
    LLP."DeviceOrderType"

define StartDate: 
    LLP."StartDate"

define Supplier: 
	LLP."Supplier"


define SupplierName: 
	LLP."SupplierName"


define SupplierNPI:
    LLP."SupplierNPI"


define SupplierPTAN: 
    LLP."SupplierPTAN"

    
define SupplierAddressObject: 
	LLP."SupplierAddressObject"


define SupplierAddress: 
	LLP."SupplierAddress"

define ServiceEncounter:
	LLP."ServiceEncounter"


define ServiceCondition:
	LLP."ServiceCondition"


define RelevantDiagnosis:
	LLP."RelevantDiagnosis"

define EncounterResource: 
	LLP."EncounterResource"

define FaceToFaceEncounter:
	LLP."FaceToFaceEncounter"

define FFEncounter:
    LLP."FFEncounter"
        
define InpatientEncounter:
    LLP."InpatientEncounter"

define RightLowerLimb:
    LLP."RightLowerLimb"

define LeftLowerLimb:
    LLP."LeftLowerLimb"

define FL0:
    LLP."FL0"

define FL1:
    LLP."FL1"

define FL2:
    LLP."FL2"

define FL3:
    LLP."FL3"

define FL4:
    LLP."FL4"

define PhysicalExamination:
    LLP."PhysicalExamination"


define PhysicalExaminationType:
    LLP."PhysicalExaminationType"


define ComorbiditiesType:
    LLP."ComorbiditiesType"


define Comorbidities:
    LLP."Comorbidities"


define MobilityDiagnosis: 
    LLP."MobilityDiagnosis"


define Mobility:
    LLP."Mobility"


define MobilityEstimation:
    LLP."MobilityEstimation"


define Musculoskeletal:
    LLP."Musculoskeletal"


define MusculoskeletalAnalysis:
    LLP."MusculoskeletalAnalysis"


define Neurological:
    LLP."Neurological"


define NeurologicalAnalysis:
    LLP."NeurologicalAnalysis"


define CardioPulmonary:
    LLP."CardioPulmonary"


define CardioPulmonaryAnalysis:
    LLP."CardioPulmonaryAnalysis"

define Weight:
    LLP."Weight"

define PatientHeight:
    LLP."PatientHeight"

define QuantityOfItem:
    First("Claim".item).quantity.value

define QA61:
	("QT".item I
		where I.linkId.value = '6.1')QR
		return First(QR.answer).value

define QA62:
	("QT".item I
		where I.linkId.value = '6.2')QR
		return First(QR.answer).value


define CompleteOrderDetails:
    if (("DateOfOrder" is not null)
        and ("DescriptionOfItem" is not null)
        and ("StartDate" is not null))
        then true
        else false

define SupplierDetails:
    if (("SupplierName" is not null)
        and ("SupplierNPI" is not null)
        and ("SupplierAddress" is not null))
        then true
        else false

define ClinicalExamination:
    if (("ServiceCondition" is not null)
        and ("PhysicalExamination" is not null)
        and ("MusculoskeletalAnalysis" = true)
        and ("NeurologicalAnalysis" = true)
        and ("CardioPulmonaryAnalysis" = true)
        and ("Weight" is not null)
        and ("PatientHeight" is not null))
        then true
        else false

define EncounterFaceToFace:
    if (("FFEncounter" = false) and ("FaceToFaceEncounter" is not null)
        or ("FFEncounter" = true) and ("FaceToFaceEncounter" is null))
        then true
        else false

define QualifyingLevel:
    if (((First("QA61").value = 'Left') or (First("QA61").value = 'Right') or (First("QA61").value = 'Both'))
        and ((First("QA62").value  = 'Level 0')
                or (First("QA62").value = 'Level 1')
                 or (First("QA62").value  = 'Level 2')
                  or (First("QA62").value  = 'Level 3')
                   or (First("QA62").value = 'Level 4')))
                   then true
                   else false

define PrimaryDecision:
    if (("CompleteOrderDetails" = true)
        and ("ClinicalExamination" = true)
        and ("QualifyingLevel" = true))
        then true 
        else false

define FinalDecision:
    if ("PrimaryDecision" = true)
    then 'PENDING FOR FURTHER REVIEW'
    else 'PENDING'





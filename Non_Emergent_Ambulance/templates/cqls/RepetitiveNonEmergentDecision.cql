library RepetitiveNonEmergentDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include RepetitiveNonEmergent version '1.0.0' called RepetitiveNonEmergent

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Physician certification for transport": '2.16.840.1.113883.3.6037.1001.23.98.111'
valueset "Destination site": '2.16.840.1.113883.3.6037.1001.23.98.112'
valueset "Origination site": '2.16.840.1.113883.3.6037.1001.23.98.113'
valueset "Medical Reason for Transport": '2.16.840.1.113883.3.6037.1001.23.98.114'

parameter "ServiceRequest" ServiceRequest
parameter "QuestionnaireResponse" QuestionnaireResponse

context Patient

define QT:
	"QuestionnaireResponse".item

define QA22:
	("QT".item I
		where I.linkId.value = '2.2')QR
		return First(QR.answer).value

define QA29:
	("QT".item I
		where I.linkId.value = '2.9')QR
		return First(QR.answer).value

define QA211:
	("QT".item I
		where I.linkId.value = '2.11')QR
		return First(QR.answer).value

define QA33:
	("QT".item I
		where I.linkId.value = '3.3')QR
		return First(QR.answer).value

define QA34:
	("QT".item I
		where I.linkId.value = '3.4')QR
		return First(QR.answer).value

define QA35:
	("QT".item I
		where I.linkId.value = '3.5')QR
		return First(QR.answer).value

define "PCS":
	First([DocumentReference]D
		where D.subject.reference.value = 'Patient/'+ Patient.id.value
		and exists(D.type.coding C where C in "Physician certification for transport"))

define "MedicalReason":
	First([DocumentReference]D
		where D.subject.reference.value = 'Patient/'+ Patient.id.value
		and exists(D.type.coding C where C in "Medical Reason for Transport"))

define "Origination":
	First([DocumentReference]D
		where D.subject.reference.value = 'Patient/'+ Patient.id.value
		and exists(D.type.coding C where C in "Origination site"))

define "Destination":
	First([DocumentReference]D
		where D.subject.reference.value = 'Patient/'+ Patient.id.value
		and exists(D.type.coding C where C in "Destination site"))

define "SupplierDetails":
    if ((RepetitiveNonEmergent."AmbulanceSupplierName")!=''
        and (RepetitiveNonEmergent."AmbulanceSupplierNPI")!=''
        and (RepetitiveNonEmergent."SupplierAddressLine")!=''
        and (RepetitiveNonEmergent."SupplierAddressCity")!=''
        and (RepetitiveNonEmergent."SupplierAddressState")!=''
        and (RepetitiveNonEmergent."SupplierAddressPostalCode")!='')
    then true
    else false

define "PurposeDetails":
    if (exists(ServiceRequest.reasonCode)
        or First("QA22")!='')
    then true
    else false

define "Reasons":
    if (RepetitiveNonEmergent."MobilityBoolean"
        or RepetitiveNonEmergent."MusculoskeletalBoolean"
        or RepetitiveNonEmergent."CardiovascularBoolean"
        or RepetitiveNonEmergent."NeurologicalBoolean"
        or RepetitiveNonEmergent."WoundsBoolean"
        or RepetitiveNonEmergent."AttendantBoolean"
        or RepetitiveNonEmergent."MentalBoolean"
        or First("QA29") is not null
        or First("QA211")!='')
    then true
    else false

define "OtherInfo":
    if (RepetitiveNonEmergent."NumofTransports">0
        and (RepetitiveNonEmergent."TransportTo")!=''
        and First("QA33")!=''
        and (if First("QA34") =true then true else First("QA35")!='')
    )
    then true
    else false

define "Documentation":
	if ("PCS" is not null
		and "MedicalReason" is not null
		and "Origination" is not null
		and "Destination" is not null)
	then true
	else false

define "FinalDecision":
	if ("SupplierDetails"
	    and "PurposeDetails"
	    and "Reasons"
	    and "OtherInfo"
		and "Documentation")
	then 'HUMAN REVIEW'
	else 'NO'



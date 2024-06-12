library SupportSurfaceGroup2 version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Pressure Ulcer Stage 2": '2.16.840.1.113883.3.6037.1001.23.98.115'
valueset "Group 1 support surfaces": '2.16.840.1.113883.3.6037.1001.23.98.116'
valueset "Pressure Ulcer Stage 3 or Stage 4": '2.16.840.1.113883.3.6037.1001.23.98.117'
valueset "Wound Assessment": '2.16.840.1.113883.3.6037.1001.23.98.118'
valueset "Patient Turning and Repositioning": '2.16.840.1.113883.3.6037.1001.23.98.119'
valueset "Management of Incontinence": '2.16.840.1.113883.3.6037.1001.23.98.120'
valueset "Nutritional assessment": '2.16.840.1.113883.3.6037.1001.23.98.121'
valueset "Wound Care": '2.16.840.1.113883.3.6037.1001.23.98.122'
valueset "Stage 2 ulcer count": '2.16.840.1.113883.3.6037.1001.23.98.123'
valueset "Stage 3 ulcer count": '2.16.840.1.113883.3.6037.1001.23.98.124'
valueset "Stage 4 ulcer count": '2.16.840.1.113883.3.6037.1001.23.98.125'
valueset "Myocutaneous flap": '2.16.840.1.113883.3.6037.1001.23.98.126'
valueset "Trunk or hips body structures": '2.16.840.1.113883.3.6037.1001.23.98.127'
valueset "Group 2 or 3 support surfaces": '2.16.840.1.113883.3.6037.1001.23.98.128'
valueset "Medical Record": '2.16.840.1.113883.3.6037.1001.23.98.129'
valueset "Provision of device": '2.16.840.1.113883.3.6037.1001.23.98.130'
valueset "Procedure Unsuccessful": '2.16.840.1.113883.3.6037.1001.23.97.1'

parameter "DeviceRequest" DeviceRequest

context Patient

define "Stage2Ulcer":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Pressure Ulcer Stage 2")

define "Stage3Or4Ulcer":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Pressure Ulcer Stage 3 or Stage 4")

define "RelevantDiagnoses":
	("Stage2Ulcer"
	union "Stage3Or4Ulcer") L
    return (First(L.code.coding).display.value)+'\n'

define "Group1Device":
    [Device]D
        where D.patient.reference.value = 'Patient/'+ Patient.id.value
        and exists(D.type.coding C where C in "Group 1 support surfaces")

define "Group1UsageDevice":
    if exists([DeviceUseStatement])
    then ("Group1Device"D
            with [DeviceUseStatement]DU
            such that DU.device.reference.value = 'Device/'+D.id.value
            and DU.subject.reference.value = 'Patient/'+ Patient.id.value
            and DU.status.value!='entered-in-error'
            and "Normalize Interval"(DU.timing) ends during Interval[Today()-30 days, Today()])
    else null

define "Group1UsageProcedure":
    [Procedure]P
    with "Group1Device"D
    such that P.subject.reference.value = 'Patient/'+ Patient.id.value
        and P.status.value = 'completed'
        and exists(P.code.coding C where C in "Provision of device")
        and (First(P.usedCode R where First(R.coding) in "Group 1 support surfaces") is not null)
            or (First(P.usedReference RR where RR.reference.value = 'Device/'+D.id.value) is not null)

define "Group1ProcedureUsedCodes":
	"Group1UsageProcedure" P
	return ((P.usedCode U where exists(U.coding c where c in "Group 1 support surfaces")) U
					return U.coding[0].display.value+'\n')

define "Group1ProcedureUsedReferences":
	"Group1UsageProcedure" P
	return (("Group1Device"dev with P.usedReference ref
				such that ref.reference.value = 'Device/'+dev.id.value)U
				return U.type.coding[0].display.value+'\n')

define "Group1DeviceUseDisplay":
    "Group1UsageDevice" P
    return First(P.type.coding).display.value+'\n'

define "Group1DeviceUsage":
	("Group1ProcedureUsedCodes" union "Group1ProcedureUsedReferences" union "Group1DeviceUseDisplay")U
	return U

define "WoundAssessmentProcedure":
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value ='completed'
		and exists(P.code.coding C where C in "Wound Assessment")
		and "Normalize Interval"(P.performed) ends during Interval[Today()-30 days, Today()]

define "PatientRepositioning":
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value ='completed'
		and exists(P.code.coding C where C in "Patient Turning and Repositioning")
		and "Normalize Interval"(P.performed) ends during Interval[Today()-30 days, Today()]

define "IncontinenceManagement":
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value ='completed'
		and exists(P.code.coding C where C in "Management of Incontinence")
		and "Normalize Interval"(P.performed) ends during Interval[Today()-30 days, Today()]

define "DietManagement":
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value ='completed'
		and exists(P.code.coding C where C in "Nutritional assessment")
		and "Normalize Interval"(P.performed) ends during Interval[Today()-30 days, Today()]

define "WoundCareProcedure":
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value ='completed'
		and exists(P.code.coding C where C in "Wound Care")
		and "Normalize Interval"(P.performed) ends during Interval[Today()-30 days, Today()]

define "ProgramsUndertaken":
	("WoundAssessmentProcedure"
        union "PatientRepositioning"
        union "IncontinenceManagement"
        union "DietManagement"
        union "WoundCareProcedure") L
    return (First(L.code.coding).display.value)+'\n'

define "UlcerCountStage2":
	Last([Observation]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and P.status.value in {'final', 'amended', 'corrected'}
		and exists(P.code.coding C where C in "Stage 2 ulcer count")
		and Now() during Interval[start of "Normalize Interval"(P.effective),start of "Normalize Interval"(P.effective)+1 day])

define "Stage2UlcerCount":
    FHIRHelpers.ToQuantity("UlcerCountStage2".value).value

define "UlcerCountStage3":
	Last([Observation]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and P.status.value in {'final', 'amended', 'corrected'}
		and exists(P.code.coding C where C in "Stage 3 ulcer count")
		and Now() during Interval[start of "Normalize Interval"(P.effective),start of "Normalize Interval"(P.effective)+1 day])

define "Stage3UlcerCount":
    FHIRHelpers.ToQuantity("UlcerCountStage3".value).value

define "UlcerCountStage4":
	Last([Observation]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and P.status.value in {'final', 'amended', 'corrected'}
		and exists(P.code.coding C where C in "Stage 4 ulcer count")
		and Now() during Interval[start of "Normalize Interval"(P.effective),start of "Normalize Interval"(P.effective)+1 day])

define "Stage4UlcerCount":
    FHIRHelpers.ToQuantity("UlcerCountStage4".value).value

define "Group2Or3Device":
    [Device]D
        where D.patient.reference.value = 'Patient/'+ Patient.id.value
        and exists(D.type.coding C where C in "Group 2 or 3 support surfaces")

define "Group2Or3UsageDevice":
    if exists([DeviceUseStatement])
    then ("Group2Or3Device"D
            with [DeviceUseStatement]DU
            such that DU.device.reference.value = 'Device/'+D.id.value
            and DU.subject.reference.value = 'Patient/'+ Patient.id.value
            and DU.status.value!='entered-in-error'
            and "Normalize Interval"(DU.timing) ends during Interval[Today()-60 days, Today()])
    else null

define "Group2Or3UsageProcedure":
    [Procedure]P
    with "Group2Or3Device"D
    such that P.subject.reference.value = 'Patient/'+ Patient.id.value
        and P.status.value = 'completed'
        and exists(P.code.coding C where C in "Provision of device")
        and (First(P.usedCode R where First(R.coding) in "Group 2 or 3 support surfaces") is not null)
            or (First(P.usedReference RR where RR.reference.value = 'Device/'+D.id.value) is not null)

define "GraftProcedure":
	[Procedure]P where P.subject.reference.value = 'Patient/'+ Patient.id.value
 		and P.status.value ='completed'
		and exists(P.code.coding C where C in "Myocutaneous flap"
		and "Normalize Interval"(P.performed) ends during Interval[Today()-60 days, Today()])
		and exists(P.bodySite.coding co where co in "Trunk or hips body structures")

define "UlcerTreatment":
    "GraftProcedure"L
	return (First(L.code.coding).display.value)+'\n'

define "Group2or3SurfaceUsed":
    ("Group2Or3UsageDevice" union "Group2Or3UsageProcedure") P
    return (if (P is FHIR.Device)
            then (First(P.code.coding).display.value)+'\n'
            else (if (P.usedCode) is not null
					then (P.usedCode.coding[0].display.value+'\n')
					else (First("Group2Or3Device"dev with P.usedReference ref
							such that ref.reference.value = 'Device/'+dev.id.value).type.coding[0].display.value+'\n')
				)
            )

define "Description":
	if (DeviceRequest.code as CodeableConcept) is not null
	then ((DeviceRequest.code as CodeableConcept).coding[0].display.value+'\n')
	else (First([Device]device
			where (DeviceRequest.code as Reference).reference.value = 'Device/'+device.id.value).type.coding[0].display.value+'\n')

define "SubmissionDate":
	Today()

define Supplier:
	First([Organization] org
        with (DeviceRequest.performer) P
        such that P.reference.value = ('Organization/' + org.id.value))

define "SupplierName":
	"Supplier".name.value

define "SupplierNPI":
    First("Supplier".identifier).value.value

define "SupplierAddressObject":
	First("Supplier".address)

define "SupplierAddressLine":
	if exists(SupplierAddressObject.line)
	then (if Length(SupplierAddressObject.line)>1
				then (SupplierAddressObject.line[0].value+', '+SupplierAddressObject.line[1].value)
				else SupplierAddressObject.line[0].value)
	else ''

define "SupplierAddressCity":
	SupplierAddressObject.city.value

define "SupplierAddressState":
	SupplierAddressObject.state.value

define "SupplierAddressPostalCode":
	SupplierAddressObject.postalCode.value

define function "Normalize Interval"(choice Choice<FHIR.dateTime,FHIR.Period>):
 	 if choice is FHIR.dateTime then
 		  Interval[FHIRHelpers.ToDateTime(choice as FHIR.dateTime), FHIRHelpers.ToDateTime(choice as FHIR.dateTime)]
	 else if choice is FHIR.Period then
		  FHIRHelpers.ToInterval(choice as FHIR.Period)
	 else null

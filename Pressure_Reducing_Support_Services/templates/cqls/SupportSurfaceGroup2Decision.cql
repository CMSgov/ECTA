library SupportSurfaceGroup2Decision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include SupportSurfaceGroup2 version '1.0.0' called SupportSurfaceGroup2

parameter "DeviceRequest" DeviceRequest
parameter "QuestionnaireResponse" QuestionnaireResponse

context Patient

define QT:
	"QuestionnaireResponse".item

define QA14:
	("QT".item I
		where I.linkId.value = '1.4')QR
		return First(QR.answer).value

define QA17:
	("QT".item I
		where I.linkId.value = '1.7')QR
		return First(QR.answer).value

define "Group1Usage":
  exists(SupportSurfaceGroup2."Group1UsageDevice") or exists(SupportSurfaceGroup2."Group1UsageProcedure")

define "Group2Or3Usage":
  exists(SupportSurfaceGroup2."Group2Or3UsageDevice") or exists(SupportSurfaceGroup2."Group2Or3UsageProcedure")

define "Criteria1":
    if (Last(SupportSurfaceGroup2."Stage2Ulcer") is not null
        and SupportSurfaceGroup2."Stage2UlcerCount">1
        and "Group1Usage"
        and Last(SupportSurfaceGroup2."WoundAssessmentProcedure") is not null
        and Last(SupportSurfaceGroup2."PatientRepositioning") is not null
        and Last(SupportSurfaceGroup2."IncontinenceManagement") is not null
        and Last(SupportSurfaceGroup2."DietManagement") is not null
        and Last(SupportSurfaceGroup2."WoundCareProcedure") is not null
        and First("QA14")= false)
    then true
    else false

define "Criteria2":
    if (Last(SupportSurfaceGroup2."Stage3Or4Ulcer") is not null
        and (SupportSurfaceGroup2."Stage3UlcerCount">1 or SupportSurfaceGroup2."Stage4UlcerCount">1))
    then true
    else false

define "Criteria3":
    if (Last(SupportSurfaceGroup2."GraftProcedure") is not null
        and "Group2Or3Usage"
        and First("QA17")= true)
    then true
    else false

define "FinalDecision":
	if ("Criteria1"
	    and "Criteria2"
	    and "Criteria3")
	then 'YES'
	else 'NO'

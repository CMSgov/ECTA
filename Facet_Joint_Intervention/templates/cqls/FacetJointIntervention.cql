library FacetJointIntervention version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

codesystem "LOINC": 'http://loinc.org'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'http://www.ama-assn.org/go/cpt'

code "64490 - Inj paravert f jnt c/t 1 lev​": '64490' from "CPT" display '64490 - Inj paravert f jnt c/t 1 lev​'
code "64493 - Inj paravert f jnt l/s 1 lev​": '64493' from "CPT" display '64493 - Inj paravert f jnt l/s 1 lev​'
code "64633 - Destroy cerv/thor facet jnt​​": '64633' from "CPT" display '64633 - Destroy cerv/thor facet jnt​​'
code "64635 - Destroy lumb/sac facet jnt​​": '64635' from "CPT" display '64635 - Destroy lumb/sac facet jnt​​'

valueset "Primary Diagnosis Cervical Thoracic Codes": 'primary-diagnosis-cervical-thoracic'
valueset "Primary Diagnosis Lumbar Sacral Codes": 'primary-diagnosis-lumbar-sacral'
valueset "Primary Facet Cyst Diagnosis Cervical Thoracic Codes": 'primary-facet-cyst-diagnosis-cervical-thoracic'
valueset "Primary Facet Cyst Diagnosis Lumbar Sacral Codes": 'primary-facet-cyst-diagnosis-lumbar-sacral'
valueset "Anatomic Restriction MBB Codes": 'anatomic-restriction-mbb'
valueset "Non Facet Pathology Codes": 'non-facet-pathology'

valueset "64490 Codes": '64490-Codes'
valueset "64493 Codes": '64493-Codes'
valueset "64633 Codes": '64633-Codes'
valueset "64635 Codes": '64635-Codes'
valueset "Additonal Codes": 'AdditonalCodes'

code "Medically complex conditions" : 'LA28886-2' from "LOINC" display 'Medically complex conditions'
code "Impaired executive functioning" : '736317001' from "SNOMED-CT" display 'Impaired executive functioning'
code "Body disability AND/OR failure state": '105719004' from "SNOMED-CT" display 'Body disability AND/OR failure state'
code "Impaired cognition": '386806002' from "SNOMED-CT" display 'Impaired cognition'
code "Unable to maintain a position" : '282848007' from "SNOMED-CT" display 'Unable to maintain a position'

parameter "Claim" Claim
parameter "Encounter" Encounter
parameter "ServiceRequest" ServiceRequest
parameter "PractitionerRole" PractitionerRole
parameter "Practitioner" Practitioner
parameter "Condition" Condition
parameter "Procedure" Procedure
parameter "Observation" Observation

context Patient

define Request:
	"ServiceRequest"

define OrderId:
    "Request".id.value


define OrderingPractitionerRole:
  singleton from ( "ServiceRequest".contained.PractitionerRole P
        where 'PractitionerRole/' + ReplaceMatches(P.id.value, '#', '') = "ServiceRequest".requester.reference.value
      )

define OrderingPhysician:
  if (singleton from ( [Practitioner] P
        where 'Practitioner/' + P.id.value = "ServiceRequest".requester.reference.value
      )) is not null then
    singleton from ( [Practitioner] P
        where 'Practitioner/' + P.id.value = "ServiceRequest".requester.reference.value
      )
  else if ("OrderingPractitionerRole" is not null and (singleton from ([Practitioner] P where 'Practitioner/' + P.id.value = "OrderingPractitionerRole".practitioner.reference.value) is not null )) then
    singleton from ([Practitioner] P where 'Practitioner/' + P.id.value = "OrderingPractitionerRole".practitioner.reference.value)
  else 
    singleton from ( "ServiceRequest".contained.Practitioner P 
    where P is not null 
    and 'Practitioner/' + ReplaceMatches(P.id.value, '#', '') = "ServiceRequest".requester.reference.value
    )

define OrderingPhysicianNPI:
  ( First("OrderingPhysician".identifier identifier
        where identifier.system.value = 'http://hl7.org/fhir/sid/us-npi'
    )
  ).value.value

define OrderingPhysicianName: 
    singleton from (
  	"OrderingPhysician".name name) 

define "OrderDate":
    "Request".authoredOn

define "ServiceRequestCode":
    FHIRHelpers.ToCode(First("ServiceRequest".code.coding))
    
define "PrimaryServiceRequest":
    if("ServiceRequestCode" in "64490 Codes") then System.Code{ code: '64490', system: "ServiceRequestCode".system, display: '64490 - Inj paravert f jnt c/t 1 lev​'}
    else if ("ServiceRequestCode" in "64493 Codes") then System.Code{ code: '64493', system: "ServiceRequestCode".system, display: '64493 - Inj paravert f jnt l/s 1 lev​'}
    else if ("ServiceRequestCode" in "64633 Codes") then System.Code{ code: '64633', system: "ServiceRequestCode".system, display: '64633 - Destroy cerv/thor facet jnt​​'}
    else if ("ServiceRequestCode" in "64635 Codes") then System.Code{ code: '64635', system: "ServiceRequestCode".system, display: '64635 - Destroy lumb/sac facet jnt​​'}
    else null

define "AdditionalServiceRequest":
    if("ServiceRequestCode" in "Additonal Codes") then "ServiceRequestCode"
    else null

define "InterventionType":
    if (("PrimaryServiceRequest" in "64490 Codes" or "PrimaryServiceRequest" in "64493 Codes") and "PreviousInjectionsCount" < 2 and "IsFacetCystRupture") then System.Code{ code: 'Facet Cyst Rupture', display: 'Facet Cyst Rupture'}
    else if (("PrimaryServiceRequest" in "64490 Codes" or "PrimaryServiceRequest" in "64493 Codes") and "PreviousInjectionsCount" < 2 ) then System.Code{ code: 'Diagnostic', display: 'Diagnostic'}
    else if (("PrimaryServiceRequest" in "64490 Codes" or "PrimaryServiceRequest" in "64493 Codes") and "PreviousInjectionsCount" >= 2 ) then System.Code{ code: 'Therapeutic', display: 'Therapeutic'}
    else if ("PrimaryServiceRequest" in "64633 Codes" or "PrimaryServiceRequest" in "64635 Codes") then System.Code{ code: 'Radio Frequency Ablation', display: 'Radio Frequency Ablation'}
    else System.Code{ code: 'None, Primary only', display: 'None, Primary only'}
    
define "PreviousInjectionsCount":
    Count([Procedure] P where FHIRHelpers."ToCode"(First(P.code.coding)) is not null and FHIRHelpers."ToCode"(First(P.code.coding)) = "ServiceRequestCode" )

define "PreviousInjectionsDates":
    [Procedure] P where FHIRHelpers."ToCode"(First(P.code.coding)) is not null and FHIRHelpers."ToCode"(First(P.code.coding)) = "ServiceRequestCode" sort by start of "Normalize Interval"(performed)

define "FirstDiagnosisInjectionDate": 
    start of "Normalize Interval"(First("PreviousInjectionsDates").performed)

define "SecondDiagnosisInjectionDate":
    start of "Normalize Interval"(First("PreviousInjectionsDates" P where start of "Normalize Interval"(P.performed) after "FirstDiagnosisInjectionDate").performed)

define "FirstTherapeuticInjectionDate":
    start of "Normalize Interval"(First("PreviousInjectionsDates" P where start of "Normalize Interval"(P.performed) after "SecondDiagnosisInjectionDate").performed)

define "SecondTherapeuticInjectionDate":
    start of "Normalize Interval"(First("PreviousInjectionsDates" P where start of "Normalize Interval"(P.performed) after "FirstTherapeuticInjectionDate").performed)

define "IAorMBB":
    if "AnatomicRestrictionForMBBResource" is null then 'MBB'
    else 'IA'

define "FirstOrSecondDiagnosis":
    if "FirstDiagnosisInjectionDate" is not null and "IAorMBB" = 'IA' then 'Intraarticular (IA): second injection.'
    else if "SecondDiagnosisInjectionDate" is not null and "IAorMBB" = 'MBB' then 'Medial branch block (MBB) second injection.'
    else if "FirstDiagnosisInjectionDate" is null and "IAorMBB" = 'IA' then 'Intraarticular (IA): first injection.'
    else if "SecondDiagnosisInjectionDate" is null and "IAorMBB" = 'MBB' then 'Medial branch block (MBB) second injection.'
    else null

define "PastProcedurePainFollowUp":
    if "PreviousInjectionsCount" = 1 then '1st diagnostic injection follow up'
    else if "PreviousInjectionsCount" = 2 then '2nd diagnostic injection follow up'
    else if "PreviousInjectionsCount" = 3 then 'Therapeutic intervention follow up'
    else null


define "IsFacetCystRupture":
    if ("PrimaryFacetCystDiagnosisCervicalThoracic" is not null and "PrimaryFacetCystDiagnosisLumbarSacral" is not null) then true
    else false

define "IsSedationNecessary":
    if "SedationNecessary" is not null then true
    else false


define "SedationNecessary":
    if (First([Condition] C where FHIRHelpers."ToCode"(First(C.code.coding)) is not null and FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Medically complex conditions" ) is not null) 
        then 'Patient has a medical condition that would interfere with the procedure.'
    else if (First([Condition] C where FHIRHelpers."ToCode"(First(C.code.coding)) is not null and FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Impaired executive functioning" ) is not null) 
        then 'Patient does not have the cognitive capacity to cooperate.'
    else if (First([Condition] C where FHIRHelpers."ToCode"(First(C.code.coding)) is not null and FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Body disability AND/OR failure state" ) is not null) 
        then 'Patient does not have the functional capacity to cooperate.'    
    else if (First([Condition] C where FHIRHelpers."ToCode"(First(C.code.coding)) is not null and FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Impaired cognition" ) is not null) 
        then 'Patient does not have the capacity to remain motionless during the procedure.'
    else if (First([Condition] C where FHIRHelpers."ToCode"(First(C.code.coding)) is not null and FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Unable to maintain a position" ) is not null) 
        then 'Patient is not able to tolerate remaining in a painful position for a prolonged period of time.'
    else null

define "PrimaryDiagnosisCervicalThoracicResource":
    First([Condition] C where FHIRHelpers."ToCode"(First(C.code.coding)) in "Primary Diagnosis Cervical Thoracic Codes")

define "PrimaryDiagnosisLumbarSacralResource":
    First([Condition] C where FHIRHelpers."ToCode"(First(C.code.coding)) in "Primary Diagnosis Lumbar Sacral Codes")

define "PrimaryFacetCystDiagnosisCervicalThoracic":
    First([Condition] C where FHIRHelpers."ToCode"(First(C.code.coding)) in "Primary Facet Cyst Diagnosis Cervical Thoracic Codes")

define "PrimaryFacetCystDiagnosisLumbarSacral":
    First([Condition] C where FHIRHelpers."ToCode"(First(C.code.coding)) in "Primary Facet Cyst Diagnosis Lumbar Sacral Codes" )

define "AnatomicRestrictionForMBBResource":
    First([Condition] C where FHIRHelpers."ToCode"(First(C.code.coding)) in "Anatomic Restriction MBB Codes")

define "NonFacetPathologySourcesCondition":
    First([Condition] C where FHIRHelpers."ToCode"(First(C.code.coding)) in "Non Facet Pathology Codes")

define "NonFacetPathologySourcesAssessment":
    if "NonFacetPathologySourcesCondition" is null 
        then 'Negative for non-facet pathology sources:  Medical record indicates all of the following are ABSENT: active spine fractures, spine tumors, active infections, sciatica, hip osteoarthritis, sacroiliac impingement, untreated radiculopathy, neurogenic claudication, myofascial pain, compression fractures, disc herniation, osteophytes, rheumatoid arthritis, fibromyalgia.'
    else 'Positive for non-facet pathology sources:  Medical record indicates one or more of the following are PRESENT: active spine fractures, spine tumors, active infections, sciatica, hip osteoarthritis, sacroiliac impingement, untreated radiculopathy, neurogenic claudication, myofascial pain, compression fractures, disc herniation, osteophytes, rheumatoid arthritis, fibromyalgia.'

define "PrimaryDiagnosisCervicalThoracic": 
    First("PrimaryDiagnosisCervicalThoracicResource".code.coding)

define "PrimaryDiagnosisLumbarSacral":
    First("PrimaryDiagnosisLumbarSacralResource".code.coding)
    
define "AnatomicRestrictionForMBB":
    First("AnatomicRestrictionForMBBResource".code.coding)

define "SupportiveFindingsForRequestedProcedure":
    if ("PrimaryDiagnosisCervicalThoracicResource" is not null) then 'Neck pain and its progression.'
    else if("PrimaryDiagnosisLumbarSacralResource" is not null) then 'Axial low back pain and its progression.'
    else null

define function "Normalize Interval"(choice Choice<FHIR.dateTime, FHIR.Age, FHIR.Period, FHIR.Range, FHIR.string>):
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
library FacetJointIntervention version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'http://www.ama-assn.org/go/cpt'
codesystem "NUCCPT":'https://www.nlm.nih.gov/research/umls/sourcereleasedocs/current/NUCCPT/sourcerepresentation.html'
codesystem "Version2Tables": 'http://terminology.hl7.org/CodeSystem/v2-0203'


code "64490 - Inj paravert f jnt c/t 1 lev​": '64490' from "CPT" display '64490 - Inj paravert f jnt c/t 1 lev​'
code "64493 - Inj paravert f jnt l/s 1 lev​": '64493' from "CPT" display '64493 - Inj paravert f jnt l/s 1 lev​'
code "64633 - Destroy cerv/thor facet jnt​​": '64633' from "CPT" display '64633 - Destroy cerv/thor facet jnt​​'
code "64635 - Destroy lumb/sac facet jnt​​": '64635' from "CPT" display '64635 - Destroy lumb/sac facet jnt​​'

code "64491 - Inj paravert f jnt c/t 2 lev​": '64491' from "CPT" display '64491 - Inj paravert f jnt c/t 2 lev​'
code "64492 - Inj paravert f jnt c/t 3 lev​": '644992' from "CPT" display '64492 - Inj paravert f jnt c/t 3 lev​'
code "64634 - Destroy c/th facet jnt addl​​": '64634' from "CPT" display '64634 - Destroy c/th facet jnt addl​​'
code "64636 - Destroy l/s facet jnt addl​​": '64636' from "CPT" display '64636 - Destroy l/s facet jnt addl​​'
code "64494 - Inj paravert f jnt l/s 2 lev​": '64494' from "CPT" display '64494 - Inj paravert f jnt l/s 2 lev​'
code "64495 - Inj paravert f jnt l/s 3 lev​": '64495' from "CPT" display '64495 - Inj paravert f jnt l/s 3 lev​'


code "Spondylosis without myelopathy or radiculopathy, cervical region": 'M47.812' from "ICD-10-CM" display 'Spondylosis without myelopathy or radiculopathy, cervical region'
code "Spondylosis without myelopathy or radiculopathy, cervicothoracic region": 'M47.813' from "ICD-10-CM" display 'Spondylosis without myelopathy or radiculopathy, cervicothoracic region'
code "Spondylosis without myelopathy or radiculopathy, thoracic region" : 'M47.814' from "ICD-10-CM" display 'Spondylosis without myelopathy or radiculopathy, thoracic region'
code "Spondylosis without myelopathy or radiculopathy, thoracolumbar region" : 'M47.815' from "ICD-10-CM" display 'Spondylosis without myelopathy or radiculopathy, thoracolumbar region'
code "Other spondylosis, cervical region" : 'M47.892' from "ICD-10-CM" display 'Other spondylosis, cervical region'
code "Other spondylosis, cervicothoracic region" : 'M47.893' from "ICD-10-CM" display 'Other spondylosis, cervicothoracic region'
code "Other spondylosis, thoracic region" : 'M47.894' from "ICD-10-CM" display 'Other spondylosis, thoracic region'
code "Other spondylosis, thoracolumbar region" : 'M47.895' from "ICD-10-CM" display 'Other spondylosis, thoracolumbar region'
code "Ankylosing hyperostosis [Forestier], cervical region" : 'M48.12' from "ICD-10-CM" display 'Ankylosing hyperostosis [Forestier], cervical region'
code "Ankylosing hyperostosis [Forestier], cervicothoracic region" : 'M48.13' from "ICD-10-CM" display 'Ankylosing hyperostosis [Forestier], cervicothoracic region'
code "Ankylosing hyperostosis [Forestier], thoracic region" : 'M48.14' from "ICD-10-CM" display 'Ankylosing hyperostosis [Forestier], thoracic region'
code "Ankylosing hyperostosis [Forestier], thoracolumbar region" : 'M48.15' from "ICD-10-CM" display 'Ankylosing hyperostosis [Forestier], thoracolumbar region'

code "Spondylosis without myelopathy or radiculopathy, lumbar region": 'M47.816' from "ICD-10-CM" display 'Spondylosis without myelopathy or radiculopathy, lumbar region'
code "Spondylosis without myelopathy or radiculopathy, lumbosacral region": 'M47.817' from "ICD-10-CM" display 'Spondylosis without myelopathy or radiculopathy, lumbosacral region'
code "Other spondylosis, lumbar region" : 'M47.896' from "ICD-10-CM" display 'Other spondylosis, lumbar region'
code "Other spondylosis, lumbosacral region" : 'M47.897' from "ICD-10-CM" display 'Other spondylosis, lumbosacral region'
code "Ankylosing hyperostosis [Forestier], lumbar region" : 'M48.16' from "ICD-10-CM" display 'Ankylosing hyperostosis [Forestier], lumbar region'
code "Ankylosing hyperostosis [Forestier], lumbosacral region" : 'M48.17' from "ICD-10-CM" display 'Ankylosing hyperostosis [Forestier], lumbosacral region'



code "Other bursal cyst, unspecified site" : 'M71.30' from "ICD-10-CM" display 'Other bursal cyst, unspecified site'
code "Other bursal cyst, other site" : 'M71.38' from "ICD-10-CM" display 'Other bursal cyst, other site'
code "Other specified dorsopathies" : 'M53.8' from "ICD-10-CM" display 'Other specified dorsopathies'

code "Other specified dorsopathies, cervical" : 'M53.82' from "ICD-10-CM" display 'Other specified dorsopathies, cervical'
code "Other specified dorsopathies, cervicothoracic" : 'M53.83' from "ICD-10-CM" display 'Other specified dorsopathies, cervicothoracic'
code "Other specified dorsopathies, thoracic" : 'M53.84' from "ICD-10-CM" display 'Other specified dorsopathies, thoracic'
code "Other specified dorsopathies, thoracolumbar" : 'M53.85' from "ICD-10-CM" display 'Other specified dorsopathies, thoracolumbar'

code "Other specified dorsopathies, lumbar" : 'M53.86' from "ICD-10-CM" display 'Other specified dorsopathies, lumbar'
code "Other specified dorsopathies, lumbosacral" : 'M53.87' from "ICD-10-CM" display 'Other specified dorsopathies, lumbosacral'
code "Other specified dorsopathies, sacral" : 'M53.88' from "ICD-10-CM" display 'Other specified dorsopathies, sacral'


code "Posterior Fusion" : 'LA32187-9' from "LOINC" display 'Posterior Fusion'
code "Scoliosis" : 'LP266363-3' from "LOINC" display 'Scoliosis'
code "Pseudoarthrosis" : '430962009' from "SNOMED-CT" display 'Pseudoarthrosis'
code "Presence of a sixth lumbar vertebra" : '40854002' from "SNOMED-CT" display 'Presence of a sixth lumbar vertebra'
code "Sacralization of the fifth lumbar vertebra" : '281373004' from "SNOMED-CT" display 'Sacralization of the fifth lumbar vertebra'
code "Severe Osteophytes (bone spurs)" : 'LA15324-9' from "LOINC" display 'Severe Osteophytes (bone spurs)'
code "Obesity or excessive adipose tissue" : '414916001' from "SNOMED-CT" display 'Obesity or excessive adipose tissue'


code "Spine Tumors" : '363438000' from "SNOMED-CT" display 'Spine Tumors'
code "Sciatica" : '23056005' from "SNOMED-CT" display 'Sciatica'
code "Hip Osteoarthritis" : '239872002' from "SNOMED-CT" display 'Hip Osteoarthritis'
code "Fracture of cervical spine" : '125606003' from "SNOMED-CT" display 'Fracture of cervical spine'
code "Nerve root disorder" : '72274001' from "SNOMED-CT" display 'Nerve root disorder'
code "Neurogenic claudication" : '303081002' from "SNOMED-CT" display 'Neurogenic claudication'
code "Radiculopathy" : 'M54.1' from "ICD-10-CM" display 'Radiculopathy'
code "Compression fracture" : '21947006' from "SNOMED-CT" display 'Compression fracture'
code "Osteophyte of bone" : '235231000119100' from "SNOMED-CT" display 'Osteophyte of bone'
code "Rheumatoid arthritis" : '69896004' from "SNOMED-CT" display 'Rheumatoid arthritis'


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

define "FjiProcedures": {"64490 - Inj paravert f jnt c/t 1 lev​", "64633 - Destroy cerv/thor facet jnt​​", "64635 - Destroy lumb/sac facet jnt​​", 
    "64491 - Inj paravert f jnt c/t 2 lev​", "64492 - Inj paravert f jnt c/t 3 lev​", "64634 - Destroy c/th facet jnt addl​​", "64636 - Destroy l/s facet jnt addl​​", "64494 - Inj paravert f jnt l/s 2 lev​", "64495 - Inj paravert f jnt l/s 3 lev​"}
define "FjiPrimaryProcedures": {"64490 - Inj paravert f jnt c/t 1 lev​", "64633 - Destroy cerv/thor facet jnt​​", "64635 - Destroy lumb/sac facet jnt​​"}


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
  	"OrderingPhysician".name name where name.use.value = 'official') 

define OrderingPhysicianLastName: 
	"OrderingPhysicianName".family.value
	
define OrderingPhysicianMiddleName: 
  	Substring(Combine(("OrderingPhysicianName".given given return Substring(given.value,0,1)),', '),3)
	
define "OrderingPhysicianFirstName": 
	"OrderingPhysicianName".given[0].value

define "OrderDate":
    "Request".authoredOn

define "ServiceRequestCode":
    FHIRHelpers.ToCode(First(First([ServiceRequest]).code.coding))
    
define "PrimaryServiceRequest":
    if("ServiceRequestCode" ~ "64490 - Inj paravert f jnt c/t 1 lev​" or "ServiceRequestCode" ~ "64491 - Inj paravert f jnt c/t 2 lev​" or "ServiceRequestCode" ~  "64492 - Inj paravert f jnt c/t 3 lev​") then "64490 - Inj paravert f jnt c/t 1 lev​"
    else if ("ServiceRequestCode" ~ "64493 - Inj paravert f jnt l/s 1 lev​" or "ServiceRequestCode" ~  "64494 - Inj paravert f jnt l/s 2 lev​" or "ServiceRequestCode" ~  "64495 - Inj paravert f jnt l/s 3 lev​") then "64493 - Inj paravert f jnt l/s 1 lev​"
    else if ("ServiceRequestCode" ~ "64633 - Destroy cerv/thor facet jnt​​" or "ServiceRequestCode" ~  "64634 - Destroy c/th facet jnt addl​​") then "64633 - Destroy cerv/thor facet jnt​​"
    else if ("ServiceRequestCode" ~ "64635 - Destroy lumb/sac facet jnt​​" or "ServiceRequestCode" ~  "64636 - Destroy l/s facet jnt addl​​") then "64635 - Destroy lumb/sac facet jnt​​"
    else null

define "AdditionalServiceRequest":
    if("ServiceRequestCode" ~ "64491 - Inj paravert f jnt c/t 2 lev​" or "ServiceRequestCode" ~  "64492 - Inj paravert f jnt c/t 3 lev​"
    or "ServiceRequestCode" ~  "64494 - Inj paravert f jnt l/s 2 lev​" or "ServiceRequestCode" ~  "64495 - Inj paravert f jnt l/s 3 lev​"
    or "ServiceRequestCode" ~  "64634 - Destroy c/th facet jnt addl​​" or "ServiceRequestCode" ~  "64636 - Destroy l/s facet jnt addl​​") then "ServiceRequestCode"
    else null


define "InterventionType":
    if (("PrimaryServiceRequest" ~ "64490 - Inj paravert f jnt c/t 1 lev​" or "PrimaryServiceRequest" ~ "64493 - Inj paravert f jnt l/s 1 lev​") and "PreviousInjectionsCount" < 2 and "IsFacetCystRupture")then 'Facet Cyst Rupture'
    else if (("PrimaryServiceRequest" ~ "64490 - Inj paravert f jnt c/t 1 lev​" or "PrimaryServiceRequest" ~ "64493 - Inj paravert f jnt l/s 1 lev​") and "PreviousInjectionsCount" < 2 )then 'Diagnostic'
    else if (("PrimaryServiceRequest" ~ "64490 - Inj paravert f jnt c/t 1 lev​" or "PrimaryServiceRequest" ~ "64493 - Inj paravert f jnt l/s 1 lev​") and "PreviousInjectionsCount" >= 2 )then 'Therapeutic'
    else if ("PrimaryServiceRequest" ~ "64633 - Destroy cerv/thor facet jnt​​" or "PrimaryServiceRequest" ~  "64635 - Destroy lumb/sac facet jnt​​") then 'Radio Frequency Ablation'
    else null
    
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
    else if "FirstDiagnosisInjectionDate" is not null and "IAorMBB" = 'MBB' then 'Medial branch block (MBB) second injection.'
    else if "FirstDiagnosisInjectionDate" is null and "IAorMBB" = 'IA' then 'Intraarticular (IA): first injection.'
    else if "FirstDiagnosisInjectionDate" is null and "IAorMBB" = 'MBB' then 'Medial branch block (MBB) second injection.'
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
    First([Condition] C where FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Spondylosis without myelopathy or radiculopathy, cervical region" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Spondylosis without myelopathy or radiculopathy, cervicothoracic region" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Spondylosis without myelopathy or radiculopathy, thoracic region" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Spondylosis without myelopathy or radiculopathy, thoracolumbar region" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Other spondylosis, cervical region" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Other spondylosis, cervicothoracic region" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Other spondylosis, thoracic region" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Other spondylosis, thoracolumbar region" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Ankylosing hyperostosis [Forestier], cervical region" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Ankylosing hyperostosis [Forestier], cervicothoracic region" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Ankylosing hyperostosis [Forestier], thoracic region" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Ankylosing hyperostosis [Forestier], thoracolumbar region"
       )

define "PrimaryDiagnosisLumbarSacralResource":
    First([Condition] C where FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Spondylosis without myelopathy or radiculopathy, lumbar region" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Spondylosis without myelopathy or radiculopathy, lumbosacral region" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Other spondylosis, lumbar region" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Other spondylosis, lumbosacral region" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Ankylosing hyperostosis [Forestier], lumbar region" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Ankylosing hyperostosis [Forestier], lumbosacral region"
       )

define "PrimaryFacetCystDiagnosisCervicalThoracic":
    First([Condition] C where FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Other bursal cyst, unspecified site" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Other bursal cyst, other site" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Other specified dorsopathies" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Other specified dorsopathies, cervical" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Other specified dorsopathies, cervicothoracic" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Other specified dorsopathies, thoracic" or
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Other specified dorsopathies, thoracolumbar"
       )

define "PrimaryFacetCystDiagnosisLumbarSacral":
    First([Condition] C where FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Other bursal cyst, unspecified site" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Other bursal cyst, other site" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Other specified dorsopathies" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Other specified dorsopathies, lumbar" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Other specified dorsopathies, lumbosacral" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Other specified dorsopathies, sacral"
       )

define "AnatomicRestrictionForMBBResource":
    First([Condition] C where FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Posterior Fusion" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Scoliosis" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Pseudoarthrosis" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Presence of a sixth lumbar vertebra" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Sacralization of the fifth lumbar vertebra" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Severe Osteophytes (bone spurs)" or
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Obesity or excessive adipose tissue" 
    )

define "NonFacetPathologySourcesCondition":
    First([Condition] C where FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Spine Tumors" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Sciatica" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Hip Osteoarthritis" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Fracture of cervical spine" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Nerve root disorder" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Neurogenic claudication" or
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Radiculopathy" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Compression fracture" or 
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Osteophyte of bone" or
       FHIRHelpers."ToCode"(First(C.code.coding)) ~ "Rheumatoid arthritis" 
    )


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
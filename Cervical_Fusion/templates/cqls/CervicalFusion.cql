library CervicalFusion version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

valueset "ExpediteReasonConditions": 'ExpediteReasonConditions'
valueset "CervicalFusionProcedures": 'CervicalFusionProcedures'
valueset "SymptomaticCervicalNerveRootImpingementConditions": 'SymptomaticCervicalNerveRootImpingementConditions'
valueset "SymptomaticCervicalCanalStenosisConditions": 'SymptomaticCervicalCanalStenosisConditions'
valueset "DecompressionOrStabilizationOfCervicalSpineConditions": 'DecompressionOrStabilizationOfCervicalSpineConditions'
valueset "ConservativeTherapyExceptionConditions": 'ConservativeTherapyExceptionConditions'
valueset "SourcesOfPain": 'SourcesOfPain'
valueset "SymptomaticCervicalNerveRootImpingementObservations": 'SymptomaticCervicalNerveRootImpingementObservations'
valueset "SymptomaticCervicalCanalStenosisObservations": 'SymptomaticCervicalCanalStenosisObservations'
valueset "DecompressionOrStabilizationOfCervicalSpineObservations": 'DecompressionOrStabilizationOfCervicalSpineObservations'
valueset "SensationOfPainObservations": 'SensationOfPainObservations'

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

parameter "ServiceRequest" ServiceRequest

context Patient

define function DisplayAnswer(label String):
  FHIR.Coding {
    display: FHIR.string { value: label }
  }

define function SnomedAnswer(codeValue String, label String):
  FHIR.Coding {
    system: FHIR.uri { value: 'http://snomed.info/sct' },
    code: FHIR.code { value: codeValue },
    display: FHIR.string { value: label }
  }

define ServiceEncounter:
	First([Encounter]E where 'Encounter/' + E.id.value = "ServiceRequest".encounter.reference.value)

define CervicalFusionServiceRequest:
  First([ServiceRequest] ServiceReq where "ToCode"(First(ServiceReq.code.coding)) in "CervicalFusionProcedures")

define ExpediteReasonResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "ExpediteReasonConditions"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define RequestType:
	if "ExpediteReasonResource" is not null
   		then DisplayAnswer('Expedited Initial')
  	else DisplayAnswer('Initial')

define RequestingDate: 
  ToDate(Today())

define RequestedProcedure:
    System.Code {
          code:  First(CervicalFusionServiceRequest.code.coding).code.value,
          system:  First(CervicalFusionServiceRequest.code.coding).system.value,
          display:  First(CervicalFusionServiceRequest.code.coding).display.value
        }

define SymptomaticCervicalNerveRootImpingementConditionResource: 
	First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "SymptomaticCervicalNerveRootImpingementConditions"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define SymptomaticCervicalCanalStenosisConditionResource: 
	First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "SymptomaticCervicalCanalStenosisConditions"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define DecompressionOrStabilizationOfCervicalSpineConditionResource: 
	First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "DecompressionOrStabilizationOfCervicalSpineConditions"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define ConservativeTherapyExceptionConditionsResource: 
	First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "ConservativeTherapyExceptionConditions"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define SourcesOfPainConditionsResource: 
	First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "SourcesOfPain"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define PrimaryDiagnosis:
	if SymptomaticCervicalNerveRootImpingementConditionResource is not null
		then DisplayAnswer('Symptomatic Cervical Nerve Root Impingement')
	else if SymptomaticCervicalCanalStenosisConditionResource is not null
		then DisplayAnswer('Symptomatic Cervical Canal Stenosis')
	else if DecompressionOrStabilizationOfCervicalSpineConditionResource is not null
		then DisplayAnswer('Decompression or stabilization of the cervical spine')
	else null

define SymptomaticCervicalNerveRootImpingementConditionCode: 
	"ToCode"(First(SymptomaticCervicalNerveRootImpingementConditionResource.code.coding))

define SymptomaticCervicalCanalStenosisConditionCode: 
	"ToCode"(First(SymptomaticCervicalCanalStenosisConditionResource.code.coding))

define DecompressionOrStabilizationOfCervicalSpineConditionCode: 
	"ToCode"(First(DecompressionOrStabilizationOfCervicalSpineConditionResource.code.coding))

define ConservativeTherapyExceptionConditionCode: 
	if ConservativeTherapyExceptionConditionsResource is not null then
		First(ConservativeTherapyExceptionConditionsResource.code.coding)
	else DisplayAnswer('No')

define PresenceOfPain:
	if RequestType.display.value = 'Expedited Initial' then DisplayAnswer('N/A')
	else if SourcesOfPainConditionsResource is not null then DisplayAnswer('No')
	else DisplayAnswer('Yes')

// 2.1.a words its "Yes" option differently from 2.1.b
define PresenceOfPainOtherSourcesExcluded:
	if PresenceOfPain.display.value = 'Yes'
		then DisplayAnswer('Yes, all other sources have been ruled out, including but not limited to e.g., thoracic outlet syndrome, isolated chronic axial cervical pain, and peripheral neuropathy.')
	else PresenceOfPain

define MRIResultsSymptomaticCervicalNerveRootImpingementResource:
    First([Observation] O where "ToCode"(First(O.code.coding)) in "SymptomaticCervicalNerveRootImpingementObservations"
      sort by start of "Normalize Interval"(effective))

define MRIResultsSymptomaticCervicalCanalStenosisResource:
    First([Observation] O where "ToCode"(First(O.code.coding)) in "SymptomaticCervicalCanalStenosisObservations"
      sort by start of "Normalize Interval"(effective))

define MRIResultsDecompressionOrStabilizationOfCervicalSpineResource:
    First([Observation] O where "ToCode"(First(O.code.coding)) in "DecompressionOrStabilizationOfCervicalSpineObservations"
      sort by start of "Normalize Interval"(effective))

define MRIResultsSymptomaticCervicalNerveRootImpingement:
    "ToCode"(First(MRIResultsSymptomaticCervicalNerveRootImpingementResource.code.coding))

define MRIResultsSymptomaticCervicalCanalStenosis:
    "ToCode"(First(MRIResultsSymptomaticCervicalCanalStenosisResource.code.coding))

define MRIResultsDecompressionOrStabilizationOfCervicalSpine:
    "ToCode"(First(MRIResultsDecompressionOrStabilizationOfCervicalSpineResource.code.coding))

define MRIEncounterDate:
  if MRIResultsSymptomaticCervicalNerveRootImpingementResource is not null then
    ToDate(start of "Normalize Interval"(GetEncounterFromDiagnosticReport(GetDiagnosticReportFromObservation(MRIResultsSymptomaticCervicalNerveRootImpingementResource)).period))
  else if MRIResultsSymptomaticCervicalCanalStenosisResource is not null then
    ToDate(start of "Normalize Interval"(GetEncounterFromDiagnosticReport(GetDiagnosticReportFromObservation(MRIResultsSymptomaticCervicalCanalStenosisResource)).period))
  else if MRIResultsDecompressionOrStabilizationOfCervicalSpineResource is not null then
    ToDate(start of "Normalize Interval"(GetEncounterFromDiagnosticReport(GetDiagnosticReportFromObservation(MRIResultsDecompressionOrStabilizationOfCervicalSpineResource)).period))
  else null

define SensationOfPainResource:
   First([Observation] O where "ToCode"(First(O.code.coding)) in "SensationOfPainObservations"
      sort by start of "Normalize Interval"(effective))

define SensationOfPain:
    "ToCode"(First(SensationOfPainResource.code.coding))

define SensationOfPainBodySite: 
    if First(SensationOfPainResource.bodySite.coding).code = '212198000'
        then SnomedAnswer('212198000', 'Radicular pain: Back of head and upper neck')
    // 212199003 and 212200005 are not valid SNOMED CT ids (check digit), so these answers are display-only
    else if First(SensationOfPainResource.bodySite.coding).code = '212199003'
        then DisplayAnswer('Radicular pain: (rare) Side and back of neck')
    else if First(SensationOfPainResource.bodySite.coding).code = '212200005'
        then DisplayAnswer('Radicular pain: Localized to the base of the neck and over the shoulder.')
    else if First(SensationOfPainResource.bodySite.coding).code = '279039007'
        then SnomedAnswer('279039007', 'Radicular pain: Pain radiating from the neck to the lateral upper arm (deltoid).')
    else if First(SensationOfPainResource.bodySite.coding).code = '212202003'
        then SnomedAnswer('212202003', 'Radicular pain: Running from the neck, over the shoulder, lateral outer arm, to the thumb and index finger.')
    else if First(SensationOfPainResource.bodySite.coding).code = '212203008'
        then SnomedAnswer('212203008', 'Radicular pain: Pain from the neck to the back of the shoulder back of the arm and into the middle finger.')
    else null

define RecurringPersistantRadicularPain:
    if SensationOfPainBodySite is not null
        then DisplayAnswer('Radicular pain that aligns with diagnostic imaging findings')
    else DisplayAnswer('Radicular pain that DOES NOT align with diagnostic imaging findings')

define SensationOfPainEncounterDate:
    if ToDate(start of "Normalize Interval"(GetEncounterFromDiagnosticReport(GetDiagnosticReportFromObservation("SensationOfPainResource")).period)) is not null then
        ToDate(start of "Normalize Interval"(GetEncounterFromDiagnosticReport(GetDiagnosticReportFromObservation("SensationOfPainResource")).period))
    else if ToDate(start of "Normalize Interval"((GetEncounterFromObservation("SensationOfPainResource")).period)) is not null then
        ToDate(start of "Normalize Interval"((GetEncounterFromObservation("SensationOfPainResource")).period))
    else null

define EvidenceOfRelavantSymptoms:
    if SensationOfPainResource is not null then true
    else false

define EvidenceOfRelavantSymptomsEncounterDate:
    if SensationOfPainResource is not null then SensationOfPainEncounterDate
    else null

// Helper functions needed for this scope

define function "Normalize Interval"(onset Choice<FHIR.dateTime, FHIR.Age, FHIR.Period, FHIR.Range, FHIR.string>):
  if onset is FHIR.dateTime then Interval[FHIRHelpers.ToDateTime ( onset as FHIR.dateTime ), FHIRHelpers.ToDateTime ( onset as FHIR.dateTime )]
    else if onset is FHIR.Period then FHIRHelpers.ToInterval ( onset as FHIR.Period ) 
    else if onset is FHIR.Age then Interval[FHIRHelpers.ToDate ( Patient.birthDate ) + FHIRHelpers.ToQuantity ( onset as FHIR.Age ), FHIRHelpers.ToDate ( Patient.birthDate ) + FHIRHelpers.ToQuantity ( onset as FHIR.Age ) + 1 year ] 
    else null

define function ToCode(coding FHIR.Coding):
    if coding is null then
        null
    else
        System.Code {
          code: coding.code.value,
          system: coding.system.value,
          version: coding.version.value,
          display: coding.display.value
        }

// define function GetObservationFromValueSet(codeValues System.ValueSet): 
//    First([Observation] O where "ToCode"(First(O.code.coding)) in codeValues
//       sort by start of "Normalize Interval"(effective))

define function GetDiagnosticReportFromObservation(observationParam Observation): 
   First([DiagnosticReport] DR where 'Observation/' + observationParam.id.value in 
        DR.result.reference.value
      sort by start of "Normalize Interval"(effective))

define function GetEncounterFromDiagnosticReport(report DiagnosticReport): 
   First([Encounter] E where 'Encounter/' + E.id.value = report.encounter.reference.value)

define function GetEncounterFromObservation(obs Observation): 
   First([Encounter] E where 'Encounter/' + E.id.value = obs.encounter.reference.value)
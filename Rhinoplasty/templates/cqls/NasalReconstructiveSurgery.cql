library NasalReconstructiveSurgery version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

valueset "Requested Procedure Codes": 'rhinoplasty-requested-procedure-codes'
valueset "Covered Primary Diagnoses": 'rhinoplasty-covered-diagnoses'
valueset "Congenital Craniofacial Diagnoses": 'rhinoplasty-congenital-craniofacial-diagnoses'
valueset "Cleft Associated Diagnoses": 'rhinoplasty-cleft-associated-diagnoses'
valueset "Disease Related Deformity Diagnoses": 'rhinoplasty-disease-related-deformity-diagnoses'
valueset "Nasal Valve Collapse Diagnoses": 'rhinoplasty-nasal-valve-collapse-diagnoses'
valueset "Obstructive Sleep Apnea Diagnoses": 'rhinoplasty-obstructive-sleep-apnea-diagnoses'
valueset "Deviated Nasal Septum Diagnoses": 'rhinoplasty-deviated-nasal-septum-diagnoses'
valueset "Acquired Nasal Deformity Diagnoses": 'rhinoplasty-acquired-nasal-deformity-diagnoses'
valueset "Nasal Fracture Evidence Diagnoses": 'rhinoplasty-nasal-fracture-evidence-diagnoses'
valueset "Epistaxis Diagnoses": 'rhinoplasty-epistaxis-diagnoses'
valueset "Nasal Congestion Diagnoses": 'rhinoplasty-nasal-congestion-diagnoses'
valueset "Sleep Disordered Breathing Diagnoses": 'rhinoplasty-sleep-disordered-breathing-diagnoses'
valueset "Chronic Sinusitis Evidence": 'rhinoplasty-chronic-sinusitis-evidence'
valueset "Refractory Evidence": 'rhinoplasty-refractory-evidence'
valueset "Recurrent Evidence": 'rhinoplasty-recurrent-evidence'
valueset "Persistent Evidence": 'rhinoplasty-persistent-evidence'
valueset "Antibiotic Therapy Procedures": 'rhinoplasty-antibiotic-therapy-procedures'
valueset "Inhaled Steroid Therapy Procedures": 'rhinoplasty-inhaled-steroid-therapy-procedures'

/*
  The selected ServiceRequest is supplied by the calling workflow. This avoids
  selecting the wrong request when a patient has more than one ServiceRequest.
*/
parameter "ServiceRequest" ServiceRequest

context Patient

define "Request":
  "ServiceRequest"

/* Questionnaire item 1.1 */
define "Order Date":
  if "Request".authoredOn is not null then
    date from FHIRHelpers.ToDateTime("Request".authoredOn)
  else null

/* Current evidence uses a maximum 12-month lookback from the order date. */
define "Current Chronic Evidence Lookback":
  if "Order Date" is not null then
    Interval["Order Date" - 12 months, "Order Date"]
  else null

/* Questionnaire item 1.2. Timing is intentionally not inferred as one date. */
define "Requested Procedure Date":
  if "Request".occurrence is FHIR.dateTime then
    date from FHIRHelpers.ToDateTime("Request".occurrence as FHIR.dateTime)
  else if "Request".occurrence is FHIR.Period then
    date from FHIRHelpers.ToDateTime(("Request".occurrence as FHIR.Period).start)
  else null

/* Questionnaire item 1.4 */
define "Requested Procedure Codings":
  "Request".code.coding Coding
    where FHIRHelpers.ToCode(Coding) in "Requested Procedure Codes"

/* Confirmed resource status rules. */
define function "Is Current Confirmed Condition"(C Condition):
  exists(
    C.clinicalStatus.coding StatusCoding
      where StatusCoding.code.value in { 'active', 'recurrence', 'relapse' }
  )
    and exists(
      C.verificationStatus.coding VerificationCoding
        where VerificationCoding.code.value = 'confirmed'
    )

define function "Is Confirmed Historical Condition"(C Condition):
  exists(
    C.verificationStatus.coding VerificationCoding
      where VerificationCoding.code.value = 'confirmed'
  )
    and not exists(
      C.verificationStatus.coding VerificationCoding
        where VerificationCoding.code.value in { 'refuted', 'entered-in-error' }
    )

define function "Is Final Observation"(O Observation):
  O.status.value in { 'final', 'amended', 'corrected' }

define function "Is Completed Procedure"(P Procedure):
  P.status.value = 'completed'

/*
  FHIR R4 clinical dates used for the confirmed 12-month rule:
  - Condition.recordedDate: when the diagnosis record was created/documented
  - Observation.effective[x]: when the assertion was clinically true
  - Procedure.performed[x]: when the treatment was performed

  A missing or non-date-reducible element does not establish recency and is
  therefore not used for automatic prefilling.
*/
define function "Condition Is In Current Lookback"(C Condition):
  "Current Chronic Evidence Lookback" is not null
    and C.recordedDate is not null
    and (date from FHIRHelpers.ToDateTime(C.recordedDate))
      in "Current Chronic Evidence Lookback"

define function "Observation Evidence Date"(O Observation):
  if O.effective is FHIR.dateTime then
    date from FHIRHelpers.ToDateTime(O.effective as FHIR.dateTime)
  else if O.effective is FHIR.Period then
    Coalesce(
      date from FHIRHelpers.ToDateTime((O.effective as FHIR.Period).end),
      date from FHIRHelpers.ToDateTime((O.effective as FHIR.Period).start)
    )
  else if O.effective is FHIR.instant then
    date from FHIRHelpers.ToDateTime(O.effective as FHIR.instant)
  else null

define function "Observation Is In Current Lookback"(O Observation):
  "Observation Evidence Date"(O) is not null
    and "Observation Evidence Date"(O) in "Current Chronic Evidence Lookback"

define function "Procedure Evidence Date"(P Procedure):
  if P.performed is FHIR.dateTime then
    date from FHIRHelpers.ToDateTime(P.performed as FHIR.dateTime)
  else if P.performed is FHIR.Period then
    Coalesce(
      date from FHIRHelpers.ToDateTime((P.performed as FHIR.Period).end),
      date from FHIRHelpers.ToDateTime((P.performed as FHIR.Period).start)
    )
  else null

define function "Procedure Is In Current Lookback"(P Procedure):
  "Procedure Evidence Date"(P) is not null
    and "Procedure Evidence Date"(P) in "Current Chronic Evidence Lookback"

/*
  Eligibility candidates for questionnaire item 2.1. Rhonda confirmed that
  active and confirmed provider-record Conditions are the source; Claims are
  not required. A single distinct eligible code is safe to prepopulate. A
  deterministic priority rule for multiple eligible codes remains unresolved.
*/
define "Eligible Diagnosis Candidates":
  [Condition: "Covered Primary Diagnoses"] C
    where "Is Current Confirmed Condition"(C)

define "Eligible Diagnosis Candidate Codes":
  distinct (
    "Eligible Diagnosis Candidates" C
      let MatchingCoding: First(
        C.code.coding Coding
          where FHIRHelpers.ToCode(Coding) in "Covered Primary Diagnoses"
      )
      where MatchingCoding is not null
      return FHIRHelpers.ToCode(MatchingCoding)
  )

/*
  Explicit procedure-to-diagnosis contexts from the approved CPT descriptions.
  These narrow candidates only where the procedure wording identifies the same
  clinical category as an approved diagnosis ValueSet.
*/
define "Cleft Specific Procedure Requested":
  exists(
    "Requested Procedure Codings" Coding
      where Coding.code.value in { '30460', '30462' }
  )

define "Nasal Valve Procedure Requested":
  exists(
    "Requested Procedure Codings" Coding
      where Coding.code.value = '30465'
  )

define "Septoplasty Procedure Requested":
  exists(
    "Requested Procedure Codings" Coding
      where Coding.code.value = '30520'
  )

define "Cleft Procedure Matched Diagnosis Codes":
  if "Cleft Specific Procedure Requested" then
    distinct (
      "Eligible Diagnosis Candidates" C
        let MatchingCoding: First(
          C.code.coding Coding
            where FHIRHelpers.ToCode(Coding) in "Cleft Associated Diagnoses"
        )
        where MatchingCoding is not null
        return FHIRHelpers.ToCode(MatchingCoding)
    )
  else List<Code> { }

define "Nasal Valve Procedure Matched Diagnosis Codes":
  if "Nasal Valve Procedure Requested" then
    distinct (
      "Eligible Diagnosis Candidates" C
        let MatchingCoding: First(
          C.code.coding Coding
            where FHIRHelpers.ToCode(Coding) in "Nasal Valve Collapse Diagnoses"
        )
        where MatchingCoding is not null
        return FHIRHelpers.ToCode(MatchingCoding)
    )
  else List<Code> { }

define "Septoplasty Procedure Matched Diagnosis Codes":
  if "Septoplasty Procedure Requested" then
    distinct (
      "Eligible Diagnosis Candidates" C
        let MatchingCoding: First(
          C.code.coding Coding
            where FHIRHelpers.ToCode(Coding) in "Deviated Nasal Septum Diagnoses"
        )
        where MatchingCoding is not null
        return FHIRHelpers.ToCode(MatchingCoding)
    )
  else List<Code> { }

define "Procedure Matched Diagnosis Codes":
  distinct (
    "Cleft Procedure Matched Diagnosis Codes"
      union "Nasal Valve Procedure Matched Diagnosis Codes"
      union "Septoplasty Procedure Matched Diagnosis Codes"
  )

/*
  Questionnaire item 2.1: prefer one unique explicit CPT-category match; if
  none exists, emit only when the eligibility gate itself has one unique code.
  Ambiguous multiple matches remain for clinician selection.
*/
define "Question 2.1 Definite Answer":
  if Count("Procedure Matched Diagnosis Codes") = 1 then
    First("Procedure Matched Diagnosis Codes")
  else if Count("Eligible Diagnosis Candidate Codes") = 1 then
    First("Eligible Diagnosis Candidate Codes")
  else null

/* Confirmed Condition evidence sets. */
define "Congenital Craniofacial Conditions":
  [Condition: "Congenital Craniofacial Diagnoses"] C
    where "Is Current Confirmed Condition"(C)

define "Cleft Associated Conditions":
  [Condition: "Cleft Associated Diagnoses"] C
    where "Is Current Confirmed Condition"(C)

define "Disease Related Deformity Condition Candidates":
  [Condition: "Disease Related Deformity Diagnoses"] C
    where "Is Current Confirmed Condition"(C)
      and "Condition Is In Current Lookback"(C)

define "Nasal Valve Collapse Condition Candidates":
  [Condition: "Nasal Valve Collapse Diagnoses"] C
    where "Is Current Confirmed Condition"(C)
      and "Condition Is In Current Lookback"(C)

define "Obstructive Sleep Apnea Condition Candidates":
  [Condition: "Obstructive Sleep Apnea Diagnoses"] C
    where "Is Current Confirmed Condition"(C)
      and "Condition Is In Current Lookback"(C)

define "Deviated Nasal Septum Condition Candidates":
  [Condition: "Deviated Nasal Septum Diagnoses"] C
    where "Is Current Confirmed Condition"(C)
      and "Condition Is In Current Lookback"(C)

define "Acquired Nasal Deformity Condition Candidates":
  [Condition: "Acquired Nasal Deformity Diagnoses"] C
    where "Is Current Confirmed Condition"(C)
      and "Condition Is In Current Lookback"(C)

define "Epistaxis Condition Candidates":
  [Condition: "Epistaxis Diagnoses"] C
    where "Is Current Confirmed Condition"(C)
      and "Condition Is In Current Lookback"(C)

define "Nasal Congestion Condition Candidates":
  [Condition: "Nasal Congestion Diagnoses"] C
    where "Is Current Confirmed Condition"(C)
      and "Condition Is In Current Lookback"(C)

define "Sleep Disordered Breathing Condition Candidates":
  [Condition: "Sleep Disordered Breathing Diagnoses"] C
    where "Is Current Confirmed Condition"(C)
      and "Condition Is In Current Lookback"(C)

define "Chronic Sinusitis Condition Candidates":
  [Condition: "Chronic Sinusitis Evidence"] C
    where "Is Current Confirmed Condition"(C)
      and "Condition Is In Current Lookback"(C)

/* Confirmed conservative-treatment evidence resources. */
define "Refractory Observation Candidates":
  [Observation: "Refractory Evidence"] O
    where "Is Final Observation"(O)
      and "Observation Is In Current Lookback"(O)

define "Recurrent Observation Candidates":
  [Observation: "Recurrent Evidence"] O
    where "Is Final Observation"(O)
      and "Observation Is In Current Lookback"(O)

define "Persistent Observation Candidates":
  [Observation: "Persistent Evidence"] O
    where "Is Final Observation"(O)
      and "Observation Is In Current Lookback"(O)

define "Completed Antibiotic Therapy Candidates":
  [Procedure: "Antibiotic Therapy Procedures"] P
    where "Is Completed Procedure"(P)
      and "Procedure Is In Current Lookback"(P)

define "Completed Inhaled Steroid Therapy Candidates":
  [Procedure: "Inhaled Steroid Therapy Procedures"] P
    where "Is Completed Procedure"(P)
      and "Procedure Is In Current Lookback"(P)

/*
  Historical fracture evidence intentionally does not use the current-condition
  status filter or the chronic 12-month window. Rhonda confirmed that
  historical/resolved fracture Conditions may establish trauma context and that
  the complete available patient history should be searched.
*/
define "Historical Nasal Fracture Condition Candidates":
  [Condition: "Nasal Fracture Evidence Diagnoses"] C
    where "Is Confirmed Historical Condition"(C)

/* Confirmed composite evidence candidates. */
define "Post Traumatic Nasal Deformity Candidate":
  exists("Acquired Nasal Deformity Condition Candidates")
    and exists("Historical Nasal Fracture Condition Candidates")

define "Traumatic Septal Deviation Candidate":
  exists("Deviated Nasal Septum Condition Candidates")
    and exists("Historical Nasal Fracture Condition Candidates")

define "Nasal Fracture History Candidate":
  exists("Historical Nasal Fracture Condition Candidates")

/*
  The following outputs are safe to emit without the unresolved chronic
  lookback anchor. They use the exact local answer codes in the final
  Questionnaire.
*/
define "Question 3.1 Definite Answers":
  ({
    if exists("Congenital Craniofacial Conditions") then
      'Congenital / Craniofacial Anomaly'
    else null,
    if "Post Traumatic Nasal Deformity Candidate"
        or "Traumatic Septal Deviation Candidate" then
      'Trauma-Related Deformity'
    else null,
    if exists("Disease Related Deformity Condition Candidates") then
      'Disease-Related Deformity'
    else null,
    if exists("Nasal Valve Collapse Condition Candidates") then
      'Nasal Valve Collapse / Stenosis'
    else null,
    if exists("Obstructive Sleep Apnea Condition Candidates") then
      'OSA with Nasal Component'
    else null,
    if exists("Deviated Nasal Septum Condition Candidates") then
      'Septal Deviation Obstruction'
    else null
  }) AnswerCode
    where AnswerCode is not null

define "Question 3.1.a Definite Answers":
  ({
    if exists("Cleft Associated Conditions") then
      'Cleft-associated nasal deformity'
    else null
  }) AnswerCode
    where AnswerCode is not null

define "Question 3.1.f Definite Answers":
  ({
    if "Post Traumatic Nasal Deformity Candidate" then
      'Post-traumatic nasal deformity'
    else null,
    if "Nasal Fracture History Candidate" then
      'History of nasal fracture'
    else null,
    if "Traumatic Septal Deviation Candidate" then
      'Traumatic septal deviation'
    else null
  }) AnswerCode
    where AnswerCode is not null

define "Question 3.1.c Definite Answers":
  ({
    if exists("Nasal Valve Collapse Condition Candidates") then
      'Internal/external valve collapse'
    else null
  }) AnswerCode
    where AnswerCode is not null

define "Question 3.1.d Definite Answers":
  ({
    if exists("Obstructive Sleep Apnea Condition Candidates") then
      'Documented OSA / AHI value'
    else null
  }) AnswerCode
    where AnswerCode is not null

define "Question 3.1.g Definite Answers":
  ({
    if exists("Deviated Nasal Septum Condition Candidates") then
      'Deviated nasal septum'
    else null,
    if exists("Deviated Nasal Septum Condition Candidates")
        and exists("Epistaxis Condition Candidates") then
      'Epistaxis related to deformity'
    else null
  }) AnswerCode
    where AnswerCode is not null

define "Question 3.3 Definite Answers":
  ({
    if exists("Nasal Congestion Condition Candidates") then
      'Nasal airway obstruction'
    else null,
    if exists("Sleep Disordered Breathing Condition Candidates") then
      'Sleep-disordered breathing'
    else null,
    if exists("Chronic Sinusitis Condition Candidates") then
      'Recurrent sinus infection'
    else null
  }) AnswerCode
    where AnswerCode is not null

/*
  Question 4.1 applies to recurrent sinus infection and therefore requires a
  current chronic-sinusitis Condition in addition to the response Observation
  and completed antibiotic-therapy Procedure. Question 4.2 follows the exact
  approved obstruction-treatment combinations from the spreadsheet.

  Both questionnaire items are single-choice. If conflicting response states
  are simultaneously documented, no automatic answer is selected.
*/
define "Question 4.1 Supported Answers":
  ({
    if exists("Chronic Sinusitis Condition Candidates")
        and exists("Refractory Observation Candidates")
        and exists("Completed Antibiotic Therapy Candidates") then
      'Refractory'
    else null,
    if exists("Chronic Sinusitis Condition Candidates")
        and exists("Recurrent Observation Candidates")
        and exists("Completed Antibiotic Therapy Candidates") then
      'Recurrent'
    else null,
    if exists("Chronic Sinusitis Condition Candidates")
        and exists("Persistent Observation Candidates")
        and exists("Completed Antibiotic Therapy Candidates") then
      'Persistent'
    else null
  }) AnswerCode
    where AnswerCode is not null

define "Question 4.1 Definite Answer":
  if Count(distinct ("Question 4.1 Supported Answers")) = 1 then
    First(distinct ("Question 4.1 Supported Answers"))
  else null

define "Question 4.2 Supported Answers":
  ({
    if exists("Refractory Observation Candidates")
        and exists("Completed Inhaled Steroid Therapy Candidates") then
      'Refractory'
    else null,
    if exists("Recurrent Observation Candidates")
        and exists("Completed Inhaled Steroid Therapy Candidates") then
      'Recurrent'
    else null,
    if exists("Persistent Observation Candidates")
        and exists("Completed Inhaled Steroid Therapy Candidates") then
      'Persistent'
    else null
  }) AnswerCode
    where AnswerCode is not null

define "Question 4.2 Definite Answer":
  if Count(distinct ("Question 4.2 Supported Answers")) = 1 then
    First(distinct ("Question 4.2 Supported Answers"))
  else null

/*
  Public expressions used by Questionnaire.cqf-expression extensions.
  Internal definitions retain descriptive names; these stable identifiers form
  the Questionnaire-to-CQL interface and follow the convention used by the
  vetted ECTA questionnaires.
*/
define OrderDate:
  "Order Date"

define RequestedProcedureDate:
  "Requested Procedure Date"

define RequestedProcedureCodes:
  "Requested Procedure Codings" Coding
    return Coding.code

define PrimaryDiagnosis:
  if "Question 2.1 Definite Answer" is not null then
    "Question 2.1 Definite Answer".code
  else null

define ConditionRequiringProcedure:
  "Question 3.1 Definite Answers"

define CongenitalCraniofacialFinding:
  "Question 3.1.a Definite Answers"

define NasalValveCollapseFinding:
  "Question 3.1.c Definite Answers"

define ObstructiveSleepApneaFinding:
  "Question 3.1.d Definite Answers"

define TraumaRelatedFinding:
  "Question 3.1.f Definite Answers"

define SeptalDeviationFinding:
  "Question 3.1.g Definite Answers"

define FunctionalImpact:
  "Question 3.3 Definite Answers"

define AntibioticTherapyResponse:
  "Question 4.1 Definite Answer"

define NasalSteroidTherapyResponse:
  "Question 4.2 Definite Answer"

/*
  Item 2.1 remains unpopulated when multiple eligible diagnoses cannot be
  reduced to one unique explicit CPT-category match. It is left for manual
  clinician selection rather than choosing an arbitrary code.

  Absence of evidence must produce null/empty output, never "other", "no", or
  an N/A answer. Manual QuestionnaireResponse values are merged outside this
  library and must be preserved.
*/

library EyelidSurgeryDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include EyelidSurgery version '1.0.0' called EyelidSurgery

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Lower Eyelid Blepharoplasty Codes": '2.16.840.1.113883.3.6037.1001.23.93.193'
valueset "Upper Eyelid Blepharoplasty Codes": '2.16.840.1.113883.3.6037.1001.23.93.194'

parameter "QuestionnaireResponse" QuestionnaireResponse
parameter "ServiceRequest" ServiceRequest

context Patient

define "prior-auth":
  true
  
define "prior-auth-description":
  'CMS guidelines specify BLEPHAROPLASTY under list of hospital outpatient department services
requiring prior authorization beginning for service dates on or after July 1, 2020'

define "documentation":
  true

define "dtr-clin":
  true

define "topic":
  'Blepharoplasty'
  
define Request:
	"ServiceRequest"

define QT:
	"QuestionnaireResponse".item

define AnatomicalLocationOfSurgeryResponse:
  ("QT".item I
		where I.linkId.value = 'AnatomicalLocationOfSurgery')QR
		return First(QR.answer).value

define SurgeryAnatomicalLocation:
  EyelidSurgery."AnatomicalLocationOfSurgery"

define AnatomicalLocationOfSurgery:
  Coalesce(First("AnatomicalLocationOfSurgeryResponse".code), "SurgeryAnatomicalLocation")

define AnatomicalLocationOfSurgeryDecision:
  if "AnatomicalLocationOfSurgery" = 'Upper Eye Lid'
      then true
        else false

define SurgeryPurposeResponse:
	("QT".item I
		where I.linkId.value = 'SurgeryPurpose')QR
		return First(QR.answer).value

define EyelidSurgeryPurpose:
      EyelidSurgery."SurgeryPurpose"

define SurgeryPurpose:
  Coalesce(First("SurgeryPurposeResponse".code), "EyelidSurgeryPurpose")

define SurgeryPurposeDecision:
  if "SurgeryPurpose" = 'Reconstructive'
      then true
        else false

//Functional Indications
define VisionInterferenceResponse:
  ("QT".item I
		where I.linkId.value = 'VisionInterference')QR
		return First(QR.answer).value

define VisionInterferenceCondition:
   EyelidSurgery."VisionInterference"

define VisionInterference:
  Coalesce(First("VisionInterferenceResponse"), "VisionInterferenceCondition")

define ImpairmentInDailyActivitiesResponse:
  ("QT".item I
		where I.linkId.value = 'ImpairmentInDailyActivities')QR
		return First(QR.answer).value

define ImpairmentInDailyActivitiesCondition:
   EyelidSurgery."ImpairmentInDailyActivities"

define ImpairmentInDailyActivities:
  Coalesce(First("ImpairmentInDailyActivitiesResponse"), "ImpairmentInDailyActivitiesCondition")

define DifficultyFittingSpectaclesResponse:
  ("QT".item I
		where I.linkId.value = 'DifficultyFittingSpectacles')QR
		return First(QR.answer).value

define DifficultyFittingSpectaclesCondition:
  EyelidSurgery."DifficultyFittingSpectacles"

define DifficultyFittingSpectacles:
    Coalesce(First("DifficultyFittingSpectaclesResponse"), "DifficultyFittingSpectaclesCondition")

define EyelidIrritationResponse:
  ("QT".item I
		where I.linkId.value = 'EyelidIrritation')QR
		return First(QR.answer).value

define EyelidIrritationCondition:
  EyelidSurgery."EyelidIrritation"

define EyelidIrritation:
  Coalesce(First("EyelidIrritationResponse"), "EyelidIrritationCondition")

define SocketResponse:
  ("QT".item I
		where I.linkId.value = 'Socket')QR
		return First(QR.answer).value

define SocketCondition:
  EyelidSurgery."Socket"

define Socket:
    Coalesce(First("SocketResponse"), "SocketCondition")

define DifficultyFittingProsthesisResponse:
  ("QT".item I
		where I.linkId.value = 'DifficultyFittingProsthesis')QR
		return First(QR.answer).value

define DifficultyFittingProsthesisCondition:
  EyelidSurgery."DifficultyFittingProsthesis"

define DifficultyFittingProsthesis:
  Coalesce(First("DifficultyFittingProsthesisResponse"), "DifficultyFittingProsthesisCondition")

define FunctionalIndicationsDecision:
  if (("VisionInterference" = true and "ImpairmentInDailyActivities" = true)
        or ("DifficultyFittingSpectacles" = true)
          or ("EyelidIrritation" = true)
            or ("Socket" = true and "DifficultyFittingProsthesis" = true))
              then true
                else false

//Diagnosis
define DermatochalasisResponse:
  ("QT".item I
		where I.linkId.value = 'CheckDermatochalasis')QR
		return First(QR.answer).value

define CheckDermatochalasisCondition:
  EyelidSurgery."CheckDermatochalasis"

define CheckDermatochalasis:
    Coalesce(First("DermatochalasisResponse"), "CheckDermatochalasisCondition")

define DifficultySpectaclesDermatochalasisResponse:
  ("QT".item I
		where I.linkId.value = 'DifficultySpectaclesDermatochalasis')QR
		return First(QR.answer).value

define DifficultySpectaclesDermatochalasisCondition:
  EyelidSurgery."DifficultySpectaclesDermatochalasis"

define DifficultySpectaclesDermatochalasis:
  Coalesce(First("DifficultySpectaclesDermatochalasisResponse"), "DifficultySpectaclesDermatochalasisCondition")

define ThyroidEyeConditionResponse:
  ("QT".item I
		where I.linkId.value = 'ThyroidEyeCondition')QR
		return First(QR.answer).value

define ThyroidEyeDisease:
    EyelidSurgery."ThyroidEyeCondition"

define ThyroidEyeCondition:
  Coalesce(First("ThyroidEyeConditionResponse"), "ThyroidEyeDisease")

define ThyroidChronicDermatitisResponse:
  ("QT".item I
		where I.linkId.value = 'ThyroidChronicDermatitis')QR
		return First(QR.answer).value

define ThyroidChronicDermatitisCondition:
  EyelidSurgery."ThyroidChronicDermatitis"

define ThyroidChronicDermatitis:
    Coalesce(First("ThyroidChronicDermatitisResponse"), "ThyroidChronicDermatitisCondition")

define CheckBlepharochalasisResponse:
  ("QT".item I
		where I.linkId.value = 'CheckBlepharochalasis')QR
		return First(QR.answer).value

define CheckBlepharochalasisCondition:
  EyelidSurgery."CheckBlepharochalasis"

define CheckBlepharochalasis:
  Coalesce(First("CheckBlepharochalasisResponse"), "CheckBlepharochalasisCondition")

define ChronicDermatitisOrEyeIrritationResponse:
  ("QT".item I
		where I.linkId.value = 'ChronicDermatitisOrEyeIrritation')QR
		return First(QR.answer).value

define ChronicDermatitisOrEyeIrritationCondition:
  EyelidSurgery."ChronicDermatitisOrEyeIrritation"

define ChronicDermatitisOrEyeIrritation:
  Coalesce(First("ChronicDermatitisOrEyeIrritationResponse"), "ChronicDermatitisOrEyeIrritationCondition")

define IdiopathicBlepharospasmResponse:
  ("QT".item I
		where I.linkId.value = 'IdiopathicBlepharospasm')QR
		return First(QR.answer).value

define IdiopathicBlepharospasmCondition:
  EyelidSurgery."IdiopathicBlepharospasm"

define IdiopathicBlepharospasm:
  Coalesce(First("IdiopathicBlepharospasmResponse"), "IdiopathicBlepharospasmCondition")

define AnophthalmicSocketResponse:
  ("QT".item I
		where I.linkId.value = 'AnophthalmicSocket')QR
		return First(QR.answer).value

define AnophthalmicSocketCondition:
  EyelidSurgery."AnophthalmicSocket"

define AnophthalmicSocket:
  Coalesce(First("AnophthalmicSocketResponse"), "AnophthalmicSocketCondition")

define CheckPtosisResponse:
  ("QT".item I
		where I.linkId.value = 'CheckPtosis')QR
		return First(QR.answer).value

define CheckPtosisCondition:
  EyelidSurgery."CheckPtosis"

define CheckPtosis:
  Coalesce(First("CheckPtosisResponse"), "CheckPtosisCondition")

define PtosisDifficultyProsthesisResponse:
  ("QT".item I
		where I.linkId.value = 'PtosisDifficultyProsthesis')QR
		return First(QR.answer).value

define PtosisDifficultyProsthesisCondition:
  EyelidSurgery."PtosisDifficultyProsthesis"

define PtosisDifficultyProsthesis:
  Coalesce(First("PtosisDifficultyProsthesisResponse"), "PtosisDifficultyProsthesisCondition")

define BrowPtosisResponse:
  ("QT".item I
		where I.linkId.value = 'BrowPtosis')QR
		return First(QR.answer).value

define BrowPtosisCondition:
  EyelidSurgery."BrowPtosis"

define BrowPtosis:
  Coalesce(First("BrowPtosisResponse"), "BrowPtosisCondition")

define CheckBlepharoptosisResponse:
  ("QT".item I
		where I.linkId.value = 'CheckBlepharoptosis')QR
		return First(QR.answer).value

define CheckBlepharoptosisCondition:
  EyelidSurgery."CheckBlepharoptosis"

define CheckBlepharoptosis:
  Coalesce(First("CheckBlepharoptosisResponse"), "CheckBlepharoptosisCondition")

define BlepharoptosisFunctionalDeficitResponse:
  ("QT".item I
		where I.linkId.value = 'BlepharoptosisFunctionalDeficit')QR
		return First(QR.answer).value

define BlepharoptosisFunctionalDeficitCondition:
  EyelidSurgery."BlepharoptosisFunctionalDeficit"

define BlepharoptosisFunctionalDeficit:
  Coalesce(First("BlepharoptosisFunctionalDeficitResponse"), "BlepharoptosisFunctionalDeficitCondition")

define QualifiedDiagnosisDecision:
  if (("CheckDermatochalasis" = true and "DifficultySpectaclesDermatochalasis" = true)
        or ("ThyroidEyeCondition" = true and "ThyroidChronicDermatitis" = true)
          or ("CheckBlepharochalasis" = true and "ChronicDermatitisOrEyeIrritation" = true)
            or ("IdiopathicBlepharospasm" = true)
              or ("AnophthalmicSocket" = true and "CheckPtosis" = true and "PtosisDifficultyProsthesis" = true)
                or ("BrowPtosis" = true)
                  or ("CheckBlepharoptosis" = true and "BlepharoptosisFunctionalDeficit" = true))
                    then true
                      else false

//Laterality
define LateralityResponse:
  ("QT".item I
		where I.linkId.value = 'Laterality')QR
		return First(QR.answer).value

define LateralityCondition:
  EyelidSurgery."Laterality"

define Laterality:
  Coalesce(First("LateralityResponse"), "LateralityCondition")

define AnatomicalLocationConditionResponse:
  ("QT".item I
		where I.linkId.value = 'AnatomicalLocationCondition')QR
		return First(QR.answer).value

define AnatomicalLocation:
  EyelidSurgery."AnatomicalLocationCondition"

define AnatomicalLocationCondition:
  Coalesce(First("AnatomicalLocationConditionResponse"), "AnatomicalLocation")

//Physical Signs
define ExcessiveSkinOverhanging:
  ("QT".item I
		where I.linkId.value = 'ExcessiveSkinOverhanging')QR
		return First(QR.answer).value

define PseudoMRDResponse:
  ("QT".item I
		where I.linkId.value = 'PseudoMRD')QR
		return First(QR.answer).value

define PseudoMRDObservation:
  EyelidSurgery."PseudoMRD"

define PseudoMRD:
  Coalesce(First("PseudoMRDResponse"), "PseudoMRDObservation")

define RedundantTissueObscureSight:
  ("QT".item I
		where I.linkId.value = 'RedundantTissueObscureSight')QR
		return First(QR.answer).value

define EdemaRedundantTissueResponse:
  ("QT".item I
		where I.linkId.value = 'EdemaRedundantTissue')QR
		return First(QR.answer).value

define EdemaRedundantTissueCondition:
  EyelidSurgery."EdemaRedundantTissue"

define EdemaRedundantTissue:
  Coalesce(First("EdemaRedundantTissueResponse"), "EdemaRedundantTissueCondition")

define AngleEyelidLifting:
  ("QT".item I
		where I.linkId.value = 'AngleEyelidLifting')QR
		return First(QR.answer).value

define AngleEyelidLiftingDecision:
	if (First("AngleEyelidLifting") = true)
			then true
				else false

define PhysicalSignsDecision:
   if (((First("ExcessiveSkinOverhanging") = true) and "PseudoMRD" = true)
          or (First("RedundantTissueObscureSight") = true)
            or ("EdemaRedundantTissue" = true)
              or ("AngleEyelidLiftingDecision") = true)
                then true
                  else false

//Contraindications
define ThyroidOrbitopathyResponse:
  ("QT".item I
		where I.linkId.value = 'ThyroidOrbitopathy')QR
		return First(QR.answer).value

define ThyroidOrbitopathyCondition:
  EyelidSurgery."ThyroidOrbitopathy"

define ThyroidOrbitopathy:
  Coalesce(First("ThyroidOrbitopathyResponse"), "ThyroidOrbitopathyCondition")

define CheckProptosisResponse:
  ("QT".item I
		where I.linkId.value = 'CheckProptosis')QR
		return First(QR.answer).value

define CheckProptosisCondition:
  EyelidSurgery."CheckProptosis"

define CheckProptosis:
  Coalesce(First("CheckProptosisResponse"), "CheckProptosisCondition")

define ContraindicationForBlepharoplasty:
  if ("ThyroidOrbitopathy" = true
        and "CheckProptosis" = true)
          then true
            else false

define BlepharoplastyPrimaryDecision:
  if ("AnatomicalLocationOfSurgeryDecision" = true
        and "SurgeryPurposeDecision" = true
          and "FunctionalIndicationsDecision" = true
            and "QualifiedDiagnosisDecision" = true
              and "PhysicalSignsDecision" = true)
                then true
                  else false

define IntermediateDecision:
  if ("BlepharoplastyPrimaryDecision" = true
        and "ContraindicationForBlepharoplasty" = false)
          then 'YES FOR BLEPHAROPLASTY. PHOTOGRAPHIC EVIDENCE TO BE REVIEWED'
            else if ("BlepharoplastyPrimaryDecision" = true
              and "ContraindicationForBlepharoplasty" = true)
                then 'BLEPHAROPLASTY IS CONTRAINDICATED'
                  else 'HUMAN REVIEW NEEDED'

define FinalDecision:
  if "IntermediateDecision" = 'YES FOR BLEPHAROPLASTY. PHOTOGRAPHIC EVIDENCE TO BE REVIEWED'
    then 'HUMAN REVIEW NEEDED'
      else 'NO'

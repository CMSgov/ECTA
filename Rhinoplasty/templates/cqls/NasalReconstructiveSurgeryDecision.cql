library NasalReconstructiveSurgeryDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include NasalReconstructiveSurgery version '1.0.0' called NasalSurgery

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Nasal Reconstructive Surgery Codes": '2.16.840.1.113883.3.6037.1001.23.93.120'
valueset "Nasal Reconstructive Surgery Including Septoplasty": '2.16.840.1.113883.3.6037.1001.23.93.121'

parameter "QuestionnaireResponse" QuestionnaireResponse
parameter "ServiceRequest" ServiceRequest

context Patient

define Request:
	"ServiceRequest"

define QT:
	"QuestionnaireResponse".item

define "prior-auth":
  true
  
define "prior-auth-description":
  'CMS guidelines specify RHINOPLASTY under list of hospital outpatient department services
requiring prior authorization beginning for service dates on or after July 1, 2020'

define "documentation":
  false

define "dtr-clin":
  true
  
define "topic":
	'Rhinoplasty'
	
define NasalReconstructiveSurgeryRequest:
  if exists("Request".code.coding C where C in "Nasal Reconstructive Surgery Codes")
  	    then true
	        else false

define NasalReconstructiveSurgeryWithSeptalRequest:
  if exists("Request".code.coding C where C in "Nasal Reconstructive Surgery Including Septoplasty")
  	    then true
	        else false

define SurgeryPurposeResponse:
	("QT".item I
		where I.linkId.value = 'SurgeryPurpose')QR
		return First(QR.answer).value

define NasalSurgeryPurpose:
      NasalSurgery."SurgeryPurpose"

define SurgeryPurpose:
  Coalesce(First("SurgeryPurposeResponse".code), "NasalSurgeryPurpose")

define SurgeryPurposeDecision:
  if "SurgeryPurpose" = 'Reconstructive'
      then true
        else false

define NasalAirwayObstructionResponse:
  ("QT".item I
		where I.linkId.value = 'NasalAirwayObstruction')QR
		return First(QR.answer).value

define NasalObstruction:
   NasalSurgery."NasalAirwayObstruction"

define NasalAirwayObstruction:
  Coalesce(First("NasalAirwayObstructionResponse"), "NasalObstruction")

define CheckNasalObstruction:
  if "NasalAirwayObstruction" = true
      then true
        else false

define NasalSeptumDeviationOrDeformityResponse:
  ("QT".item I
		where I.linkId.value = 'NasalSeptumDeviationOrDeformity')QR
		return First(QR.answer).value

define NasalSeptumDeviation:
   NasalSurgery."NasalSeptumDeviationOrDeformity"

define NasalSeptumDeviationOrDeformity:
  Coalesce(First("NasalSeptumDeviationOrDeformityResponse"), "NasalSeptumDeviation")

define CheckNasalSeptumDeviation:
  if "NasalSeptumDeviationOrDeformity" = true
      then true
        else false

//Conservative Medical Therapy
define ProsthesisMedicalTherapyResponse:
  ("QT".item I
		where I.linkId.value = 'RehabilitationProsthesis')QR
		return First(QR.answer).value

define ProsthesisTherapyProcedure:
  exists(NasalSurgery."RehabilitationProsthesisTherapy")

define RehabilitationProsthesis:
    Coalesce(First("ProsthesisMedicalTherapyResponse"), "ProsthesisTherapyProcedure")

define ProsthesisForSixWeeksResponse:
  ("QT".item I
		where I.linkId.value = 'ProsthesisForSixWeeks')QR
		return First(QR.answer).value

define ProsthesisMedicalTherapyForSixWeeks:
  exists(NasalSurgery."ProsthesisUsageMoreThanSixWeeks")

define ProsthesisForSixWeeks:
  Coalesce(First("ProsthesisForSixWeeksResponse"), "ProsthesisMedicalTherapyForSixWeeks")

define ImprovementPostProsthesisResponse:
  ("QT".item I
		where I.linkId.value = 'ImprovementPostProsthesis')QR
		return First(QR.answer).value

define PostProsthesisMedicalTherapy:
  NasalSurgery."ImprovementPostProsthesis"

define ImprovementPostProsthesis:
    Coalesce(First("ImprovementPostProsthesisResponse"), "PostProsthesisMedicalTherapy")

define AntiHistamineTherapyResponse:
  ("QT".item I
		where I.linkId.value = 'AntiHistamineMedicalTherapy')QR
		return First(QR.answer).value

define AntiHistamineTherapyProcedure:
  NasalSurgery."AntiHistamineMedicalTherapy"

define AntiHistamineMedicalTherapy:
  Coalesce(First("AntiHistamineTherapyResponse"), "AntiHistamineTherapyProcedure")

define AntiHistamineTherapyForSixWeeksResponse:
  ("QT".item I
		where I.linkId.value = 'AntiHistamineTherapyForSixWeeks')QR
		return First(QR.answer).value

define AntiHistamineMedicalTherapyForSixWeeks:
  NasalSurgery."AntiHistamineTherapyForSixWeeks"

define AntiHistamineTherapyForSixWeeks:
    Coalesce(First("AntiHistamineTherapyForSixWeeksResponse"), "AntiHistamineMedicalTherapyForSixWeeks")

define PostAntiHistamineMedicalTherapyResponse:
  ("QT".item I
		where I.linkId.value = 'ImprovementPostAntiHistamineMedicalTherapy')QR
		return First(QR.answer).value

define PostAntiHistamineMedicalTherapy:
  NasalSurgery."ImprovementPostAntiHistamineMedicalTherapy"

define ImprovementPostAntiHistamineMedicalTherapy:
  Coalesce(First("PostAntiHistamineMedicalTherapyResponse"), "PostAntiHistamineMedicalTherapy")

define ImmunosuppressantsMedicalTherapyResponse:
  ("QT".item I
		where I.linkId.value = 'ImmunosuppressantsMedicalTherapy')QR
		return First(QR.answer).value

define ImmunosuppressantsMedicalTherapyProcedure:
    NasalSurgery."ImmunosuppressantsMedicalTherapy"

define ImmunosuppressantsMedicalTherapy:
  Coalesce(First("ImmunosuppressantsMedicalTherapyResponse"), "ImmunosuppressantsMedicalTherapyProcedure")

define ImmunosuppressantsTherapyForSixWeeksResponse:
  ("QT".item I
		where I.linkId.value = 'ImmunosuppressantsTherapyForSixWeeks')QR
		return First(QR.answer).value

define ImmunosuppressantsMedicalTherapyForSixWeeks:
  NasalSurgery."ImmunosuppressantsTherapyForSixWeeks"

define ImmunosuppressantsTherapyForSixWeeks:
    Coalesce(First("ImmunosuppressantsTherapyForSixWeeksResponse"), "ImmunosuppressantsMedicalTherapyForSixWeeks")

define PostImmunosuppressantsMedicalTherapyResponse:
  ("QT".item I
		where I.linkId.value = 'PostImmunosuppressantsMedicalTherapy')QR
		return First(QR.answer).value

define PostImmunosuppressantsTherapy:
  NasalSurgery."PostImmunosuppressantsMedicalTherapy"

define PostImmunosuppressantsMedicalTherapy:
  Coalesce(First("PostImmunosuppressantsMedicalTherapyResponse"), "PostImmunosuppressantsTherapy")

define DecongestantsMedicalTherapyResponse:
  ("QT".item I
		where I.linkId.value = 'DecongestantsMedicalTherapy')QR
		return First(QR.answer).value

define DecongestantsMedicalTherapyProcedure:
  NasalSurgery."DecongestantsMedicalTherapy"

define DecongestantsMedicalTherapy:
  Coalesce(First("DecongestantsMedicalTherapyResponse"), "DecongestantsMedicalTherapyProcedure")

define DecongestantsTherapyForSixWeeksResponse:
  ("QT".item I
		where I.linkId.value = 'DecongestantsTherapyForSixWeeks')QR
		return First(QR.answer).value

define DecongestantsMedicalTherapyForSixWeeks:
  NasalSurgery."DecongestantsTherapyForSixWeeks"

define DecongestantsTherapyForSixWeeks:
  Coalesce(First("DecongestantsTherapyForSixWeeksResponse"), "DecongestantsMedicalTherapyForSixWeeks")

define PostDecongestantsMedicalTherapyResponse:
  ("QT".item I
		where I.linkId.value = 'PostDecongestantsMedicalTherapy')QR
		return First(QR.answer).value

define PostDecongestantsTherapy:
  NasalSurgery."PostDecongestantsMedicalTherapy"

define PostDecongestantsMedicalTherapy:
  Coalesce(First("PostDecongestantsMedicalTherapyResponse"), "PostDecongestantsTherapy")

define AntibioticMedicalTherapyResponse:
  ("QT".item I
		where I.linkId.value = 'AntibioticMedicalTherapy')QR
		return First(QR.answer).value

define AntibioticMedicalTherapyProcedure:
  NasalSurgery."AntibioticMedicalTherapy"

define AntibioticMedicalTherapy:
  Coalesce(First("AntibioticMedicalTherapyResponse"), "AntibioticMedicalTherapyProcedure")

define AntibioticTherapyForSixWeeksResponse:
  ("QT".item I
		where I.linkId.value = 'AntibioticTherapyForSixWeeks')QR
		return First(QR.answer).value

define AntibioticMedicalTherapyForSixWeeks:
  NasalSurgery."AntibioticTherapyForSixWeeks"

define AntibioticTherapyForSixWeeks:
  Coalesce(First("AntibioticTherapyForSixWeeksResponse"), "AntibioticMedicalTherapyForSixWeeks")

define PostAntibioticMedicalTherapyResponse:
  ("QT".item I
		where I.linkId.value = 'PostAntibioticMedicalTherapy')QR
		return First(QR.answer).value

define PostAntibioticTherapy:
  NasalSurgery."PostAntibioticMedicalTherapy"

define PostAntibioticMedicalTherapy:
  Coalesce(First("PostAntibioticMedicalTherapyResponse"), "PostAntibioticTherapy")

//Congenital Defect
define CongenitalDefectResponse:
  ("QT".item I
		where I.linkId.value = 'CongenitalDefect')QR
		return First(QR.answer).value

define CongenitalDefectCondition:
  exists(NasalSurgery."CongenitalDeflectDiagnosis")

define CongenitalDefect:
  Coalesce(First("CongenitalDefectResponse"), "CongenitalDefectCondition")

define FunctionalImpairmentResponse:
  ("QT".item I
		where I.linkId.value = 'FunctionalImpairment')QR
		return First(QR.answer).value

define FunctionalImpairmentCondition:
  exists(NasalSurgery."SecondaryFunctionalImpairmentConditions")

define FunctionalImpairment:
  Coalesce(First("FunctionalImpairmentResponse"), "FunctionalImpairmentCondition")

define ClefLipOrPalateRepairResponse:
  ("QT".item I
		where I.linkId.value = 'ClefLipOrPalateRepair')QR
		return First(QR.answer).value

define CleftLipOrPalateRepairRequired:
  NasalSurgery."ClefLipOrPalateRepair"

define ClefLipOrPalateRepair:
  Coalesce(First("ClefLipOrPalateRepairResponse"), "CleftLipOrPalateRepairRequired")

define CongenitalDefectPostMedicalTherapyOutcome:
  if "ImprovementPostProsthesis" = true
      then true
        else false

define CongenitalDefectDecisionForRhinoplasty:
  if ("CongenitalDefect" = true
        and "FunctionalImpairment" = true
          and "ProsthesisForSixWeeks" = true
            and "CongenitalDefectPostMedicalTherapyOutcome" = false)
              then true
                else false

define CongenitalDefectDecisionForSeptoplasty:
  if ("ClefLipOrPalateRepair" = true
        and "ProsthesisForSixWeeks" = true
            and "CongenitalDefectPostMedicalTherapyOutcome" = false)
              then true
                else false

//Benign Disease
define BenignDiseasesResponse:
  ("QT".item I
		where I.linkId.value = 'BenignDiseasesCausingNasalObstruction')QR
		return First(QR.answer).value

define BenignDiseases:
  NasalSurgery."BenignDiseasesCausingNasalObstruction"

define BenignDiseasesCausingNasalObstruction:
  Coalesce(First("BenignDiseasesResponse"), "BenignDiseases")

define BenignDiseasesMedicalTherapyForSixWeeks:
  if ("ProsthesisForSixWeeks" = true
        or "ImmunosuppressantsTherapyForSixWeeks" = true
          or "DecongestantsTherapyForSixWeeks" = true
            or "AntiHistamineTherapyForSixWeeks" = true)
              then true
                else false

define BenignDiseasesPostMedicalTherapy:
  if ("ImprovementPostProsthesis" = false
        or "ImprovementPostAntiHistamineMedicalTherapy" = false
          or "PostImmunosuppressantsMedicalTherapy" = false
            or "PostDecongestantsMedicalTherapy" = false)
              then true
                else false

define BenignDiseaseDecision:
  if ("BenignDiseasesCausingNasalObstruction" = true
        and "BenignDiseasesMedicalTherapyForSixWeeks" = true
          and "BenignDiseasesPostMedicalTherapy" = true)
              then true
                else false

//Trauma
define NasalTraumaResponse:
  ("QT".item I
		where I.linkId.value = 'Trauma')QR
		return First(QR.answer).value

define NasalTraumaCondition:
  exists(NasalSurgery."NasalTrauma")

define Trauma:
  Coalesce(First("NasalTraumaResponse"), "NasalTraumaCondition")

define NasalFractureResponse:
  ("QT".item I
		where I.linkId.value = 'NasalBoneFracture')QR
		return First(QR.answer).value

define NasalFractureCondition:
  exists(NasalSurgery."NasalFracture")

define NasalBoneFracture:
  Coalesce(First("NasalFractureResponse"), "NasalFractureCondition")

define NasalTraumaMedicalTherapyForSixWeeks:
  if ("ProsthesisForSixWeeks" = true
        or "ImmunosuppressantsTherapyForSixWeeks" = true
          or "DecongestantsTherapyForSixWeeks" = true
            or "AntiHistamineTherapyForSixWeeks" = true)
              then true
                else false

define NasalTraumaPostMedicalTherapy:
  if ("ImprovementPostProsthesis" = false
        or "ImprovementPostAntiHistamineMedicalTherapy" = false
          or "PostImmunosuppressantsMedicalTherapy" = false
            or "PostDecongestantsMedicalTherapy" = false)
              then true
                else false

define NasalTraumaDecision:
  if ("Trauma" = true
        and "NasalTraumaMedicalTherapyForSixWeeks" = true
          and "NasalTraumaPostMedicalTherapy" = true)
              then true
                else false

define NasalFracutreDecision:
  if "NasalBoneFracture" = true
    then true
      else false

define TraumaDecision:
    if (("NasalTraumaDecision" = true)
          or "NasalFracutreDecision" = true)
            then true
              else false

//Vestibular Stenosis
define VestibularStenosisResponse:
  ("QT".item I
		where I.linkId.value = 'VestibularStenosis')QR
		return First(QR.answer).value

define VestibularStenosisCondition:
  exists(NasalSurgery."VestibularStenosisCondition")

define VestibularStenosis:
  Coalesce(First("VestibularStenosisResponse"), "VestibularStenosisCondition")

define VestibularStenosisMedicalTherapyForSixWeeks:
  if ("ProsthesisForSixWeeks" = true
        or "ImmunosuppressantsTherapyForSixWeeks" = true)
           then true
             else false

define VestibularStenosisPostMedicalTherapy:
  if ("ImprovementPostProsthesis" = false
        or "PostImmunosuppressantsMedicalTherapy" = false)
          then true
            else false

define VestibularStenosisDecision:
  if ("VestibularStenosis" = true
        and "VestibularStenosisMedicalTherapyForSixWeeks" = true
          and "VestibularStenosisPostMedicalTherapy" = true)
              then true
                else false

//Recurrent Sinusitis
define RecurrentSinusitisResponse:
  ("QT".item I
		where I.linkId.value = 'RecurrentSinusitis')QR
		return First(QR.answer).value

define RecurrentSinusitisCondition:
  exists(NasalSurgery."RecurrentSinusitisCondition")

define RecurrentSinusitis:
  Coalesce(First("RecurrentSinusitisResponse"), "RecurrentSinusitisCondition")

define RecurrentSinusitisMedicalTherapy:
  if ("AntibioticTherapyForSixWeeks" = true
        or "ImmunosuppressantsTherapyForSixWeeks" = true
          or "DecongestantsTherapyForSixWeeks" = true
            or "AntiHistamineTherapyForSixWeeks" = true)
              then true
                else false

define RecurrentSinusitisPostMedicalTherapy:
  if ("PostAntibioticMedicalTherapy" = false
        or "ImprovementPostAntiHistamineMedicalTherapy" = false
          or "PostImmunosuppressantsMedicalTherapy" = false
            or "PostDecongestantsMedicalTherapy" = false)
              then true
                else false

define RecurrentSinusitisDecision:
  if ("RecurrentSinusitis" = true
        and "RecurrentSinusitisMedicalTherapy" = true
          and "RecurrentSinusitisPostMedicalTherapy" = true)
              then true
                else false

//Recurrent Epistaxis
define RecurrentEpistaxisResponse:
  ("QT".item I
		where I.linkId.value = 'RecurrentEpistaxis')QR
		return First(QR.answer).value

define RecurrentEpistaxisCondition:
  exists(NasalSurgery."RecurrentEpistaxisCondition")

define RecurrentEpistaxis:
  Coalesce(First("RecurrentEpistaxisResponse"), "RecurrentEpistaxisCondition")

define RecurrentEpistaxisDecision:
  if "RecurrentEpistaxis" = true
      then true
        else false

//ObstructiveSleepDisorder
define ObstructiveSleepDisorderResponse:
  ("QT".item I
		where I.linkId.value = 'ObstructiveSleepDisorder')QR
		return First(QR.answer).value

define ObstructiveSleepDisorderCondition:
  NasalSurgery."ObstructiveSleepDisorder"

define ObstructiveSleepDisorder:
  Coalesce(First("ObstructiveSleepDisorderResponse"), "ObstructiveSleepDisorderCondition")

define ContraindicationOfCPAPResponse:
  ("QT".item I
		where I.linkId.value = 'ContraindicationOfCPAP')QR
		return First(QR.answer).value

define ContraindicationOfCPAPCondition:
  NasalSurgery."ContraindicationOfCPAP"

define ContraindicationOfCPAP:
  Coalesce(First("ContraindicationOfCPAPResponse"), "ContraindicationOfCPAPCondition")

define CheckContraindicationOfCPAP:
  if "ContraindicationOfCPAP" = true
    then true
      else false

define SleepDisorderMedicalTherapyForSixWeeks:
  if ("ImmunosuppressantsTherapyForSixWeeks" = true
          or "DecongestantsTherapyForSixWeeks" = true
            or "AntiHistamineTherapyForSixWeeks" = true)
              then true
                else false

define SleepDisorderPostMedicalTherapy:
   if ("ImprovementPostAntiHistamineMedicalTherapy" = false
          or "PostImmunosuppressantsMedicalTherapy" = false
            or "PostDecongestantsMedicalTherapy" = false)
              then true
                else false

define SleepDisorderDecisionForRhinoplasty:
  if ("ObstructiveSleepDisorder" = true
        and (("CongenitalDefectDecisionForRhinoplasty" = true) or ("BenignDiseaseDecision" = true)
                or ("TraumaDecision" = true) or ("VestibularStenosisDecision" = true)))
          then true
            else false

define SleepDisorderDecisionForSeptoplasty:
    if ("ObstructiveSleepDisorder" = true
          and "ContraindicationOfCPAP" = true
            and "SleepDisorderMedicalTherapyForSixWeeks" = true
              and "SleepDisorderPostMedicalTherapy" = true)
                then true
                  else false

//Asymptomatic Septal Deviation
define IntranasalSurgeriesInterferenceResponse:
  ("QT".item I
		where I.linkId.value = 'IntranasalSurgeriesInterference')QR
		return First(QR.answer).value

define IntranasalSurgeriesInterferenceCondition:
  NasalSurgery."IntranasalSurgeriesInterference"

define IntranasalSurgeriesInterference:
  Coalesce(First("IntranasalSurgeriesInterferenceResponse"), "IntranasalSurgeriesInterferenceCondition")

//Previous Septoplasty/Turbinectomy
define PreviousSeptoplastyOrTurbinectomyResponse:
  ("QT".item I
		where I.linkId.value = 'PreviousSeptoplastyOrTurbinectomy')QR
		return First(QR.answer).value

define PreviousSeptoplastyOrTurbinectomyProcedure:
  NasalSurgery."PreviousSeptoplastyOrTurbinectomy"

define PreviousSeptoplastyOrTurbinectomy:
  Coalesce(First("PreviousSeptoplastyOrTurbinectomyResponse"), "PreviousSeptoplastyOrTurbinectomyProcedure")

define PrevSeptoOrTurbinectomyOutcomeResponse:
  ("QT".item I
		where I.linkId.value = 'SeptoplastyOrTurbinectomyOutcome')QR
		return First(QR.answer).value

define PrevSeptoplastyOrTurbinectomyOutcome:
  NasalSurgery."SeptoplastyOrTurbinectomyOutcome"

define SeptoplastyOrTurbinectomyOutcome:
  Coalesce(First("PrevSeptoOrTurbinectomyOutcomeResponse"), "PrevSeptoplastyOrTurbinectomyOutcome")

define PreviousSurgeryDecisionForRhinoplasty:
  if ("PreviousSeptoplastyOrTurbinectomy" = true
        and "SeptoplastyOrTurbinectomyOutcome" = false)
          then true
            else false

define PreviousSurgeryDecisionForSeptoplasty:
  if ("PreviousSeptoplastyOrTurbinectomy" = false)
    then true
      else if ("PreviousSeptoplastyOrTurbinectomy" = true
                and "SeptoplastyOrTurbinectomyOutcome" = false)
        then true
          else false

//Additional Surgeries
define AdditionalSurgeriesResponse:
  ("QT".item I
		where I.linkId.value = 'AdditionalSurgeries')QR
		return First(QR.answer).value

define AdditionalSurgeriesProcedure:
  NasalSurgery."AdditionalSurgeries"

define AdditionalSurgeries:
  Coalesce(First("AdditionalSurgeriesResponse"), "AdditionalSurgeriesProcedure")

define CheckAdditionalSurgeries:
  if ("AdditionalSurgeries" = true)
    then true
      else false

define PrimaryDecisionForRhinoplasty:
  if ((("CongenitalDefectDecisionForRhinoplasty" = true) or ("BenignDiseaseDecision" = true)
        or ("TraumaDecision" = true) or ("VestibularStenosisDecision" = true) or ("SleepDisorderDecisionForRhinoplasty" = true))
          and "CheckNasalObstruction" = true
            and "CheckNasalSeptumDeviation" = false
              and "SurgeryPurposeDecision" = true
                and "NasalReconstructiveSurgeryRequest" = true
                  and "PreviousSurgeryDecisionForRhinoplasty" = true
                    and "CheckAdditionalSurgeries" = false)
                      then true
                        else false

define PrimaryDecisionForSeptoplasty:
  if ((("CongenitalDefectDecisionForSeptoplasty" = true) or ("BenignDiseaseDecision" = true)
          or ("TraumaDecision" = true) or ("VestibularStenosisDecision" = true)
          or ("RecurrentSinusitisDecision" = true) or ("RecurrentEpistaxisDecision" = true)
          or ("SleepDisorderDecisionForSeptoplasty" = true) or ("IntranasalSurgeriesInterference" = true))
            and "CheckNasalSeptumDeviation" = true
              and "SurgeryPurposeDecision" = true
                and "NasalReconstructiveSurgeryWithSeptalRequest" = true
                  and "PreviousSurgeryDecisionForSeptoplasty" = true
                    and "CheckAdditionalSurgeries" = false)
                      then true
                        else false

define FinalDecision:
      if  (("PrimaryDecisionForRhinoplasty" = true)
            or ("PrimaryDecisionForSeptoplasty" = true))
              then 'YES'
                else 'HUMAN REVIEW NEEDED'

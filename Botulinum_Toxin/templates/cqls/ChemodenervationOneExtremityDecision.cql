library ChemodenervationOneExtremityDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include BotulinumToxin version '1.0.0' called Botox

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Chemodenervation Of One Extremity; 1-4 Muscle(S)": '2.16.840.1.113883.3.6037.1001.23.93.76'
valueset "Chemodenervation Of One Extremity; 5 Or More Muscles": '2.16.840.1.113883.3.6037.1001.23.93.77'

parameter "QuestionnaireResponse" QuestionnaireResponse
parameter "ServiceRequest" ServiceRequest

context Patient

define "prior-auth":
  true
  
define "prior-auth-description":
  'Chemodenervation Of One Extremity; 1-4 Muscle(S)'

define "documentation":
  true

define "dtr-clin":
  true

define "topic":
  'Complementary and Alternative Medicine'
  
  
define Request:
	"ServiceRequest"

define QuestionnaireResponseItems:
	   "QuestionnaireResponse".item

define BotulinumConditionsResponse:
  ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'BotulinumConditions')QR
		      return First(QR.answer).value

define BotulinumConditionsCond:
	Botox."BotoxDiagnosisConditions"

define BotoxDiagnosisConditions:
  Coalesce((First("BotulinumConditionsResponse")).code, "BotulinumConditionsCond")

define BotoxConditionsDecision:
  if ("BotoxDiagnosisConditions" = 'Spasticity')
    then true
      else false

define SpasticityMuscleGroupsResponse:
  ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Spasticity-MuscleGroups')QR
		      return First(QR.answer).value

define SpasticityMuscleGroupsServ:
	Botox."SpasticityMuscleGroups"

define SpasticityMuscleGroups:
  Coalesce(First("SpasticityMuscleGroupsResponse").code, "SpasticityMuscleGroupsServ")

define SpasticityFaceInjectionSideResponse:
  ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Spasticity-SideInjection')QR
		      return First(QR.answer).value

define SpasticityFaceInjectionSideServ:
	Botox."SpasticityFaceInjectionSide"

define SpasticityFaceInjectionSide:
  Coalesce(First("SpasticityFaceInjectionSideResponse").code, "SpasticityFaceInjectionSideServ")

define InjectionSideExtremityResponse:
  ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Spasticity-Extremity')QR
		      return First(QR.answer).value

define InjectionSideExtremityServ:
	Botox."InjectionSideExtremity"

define InjectionSideExtremity:
  Coalesce(First("InjectionSideExtremityResponse").code, "InjectionSideExtremityServ")

define InjectionSideTrunkResponse:
  ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Spasticity-TrunkInjectionSide')QR
		      return First(QR.answer).value

define InjectionSideTrunkServ:
	Botox."InjectionSideTrunk"

define InjectionSideTrunk:
  Coalesce(First("InjectionSideTrunkResponse").code, "InjectionSideTrunkServ")

define EtiologyResponse:
  ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Spasticity-Etiology')QR
		      return First(QR.answer).value

define EtiologyCondition:
	Botox."Etiology"

define Etiology:
  Coalesce(First("EtiologyResponse").code, "EtiologyCondition")

define AdjunctivePhysiotherapyResponse:
  ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Spasticity-AdjunctivePhysiotherapy')QR
		      return First(QR.answer).value

define AdjunctivePhysiotherapyCond:
	Botox."AdjunctivePhysiotherapy"

define AdjunctivePhysiotherapy:
  Coalesce(First("AdjunctivePhysiotherapyResponse"), "AdjunctivePhysiotherapyCond")

define BlepharospasmMuscleGroups:
  Botox."BlepharospasmMuscleGroups"

define BlepharospasmFaceInjectionSide:
  Botox."BlepharospasmFaceInjectionSide"

define CheckAbnormalInvoluntaryMovements:
  Botox."CheckAbnormalInvoluntaryMovements"

define CheckKeratopathy:
  Botox."CheckKeratopathy"

define CheckOcularIrritation:
  Botox."CheckOcularIrritation"

define NeuromuscularSensoryDysfunction:
  Botox."NeuromuscularSensoryDysfunction"

define LocalFactors:
  Botox."LocalFactors"

define AdverseEffect:
  Botox."AdverseEffect"

define HypertensiveLOS:
  Botox."HypertensiveLOS"

define RiskFactorsEsophagealPerforation:
  Botox."RiskFactorsEsophagealPerforation"

define CheckDurationOfAnalFissure:
  Botox."CheckDurationOfAnalFissure"

define CheckSevereSweating:
  Botox."CheckSevereSweating"

define CheckDurationOfSweating:
  Botox."CheckDurationOfSweating"

define MigraineMuscleGroups:
  Botox."MigraineMuscleGroups"

define MigraineFaceInjectionSide:
  Botox."MigraineFaceInjectionSide"

define HeadachesForFifteenDays:
  Botox."HeadachesForFifteenDays"

define HeadachesForLastThreeMonths:
  Botox."HeadachesForLastThreeMonths"

define BinocularVision:
  Botox."BinocularVision"

define BlepharospasmEarlierBotulinumAdministration:
  Botox."BlepharospasmEarlierBotulinumAdministration"

define BlepharospasmSpecifyBotoxAdministration:
  Botox."BlepharospasmSpecifyBotoxAdministration"

define BlepharospasmPostBotoxImprovement:
  Botox."BlepharospasmPostBotoxImprovement"

define BiofeedbackTherapy:
  Botox."BiofeedbackTherapy"

define PostBiofeedbackImprovement:
  Botox."PostBiofeedbackImprovement"

define GlycopyrrolateMedication:
  Botox."GlycopyrrolateMedication"

define SpecifyGlycopyrrolateMedication:
  Botox."SpecifyGlycopyrrolateMedication"

define PostGlycopyrrolateImprovement:
  Botox."PostGlycopyrrolateImprovement"

define ScopolamineMedication:
  Botox."ScopolamineMedication"

define SpecifyScopolamineMedication:
  Botox."SpecifyScopolamineMedication"

define PostScopolamineImprovement:
  Botox."PostScopolamineImprovement"

define SialorrheaEarlierBotulinumAdministration:
  Botox."SialorrheaEarlierBotulinumAdministration"

define SialorrheaSpecifyBotoxAdministration:
  Botox."SialorrheaSpecifyBotoxAdministration"

define SialorrheaPostBotoxImprovement:
  Botox."SialorrheaPostBotoxImprovement"

define AchalasiaProcedures:
  Botox."AchalasiaProcedures"

define AchalasiaPostProceduresImprovement:
  Botox."AchalasiaPostProceduresImprovement"

define AchalasiaEarlierBotulinumAdministration:
  Botox."AchalasiaEarlierBotulinumAdministration"

define AchalasiaSpecifyBotoxAdministration:
  Botox."AchalasiaSpecifyBotoxAdministration"

define AchalasiaPostBotoxImprovement:
  Botox."AchalasiaPostBotoxImprovement"

define ConservativeTreatmentOptions:
  Botox."ConservativeTreatmentOptions"

define PostConservativeTreatmentImprovement:
  Botox."PostConservativeTreatmentImprovement"

define AnalFissurePriorBotulinumToxin:
  Botox."AnalFissurePriorBotulinumToxin"

define AnalFissureSpecifyBotoxAdministration:
  Botox."AnalFissureSpecifyBotoxAdministration"

define AnalFissurePostBotoxImprovement:
  Botox."AnalFissurePostBotoxImprovement"

define AnticholinergicMedicationsHyperhydrosis:
  Botox."AnticholinergicMedicationsHyperhydrosis"

define PostAnticholinergicImprovement:
  Botox."PostAnticholinergicImprovement"

define HyperhydrosisPriorBotulinumToxin:
  Botox."HyperhydrosisPriorBotulinumToxin"

define HyperhydrosisSpecifyBotoxAdministration:
  Botox."HyperhydrosisSpecifyBotoxAdministration"

define HyperhydrosisPostBotoxImprovement:
  Botox."HyperhydrosisPostBotoxImprovement"

define CheckUrinaryIncontinenceAntiCholinergicTreatment:
  Botox."CheckUrinaryIncontinenceAntiCholinergicTreatment"

define PostUrinaryIncontinenceAnticholinergicImprovement:
  Botox."PostUrinaryIncontinenceAnticholinergicImprovement"

define UrinaryIncontinencePriorBotulinumToxin:
  Botox."UrinaryIncontinencePriorBotulinumToxin"

define UrinaryIncontinenceSpecifyBotoxAdministration:
  Botox."UrinaryIncontinenceSpecifyBotoxAdministration"

define UrinaryIncontinencePostBotoxImprovement:
  Botox."UrinaryIncontinencePostBotoxImprovement"

define ConventionalTreatment:
  Botox."ConventionalTreatment"

define ConventionalTreatmentImprovement:
  Botox."ConventionalTreatmentImprovement"

define MigraineCheckPriorBotoxTreatment:
  Botox."MigraineCheckPriorBotoxTreatment"

define MigrainePostBotoxImprovement:
  Botox."MigrainePostBotoxImprovement"

define MigraineTreatmentFailures:
  Botox."MigraineTreatmentFailures"

define StrabismusSurgery:
  Botox."StrabismusSurgery"

define PostStrabismusSurgeryImprovement:
  Botox."PostStrabismusSurgeryImprovement"

define StrabismusPriorBotulinumToxin:
  Botox."StrabismusPriorBotulinumToxin"

define StrabismusSpecifyBotoxAdministration:
  Botox."StrabismusSpecifyBotoxAdministration"

define StrabismusPostBotoxImprovement:
  Botox."StrabismusPostBotoxImprovement"

define SialorrheaAnticholinergicContraindications:
  Botox."SialorrheaAnticholinergicContraindications"

define UrinaryIncontinenceAnticholinergicContraindications:
  Botox."UrinaryIncontinenceAnticholinergicContraindications"

define BotoxAllergy:
  Botox."BotoxAllergy"

define SpasticityCondition:
	Botox."SpasticityCondition"

define ChemodenervationOneExtremityQualifiedConditions:
      if ("BotoxConditionsDecision" = true)
          then true
            else false

define SpasticityPrevBotoxResponse:
  ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Spasticity-PriorBotoxAdministration')QR
		      return First(QR.answer).value

define SpasticityBotulinumAdministration:
  Botox."SpasticityEarlierBotulinumAdministration"

define SpasticityEarlierBotulinumAdministration:
  Coalesce(First("SpasticityPrevBotoxResponse"), "SpasticityBotulinumAdministration")

define SpasticitySpecifyBotoxAdministrationRes:
  ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Spasticity-PriorBotoxStrain')QR
		      return First(QR.answer).value

define SpasticitySpecifyBotoxAdministrationProc:
	Botox."SpasticitySpecifyBotoxAdministration"

define SpasticitySpecifyBotoxAdministration:
  Coalesce("SpasticitySpecifyBotoxAdministrationRes", "SpasticitySpecifyBotoxAdministrationProc")

define SpasticityPostBotoxImprovementRes:
  ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Spasticity-PriorBotoxStrain')QR
		      return First(QR.answer).value

define SpasticityPostBotoxImprovementProc:
	Botox."SpasticityPostBotoxImprovement"

define SpasticityPostBotoxImprovement:
  Coalesce(First("SpasticityPostBotoxImprovementRes"), "SpasticityPostBotoxImprovementProc")

define ChemodenervationOneExtremityServiceRequest:
if (exists("Request".code.coding C where C in "Chemodenervation Of One Extremity; 1-4 Muscle(S)")
      or exists("Request".code.coding C where C in "Chemodenervation Of One Extremity; 5 Or More Muscles"))
  	    then true
	        else false

define PrimaryDecision:
      if (("ChemodenervationOneExtremityServiceRequest" = true)
            and ("ChemodenervationOneExtremityQualifiedConditions" = true))
        then true
          else false

define DecisionPending:
    if ("SpasticityEarlierBotulinumAdministration" = true
          and ("SpasticityPostBotoxImprovement" = false))
            then true
              else false

define FinalDecision:
      if  ("PrimaryDecision" = true
          and "DecisionPending" = false)
              then 'YES'
                else 'HUMAN REVIEW NEEDED'

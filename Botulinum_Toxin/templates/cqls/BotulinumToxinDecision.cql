library BotulinumToxinDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include BotulinumToxin version '1.0.0' called Botox

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Botulinum Toxin HCPCS Codes": '2.16.840.1.113883.3.6037.1001.23.99.78'

parameter "QuestionnaireResponse" QuestionnaireResponse
parameter "MedicationRequest" MedicationRequest

context Patient

define OnabotulinumtoxinaDrugReq:
	First(("MedicationRequest".medication as CodeableConcept).coding) in "Botulinum Toxin HCPCS Codes"

define SialorrheaCondition:
      Botox."SialorrheaCondition"

define SialorrheaConditionDecision:
      if exists("SialorrheaCondition")
        then true
          else false

define QuestionnaireResponseItems:
	   "QuestionnaireResponse".item

define BiofeedbackTherapy:
      Botox."BiofeedbackTherapy"

define ImprovementPostBiofeedbackTherapy:
      Botox."PostBiofeedbackImprovement"

define ImprovementAfterBiofeedbackTherapy:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Sialorrhea-ImprovementPostBiofeedback')QR
		      return First(QR.answer).value

define PreviousBiofeedbackTherapy:
  if "BiofeedbackTherapy" = false
        then false
          else true

define PostBiofeedbackTherapyImprovement:
    if ("PreviousBiofeedbackTherapy" = true
          and ("ImprovementPostBiofeedbackTherapy" = false or First("ImprovementAfterBiofeedbackTherapy") = false))
                  then false
                    else true

define BiofeedbackTherapyDecision:
  if ("PreviousBiofeedbackTherapy" = false
        or "PostBiofeedbackTherapyImprovement" = true)
          then false
            else true

define GlycopyrrolateMedicationAdministration:
    Botox."GlycopyrrolateMedication"

define GlycopyrrolateMedication:
  ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Sialorrhea-GlycopyrrolateMedication')QR
		      return First(QR.answer).value

define ImprovementAfterGlycopyrrolate:
    Botox."PostGlycopyrrolateImprovement"

define ImprovementPostGlycopyrrolate:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Sialorrhea-ImprovementPostGlycopyrrolate')QR
		      return First(QR.answer).value

define PreviousGlycopyrrolateMedicaition:
  if ("GlycopyrrolateMedicationAdministration" = true
        or First("GlycopyrrolateMedication") = true)
          then true
            else false

define PostGlycopyrrolateMedicaitionImprovement:
  if ("PreviousGlycopyrrolateMedicaition" = true
     and (("ImprovementAfterGlycopyrrolate" = false) or First("ImprovementPostGlycopyrrolate") = false))
       then false
          else true

define GlycopyrrolateMedicaitionDecision:
  if ("PreviousGlycopyrrolateMedicaition" = false
        or "PostGlycopyrrolateMedicaitionImprovement" = true)
          then false
            else true

define ScopolamineMedicationAdministration:
   Botox."ScopolamineMedication"

define ScopolamineMedication:
  ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Sialorrhea-ScopolamineMedication')QR
		      return First(QR.answer).value

define ImprovementAfterScopolamine:
  Botox."PostScopolamineImprovement"

define ImprovementPostScopolamine:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Sialorrhea-ImprovementPostScopolamine')QR
		      return First(QR.answer).value

define PreviousScopolamineMedicaition:
  if ("ScopolamineMedicationAdministration" = true
        or First("ScopolamineMedication") = true)
          then true
            else false

define PostScopolamineMedicaitionImprovement:
  if ("PreviousScopolamineMedicaition" = true
     and (("ImprovementAfterScopolamine" = false) or First("ImprovementPostScopolamine") = false))
       then false
          else true

define ScopolamineMedicaitionDecision:
  if ("PreviousScopolamineMedicaition" = false
        or "PostScopolamineMedicaitionImprovement" = true)
          then false
            else true

define BotulinumInjectionProcedure:
  Botox."SialorrheaEarlierBotulinumAdministration"

define BotoxInjectionProcedure:
  ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Sialorrhea-BotoxAdministration')QR
		      return First(QR.answer).value

define ImprovementAfterBotoxTreatment:
  Botox."SialorrheaPostBotoxImprovement"

define ImprovementPostBotoxTreatment:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Sialorrhea-ImprovementPostBotox')QR
		      return First(QR.answer).value

define PreviousBotoxProcedure:
  if ("BotulinumInjectionProcedure" = true
        or First("BotoxInjectionProcedure") = true)
          then true
            else false

define PostBotoxImprovement:
  if ("PreviousBotoxProcedure" = true
     and (("ImprovementAfterBotoxTreatment" = false) and First("ImprovementPostBotoxTreatment") = false))
       then false
          else true

define PreviousBotoxTreatmentDecision:
  if "PostBotoxImprovement" = false
    then false
      else true

define AnticholinergicContraindications:
      Botox."SialorrheaAnticholinergicContraindications"

define Contraindications:
  if ("AnticholinergicContraindications") is not null
    then true
      else false

define PrimaryDecision:
      if (("SialorrheaConditionDecision" = true)
            and ("OnabotulinumtoxinaDrugReq" = true))
        then true
          else false

define DecisionPending:
    if ("BiofeedbackTherapyDecision" = false
          or "GlycopyrrolateMedicaitionDecision"= false
            or "ScopolamineMedicaitionDecision" = false
              or "PreviousBotoxTreatmentDecision" = false
                or "Contraindications" = false)
                  then true
                    else false

define FinalDecision:
      if  (("PrimaryDecision" = true)
            and ("DecisionPending" = false))
              then 'YES'
                else 'HUMAN REVIEW NEEDED'
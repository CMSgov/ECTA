library BotulinumCystourethroscopyDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include BotulinumToxin version '1.0.0' called Botox

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Cystourethroscopy, with Injection(s) for Chemodenervation of the Bladder": '2.16.840.1.113883.3.6037.1001.23.99.40'

parameter "QuestionnaireResponse" QuestionnaireResponse
parameter "ServiceRequest" ServiceRequest

context Patient

define Request:
	"ServiceRequest"

define CystourethoscopyServiceRequest:
if (exists("Request".code.coding C where C in "Cystourethroscopy, with Injection(s) for Chemodenervation of the Bladder"))
	then true
	else false

define CystourethoscopyQualifiedConditions:
      Botox."UrinaryIncontinenceCondition"

define CystourethoscopyQualifiedConditionsDecision:
      if exists("CystourethoscopyQualifiedConditions")
        then true
          else false

define QuestionnaireResponseItems:
	   "QuestionnaireResponse".item

define ImprovementPostAnticholinergicMedications:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'UrinaryIncontinence-PostAntichloniergicTreatment')QR
		      return First(QR.answer).value

define ImprovementPostBotox:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'UrinaryIncontinence-PostBotoxImprovement')QR
		      return First(QR.answer).value

define AnticholinergicContraindications:
      Botox."UrinaryIncontinenceAnticholinergicContraindications"

define ContraindicationsToAnticholinergicTreatment:
  if ("AnticholinergicContraindications") is not null
    then true
      else false

define PrimaryDecision:
      if (("CystourethoscopyQualifiedConditionsDecision" = true)
            and ("CystourethoscopyServiceRequest" = true))
        then true
          else false

define DecisionPending:
    if (First("ImprovementPostAnticholinergicMedications") = true)
          or (First("ImprovementPostBotox") = false)
            or ("ContraindicationsToAnticholinergicTreatment" = false)
              then true
                else false

define FinalDecision:
      if  (("PrimaryDecision" = true)
            and ("DecisionPending" = false))
              then 'YES'
                else 'HUMAN REVIEW NEEDED'
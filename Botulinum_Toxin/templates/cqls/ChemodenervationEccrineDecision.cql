library ChemodenervationEccrineDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include BotulinumToxin version '1.0.0' called Botox

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Chemodenervation of Eccrine Glands": '2.16.840.1.113883.3.6037.1001.23.99.44'

parameter "QuestionnaireResponse" QuestionnaireResponse
parameter "ServiceRequest" ServiceRequest

context Patient

define Request:
	"ServiceRequest"

define ChemodenervationEccrineServiceRequest:
if exists("Request".code.coding C where C in "Chemodenervation of Eccrine Glands")
  	    then true
	        else false

define ChemodenervationEccrineQualifiedConditions:
      Botox."HyperhidrosisCondition"

define ChemodenervationEccrineQualifiedConditionsDecision:
      if exists("ChemodenervationEccrineQualifiedConditions")
        then true
          else false

define QuestionnaireResponseItems:
	   "QuestionnaireResponse".item

define SevereSweating:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Hyperhydrosis-SevereSweating')QR
		      return First(QR.answer).value

define SweatingLastedForSixMonths:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Hyperhydrosis-DurationSweating')QR
		      return First(QR.answer).value

define ImprovementPostAnticholinergicMedication:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Hyperhydrosis-PostAnticholinergicImprovement')QR
		      return First(QR.answer).value

define ImprovementPostBotox:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Hyperhydrosis-PostBotoxImprovement')QR
		      return First(QR.answer).value


define PrimaryDecision:
      if (("ChemodenervationEccrineQualifiedConditionsDecision" = true)
            and ("ChemodenervationEccrineServiceRequest" = true))
        then true
          else false

define DecisionPending:
    if (First("SevereSweating") = false)
        or (First("SweatingLastedForSixMonths") = false)
          or (First("ImprovementPostAnticholinergicMedication") = true)
            or ((First("ImprovementPostBotox") = false))
            then true
              else false

define FinalDecision:
      if  (("PrimaryDecision" = true)
            and ("DecisionPending" = false))
              then 'YES'
                else 'HUMAN REVIEW NEEDED'
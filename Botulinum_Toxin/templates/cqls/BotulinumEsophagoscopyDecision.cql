library BotulinumEsophagoscopyDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include BotulinumToxin version '1.0.0' called Botox

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Esophagogastroduodenoscopy": '2.16.840.1.113883.3.6037.1001.23.99.38'

parameter "QuestionnaireResponse" QuestionnaireResponse
parameter "ServiceRequest" ServiceRequest


context Patient

define Request:
	"ServiceRequest"

define EsophagoscopyServiceRequest:
if exists("Request".code.coding C where C in "Esophagogastroduodenoscopy")
  	    then true
	        else false

define EsophagoscopyQualifiedConditions:
      Botox."AchalasiaCondition"

define EsophagoscopyQualifiedConditionsDecision:
      if exists("EsophagoscopyQualifiedConditions")
        then true
          else false

define QuestionnaireResponseItems:
	   "QuestionnaireResponse".item

define RiskFactorsEsophagealPerforation:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Achalasia-RiskFactorsEsophagealPerforation')QR
		      return First(QR.answer).value

define AchalasiaProcedures:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Achalasia-PostProceduresImprovement')QR
		      return First(QR.answer).value

define ImprovementPostBotox:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Achalasia-ImprovementPostBotox')QR
		      return First(QR.answer).value


define PrimaryDecision:
      if (("EsophagoscopyQualifiedConditionsDecision" = true)
            and ("EsophagoscopyServiceRequest" = true))
        then true
          else false

define DecisionPending:
    if (First("RiskFactorsEsophagealPerforation") = false)
        or (First("AchalasiaProcedures") = true)
          or (First("ImprovementPostBotox") = false)
            then true
              else false

define FinalDecision:
      if  (("PrimaryDecision" = true)
            and ("DecisionPending" = false))
              then 'YES'
                else 'HUMAN REVIEW NEEDED'
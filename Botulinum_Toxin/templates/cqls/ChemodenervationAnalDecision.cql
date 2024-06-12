library ChemodenervationAnalDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include BotulinumToxin version '1.0.0' called Botox

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Chemodenervation of Internal Anal Sphincter": '2.16.840.1.113883.3.6037.1001.23.99.39'

parameter "QuestionnaireResponse" QuestionnaireResponse
parameter "ServiceRequest" ServiceRequest

context Patient

define Request:
	"ServiceRequest"

define ChemodenervationAnalServiceRequest:
if exists("Request".code.coding C where C in "Chemodenervation of Internal Anal Sphincter")
  	    then true
	        else false

define ChemodenervationAnalQualifiedConditions:
      Botox."AnalFissureCondition"

define ChemodenervationAnalQualifiedConditionsDecision:
      if exists("ChemodenervationAnalQualifiedConditions")
        then true
          else false

define QuestionnaireResponseItems:
	   "QuestionnaireResponse".item

define AnalFissureDuration:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'AnalFissure-Duration')QR
		      return First(QR.answer).value

define AnalFissureConservativeTreatment:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'AnalFissure-PostCoversativeTreatmentImprovement')QR
		      return First(QR.answer).value

define ImprovementPostBotox:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'AnalFissure-PostBotoxImprovement')QR
		      return First(QR.answer).value


define PrimaryDecision:
      if (("ChemodenervationAnalQualifiedConditionsDecision" = true)
            and ("ChemodenervationAnalServiceRequest" = true))
        then true
          else false

define DecisionPending:
    if (First("AnalFissureDuration") = false)
        or (First("AnalFissureConservativeTreatment") = true)
          or (First("ImprovementPostBotox") = false)
            then true
              else false

define FinalDecision:
      if  (("PrimaryDecision" = true)
            and ("DecisionPending" = false))
              then 'YES'
                else 'HUMAN REVIEW NEEDED'
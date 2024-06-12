library ChemodenervationExtraocularDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include BotulinumToxin version '1.0.0' called Botox

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Chemodenervation of Extraocular Muscle": '2.16.840.1.113883.3.6037.1001.23.99.45'
valueset "Spastic Eye Codes": '2.16.840.1.113883.3.6037.1001.23.93.90'

parameter "QuestionnaireResponse" QuestionnaireResponse
parameter "ServiceRequest" ServiceRequest

context Patient

define Request:
	"ServiceRequest"

define ChemodenervationExtraocularServiceRequest:
if exists("Request".code.coding C where C in "Chemodenervation of Extraocular Muscle")
  	    then true
	        else false

define StrabismusCondition:
      Botox."StrabismusCondition"

define SpasticEyeCondition:
	[Condition]S
		where exists(S.code.coding C where C in "Spastic Eye Codes")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define ChemodenervationExtraocularQualifiedConditionsDecision:
      if (exists("StrabismusCondition")
            or exists("SpasticEyeCondition"))
              then true
                else false

define QuestionnaireResponseItems:
	   "QuestionnaireResponse".item

define SpasticityImprovementPostBotox:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Spasticity-ImprovementPostBotox')QR
		      return First(QR.answer).value

define StrabismusImprovementPostCorrectionSurgery:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Strabisumus-ImprovementPostCorrectionSurgery')QR
		      return First(QR.answer).value

define StrabismusImprovementPostBotox:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Strabisumus-PostBotoxImprovement')QR
		      return First(QR.answer).value

define PrimaryDecision:
      if (("ChemodenervationExtraocularQualifiedConditionsDecision" = true)
            and ("ChemodenervationExtraocularServiceRequest" = true))
        then true
          else false

define DecisionPending:
    if (First("SpasticityImprovementPostBotox") = false)
        or (First("StrabismusImprovementPostCorrectionSurgery") = true)
          or (First("StrabismusImprovementPostBotox") = false)
            then true
              else false

define FinalDecision:
      if  (("PrimaryDecision" = true)
            and ("DecisionPending" = false))
              then 'YES'
                else 'HUMAN REVIEW NEEDED'
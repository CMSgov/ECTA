library ChemodenervationLarynxDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include BotulinumToxin version '1.0.0' called Botox

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Chemodenervation of Larynx Muscle(s)": '2.16.840.1.113883.3.6037.1001.23.93.74'
valueset "Larynx Condition Codes": '2.16.840.1.113883.3.6037.1001.23.93.81'

parameter "QuestionnaireResponse" QuestionnaireResponse
parameter "ServiceRequest" ServiceRequest

context Patient

define Request:
	"ServiceRequest"

define ChemodenervationLarynxServiceRequest:
if exists("Request".code.coding C where C in "Chemodenervation of Larynx Muscle(s)")
  	then true
	    else false

define LarynxCondition:
	[Condition]S
		where exists(S.code.coding C where C in "Larynx Condition Codes")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define ChemodenervationLarynxQualifiedConditions:
      if exists("LarynxCondition")
          then true
            else false

define QuestionnaireResponseItems:
	   "QuestionnaireResponse".item

define SpasticityBotoxTreatment:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Spasticity-ImprovementPostBotox')QR
		      return First(QR.answer).value

define PrimaryDecision:
      if (("ChemodenervationLarynxServiceRequest" = true)
            and ("ChemodenervationLarynxQualifiedConditions" = true))
        then true
          else false

define DecisionPending:
    if (First("SpasticityBotoxTreatment") = false)
          then true
            else false

define FinalDecision:
      if  (("PrimaryDecision" = true)
            and ("DecisionPending" = false))
              then 'YES'
                else 'HUMAN REVIEW NEEDED'
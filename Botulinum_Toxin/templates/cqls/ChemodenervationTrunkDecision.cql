library ChemodenervationTrunkDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include BotulinumToxin version '1.0.0' called Botox

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Chemodenervation Of Trunk Muscle(S); 1-5 Muscle(S)": '2.16.840.1.113883.3.6037.1001.23.93.75'
valueset "Chemodenervation Of Trunk Muscle(S); 6 Or More Muscles": '2.16.840.1.113883.3.6037.1001.23.93.78'

parameter "QuestionnaireResponse" QuestionnaireResponse
parameter "ServiceRequest" ServiceRequest

context Patient

define Request:
	"ServiceRequest"

define ChemodenervationTrunkServiceRequest:
if (exists("Request".code.coding C where C in "Chemodenervation Of Trunk Muscle(S); 1-5 Muscle(S)")
      or exists("Request".code.coding C where C in "Chemodenervation Of Trunk Muscle(S); 1-5 Muscle(S)"))
  	    then true
	        else false

define SpasticityCondition:
	Botox."SpasticityCondition"

define ChemodenervationTrunkQualifiedConditions:
      if exists("SpasticityCondition")
          then true
            else false

define QuestionnaireResponseItems:
	   "QuestionnaireResponse".item

define PreviousBotoxTreatment:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Spasticity-PriorBotoxAdministration')QR
		      return First(QR.answer).value

define ImprovementPostBotox:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Spasticity-ImprovementPostBotox')QR
		      return First(QR.answer).value

define PreviousBotoxTreatmentDone:
        if First("PreviousBotoxTreatment") = true
          then true
            else false

define SpasticityImprovementPostBotox:
  if First("ImprovementPostBotox") = true
          then true
            else false

define PrimaryDecision:
      if (("ChemodenervationTrunkServiceRequest" = true)
            and ("ChemodenervationTrunkQualifiedConditions" = true))
        then true
          else false

define DecisionPending:
 if ("PreviousBotoxTreatmentDone" = true
   and "SpasticityImprovementPostBotox" = false)
    then true
      else false

define FinalDecision:
      if  (("PrimaryDecision" = true)
            and ("DecisionPending" = false))
              then 'YES'
                else 'HUMAN REVIEW NEEDED'
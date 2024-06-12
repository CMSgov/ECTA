library ChemodenervationNeckDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include BotulinumToxin version '1.0.0' called Botox

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Chemodenervation of Neck Muscle(s)": '2.16.840.1.113883.3.6037.1001.23.93.73'
valueset "Torticollis Codes": '2.16.840.1.113883.3.6037.1001.23.93.88'

parameter "QuestionnaireResponse" QuestionnaireResponse
parameter "ServiceRequest" ServiceRequest

context Patient

define Request:
	"ServiceRequest"

define ChemodenervationNeckServiceRequest:
if exists("Request".code.coding C where C in "Chemodenervation of Neck Muscle(s)")
  	then true
	    else false

define BlepharospasmCondition:
      Botox."BlepharospasmCondition"

define MigraineCondition:
      Botox."MigraineCondition"

define TorticollisCondition:
  [Condition]S
		where exists(S.code.coding C where C in "Torticollis Codes")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed'

define ChemodenervationNeckQualifiedConditions:
      if (exists("BlepharospasmCondition")
        or exists("MigraineCondition")
        or exists("TorticollisCondition"))
          then true
            else false

define QuestionnaireResponseItems:
	   "QuestionnaireResponse".item

define BlehparospamPreviousBotoxTreatment:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Blepharospasm-PriorBotoxAdministration')QR
		      return First(QR.answer).value

define BlepharospasmImprovementPostBotox:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Blepharospasm-Improvement')QR
		      return First(QR.answer).value

define HeadachesLastForFifteenDays:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Migraine-DurationFor15Days')QR
		      return First(QR.answer).value

define HeadachesLastForThreeMonths:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Migraine-Duration')QR
		      return First(QR.answer).value

define MigraineConventionalTreatment:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Migraine-ConventionalTreatment')QR
		      return First(QR.answer).value

define MigrainePostConventionalTreatment:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Migraine-ConventionalTreatmentImprovement')QR
		      return First(QR.answer).value

define PriorBotoxForMigraine:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Migraine-PriorBotoxTreatment')QR
		      return First(QR.answer).value

define PostBotoxImprovementForMigraine:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Migraine-PostBotoxImprovement')QR
		      return First(QR.answer).value

define PostTwoBotoxTreatementsForMigraine:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Migraine-TreatmentFailures')QR
		      return First(QR.answer).value

define SpasticityPreviousBotoxTreatment:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Spasticity-PriorBotoxAdministration')QR
		      return First(QR.answer).value

define SpasticityImprovementPostBotox:
      ("QuestionnaireResponseItems".item I
		   where I.linkId.value = 'Spasticity-ImprovementPostBotox')QR
		      return First(QR.answer).value

define PreviousBotoxTreatment:
        if (First("BlehparospamPreviousBotoxTreatment") = true
              or First("PriorBotoxForMigraine") = true
                or First("SpasticityPreviousBotoxTreatment") = true)
          then true
            else false

define ImprovementPostBotox:
  if (First("BlepharospasmImprovementPostBotox") = false
        or First("PostBotoxImprovementForMigraine") = false
          or First("PostTwoBotoxTreatementsForMigraine") = true
            or First("SpasticityImprovementPostBotox") = false)
              then false
                else true

define MigraineDurationDecision:
        if ((First("HeadachesLastForFifteenDays") = true)
              and (First("HeadachesLastForThreeMonths") = true))
          then true
            else false

define MigraineConventionalTreatmentDecision:
        if ((First("MigraineConventionalTreatment") = true)
              and (First("MigrainePostConventionalTreatment") = false))
          then true
            else false

define MigraineDecision:
      if (("MigraineDurationDecision" = false
              or "MigraineConventionalTreatmentDecision" = false)
                  and exists("MigraineCondition"))
                      then false
                          else true

define DecisionPending:
        if (("PreviousBotoxTreatment" = true
              and "ImprovementPostBotox" = false)
              or "MigraineDecision" = false)
                then true
                  else false

define PrimaryDecision:
      if (("ChemodenervationNeckServiceRequest" = true)
            and ("ChemodenervationNeckQualifiedConditions" = true))
        then true
          else false

define FinalDecision:
      if  ("PrimaryDecision" = true
            and "DecisionPending" = false)
              then 'YES'
                else 'HUMAN REVIEW NEEDED'
library BlepharoplastyDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include Blepharoplasty version '1.0.0' called BLCommon

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Blepharoplasty of Upper Eyelid Diagnosis Codes": '2.16.840.1.113883.3.6037.1001.23.99.18'
valueset "Blepharoplasty of Lower Eyelid Diagnosis Codes": '2.16.840.1.113883.3.6037.1001.23.99.19'
valueset "Functional Deficits in EyeLid": '2.16.840.1.113883.3.6037.1001.23.99.20'
valueset "Botox Cosmetic Injectable Product": '2.16.840.1.113883.3.6037.1001.23.99.21'
valueset "Changes in skin texture": '2.16.840.1.113883.3.6037.1001.23.99.22'
valueset "Blepharospasm": '2.16.840.1.113883.3.6037.1001.23.99.23'
valueset "Margin reflex distance": '2.16.840.1.113883.3.6037.1001.23.99.24'
valueset "Sockets": '2.16.840.1.113883.3.6037.1001.23.99.25'
valueset "Unsuccessful": '2.16.840.1.113883.3.6037.1001.23.99.50'


parameter "ServiceRequest" ServiceRequest
parameter "QuestionnaireResponse" QuestionnaireResponse

context Patient

define "prior-auth":
  true
  
define "prior-auth-description":
  'CMS guidelines specify BLEPHAROPLASTY under list of hospital outpatient department services
requiring prior authorization beginning for service dates on or after July 1, 2020'

define "documentation":
  true

define "dtr-clin":
  true

define "topic":
  'Blepharoplasty'

define ServiceEncounter:
	BLCommon."ServiceEncounter"
	
define ServiceCondition:
	BLCommon."ServiceCondition"

define ServiceDiagnosis1:
	BLCommon."ServiceDiagnosis1"
	
define ServiceDiagnosis2:
	BLCommon."ServiceDiagnosis2"

define FunctionalDef:
	BLCommon."FunctionalDef"

define FunctionalDeficits:
	BLCommon."FunctionalDeficits"

define BlepharospasmCondition:
	BLCommon."BlepharospasmCondition"

define Blepharoptosis:
	BLCommon."Blepharoptosis"

define MRD:
	BLCommon."MRD"
	
define BrowRepair:
	BLCommon."BrowRepair"

define BlepharospasmDescription:
	if ("BlepharospasmCondition" is not null)
	then "BlepharospasmCondition".stage.summary.coding.display.value
	else null
	
define QT:
	"QuestionnaireResponse".item

// the more ptotic eye clearly meets the MRD criteria
define QA21:
	("QT".item I
		where I.linkId.value = '2.1')QR
		return First(QR.answer).value

//lifting the more ptotic lid with tape or by instillation of phenylephrine drops into the superior fornix causes the less ptotic lid to drop downward
define QA22:
	("QT".item I
		where I.linkId.value = '2.2')QR
		return First(QR.answer).value

//Redundant eyelid tissue touching the eyelashes or hanging over the eyelid margin resulting in pseudoptosis where the “pseudo” margin produces a central "pseudo-MRD" of 2.0 mm or less
define QA23:
	("QT".item I
		where I.linkId.value = '2.3')QR
		return First(QR.answer).value

//Redundant eyelid tissue predominantly medially or laterally clearly obscures the line of sight incorresponding gaze
define QA24:
	("QT".item I
		where I.linkId.value = '2.4')QR
		return First(QR.answer).value

define QA25:
	("QT".item I
		where I.linkId.value = '2.5')QR
		return First(QR.answer).value

define QA26:
	("QT".item I
		where I.linkId.value = '2.6')QR
		return First(QR.answer).value

define QA27:
	("QT".item I
		where I.linkId.value = '2.7')QR
		return First(QR.answer).value

define QA31:
	("QT".item I
		where I.linkId.value = '3.1')QR
		return First(QR.answer).value

define BothEyelidsBlepharoptosis:
 	if ((("Blepharoptosis" is not null) or (First("QA21".value) = true))
 		and ((First("QA22".value) = true) or (First("QA23".value) = true))
 		and (First("QA22".value) = true) or (First("QA24".value) = true))
 		then true
 		else false

define UpperEyelidBlepharoplasty:
	if ( ((First("QA25".value) = true)
		or (First("QA26".value) = true)
		or (First("QA27".value) = true))
		and ("BrowRepair" is not null))
		then true
		else false

define UpperEyelidPrimaryDecision:
	if((("FunctionalDeficits" is not null) and (First("QA31".value) = true))
		and ("UpperEyelidBlepharoplasty" = true))
		then true
		else false

define LowerEyelidPrimaryDecision:
	if( "ServiceDiagnosis2" is not null
		and (("FunctionalDeficits" is not null) and (First("QA31".value) = true)))
		then true
		else false

define BothEyelidPrimaryDecision:
	if((("FunctionalDeficits" is not null) and (First("QA31".value) = true))
		and ("BothEyelidsBlepharoptosis" = true))
		then true
		else false

define IntermediateDecision:
	if ("UpperEyelidPrimaryDecision" = true)
	then 'YES FOR UPPER EYELID.PHOTOGRAPHIC EVIDENCE TO BE REVIEWED'
	else
	if ("LowerEyelidPrimaryDecision" = true)
	then 'YES FOR LOWER EYELID.PHOTOGRAPHIC EVIDENCE TO BE REVIEWED'
	else
	if ("BothEyelidPrimaryDecision" = true)
	then 'YES FOR UPPER AND LOWER EYELIDS.PHOTOGRAPHIC EVIDENCE TO BE REVIEWED'
	else 'NO'

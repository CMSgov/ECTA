library VeinAblationDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include VeinAblation version '1.0.0' called VeinAblationCommon


//include otherLibrary version 'x.x' called otherLibrary
//codesystem codeSystemName : 'OID' version 'x.x'
//valueset valuesetName : 'OID' version 'x.x' codesystems{codeSystem1 , codeSystem2, etc}
//code codeName : 'OID' from codeSystemName display 'displayName'
//concept conceptName : {codeName1, codeName2, etc} display 'displayName'
//parameter parameterName (dataType or default value)

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'


valueset "Injection/Compression Sclerotherapy": '2.16.840.1.113883.3.6037.1001.23.95.9'
valueset "Stab Phlebectomy": '2.16.840.1.113883.3.6037.1001.23.95.10'
valueset "Subfascial Endoscopic Perforator Surgery (SEPS)": '2.16.840.1.113883.3.6037.1001.23.95.11'
valueset "Laser ablation of veins": '2.16.840.1.113883.3.6037.1001.23.95.12'
valueset "Treatment of spider veins": '2.16.840.1.113883.3.6037.1001.23.95.13'


parameter "ServiceRequest" ServiceRequest
parameter "QuestionnaireResponse" QuestionnaireResponse

context Patient

define ServiceEncounter:
	VeinAblationCommon."ServiceEncounter"

define CT:
	VeinAblationCommon."CT"

define MedicationUsed:
	VeinAblationCommon."MedicationUsed"
	
define ExercisePlan:
	VeinAblationCommon."ExercisePlan"	

define PeriodicLegElevation:
	VeinAblationCommon."PeriodicLegElevation"
				
define VenousStasis:
	VeinAblationCommon."VenousStasis"
			
define SaphenousReflux:
	VeinAblationCommon."SaphenousReflux"
	
define SuperficialVaricosity:
	VeinAblationCommon."SuperficialVaricosity"

define SuperficialPhlebitis:
	VeinAblationCommon."SuperficialPhlebitis"
			
define StasisDermatitis:
	VeinAblationCommon."StasisDermatitis"
	
define RefractoryEdema:
	VeinAblationCommon."RefractoryEdema"
			
define PerforatorReflux:
	VeinAblationCommon."PerforatorReflux"
		
define VeinStripping:
	VeinAblationCommon."VeinStripping"
		
define SuperficialVeinTreatment:
	VeinAblationCommon."SuperficialVeinTreatment"
		 
define DeepVenousThromboembolism:
	VeinAblationCommon."DeepVenousThromboembolism"
			
define DuplexStudy:
	VeinAblationCommon."DuplexStudy"
		
define KTSyndrome:
	VeinAblationCommon."KTSyndrome"

define Pregnancy:
	VeinAblationCommon."Pregnancy"

define Telangiectasis:
	VeinAblationCommon."Telangiectasis"

			
define ConservativeTherapy:
	if (("CT" is not null)
		or ("MedicationUsed" is not null)
		or ("ExercisePlan" is not null))
	then true
	else
	if("PeriodicLegElevation" is not null)
	then true
	else false


			
define SaphenousVeins:
	if ("VenousStasis" is not null)
	then true
	else if ("SaphenousReflux" is not null)
	then true
	else if ("SuperficialVaricosity" is not null)
	then true
	else if ("SuperficialPhlebitis" is not null)
	then true
	else if ("StasisDermatitis" is not null)
	then true
	else if ("RefractoryEdema" is not null)
	then true
	else false
	

define PerforatorA:
 	if (("PerforatorReflux" is not null)
 		and ("VeinStripping" is not null)
 		and ("SuperficialVeinTreatment" is not null)
 		and ("DeepVenousThromboembolism" is not null)
 		)
 		then true 
 		else false
 					
define ServiceCode1:
	if ((First("ServiceRequest".code.coding) in "Injection/Compression Sclerotherapy")
		and ( First("QA21") = true))
	then true
	else false
			
define ServiceCode2:
	if ((First("ServiceRequest".code.coding) in "Stab Phlebectomy")
		and ( First("QA22") = true))
	then true
	else false
	
define ServiceCode3:
	if ((First("ServiceRequest".code.coding) in "Subfascial Endoscopic Perforator Surgery (SEPS)")
		and ("PerforatorA" = true))
	then true
	else false
	
define ServiceCode4:
	if ((First("ServiceRequest".code.coding) in "Laser ablation of veins")
		and ("PerforatorA" = true)
		and ("DuplexStudy" is not null))
	then true
	else false
	
define ServiceCode5:
	if ((First("ServiceRequest".code.coding) in "Treatment of spider veins")
		and ("Telangiectasis" is not null))
	then true
	else false
	
define PerforatorVeins:
	if ("ServiceCode1" = true)
	then true
	else 
	if ("ServiceCode2" = true)
	then true
	else 
	if ("ServiceCode3" = true)
	then true
	else 
	if ("ServiceCode4" = true)
	then true
	else 
	if ("ServiceCode5" = true)
	then true
	else false
	
define Limitations:
	if (("KTSyndrome" is not null)
		or ("Pregnancy" is not null)
		or (First("QA23") = true)
		or (First("QA24") = true)
		or (First("QA25") = true)
		or (First("QA26") = true))
		then true 
		else false
		
		
define QT:
	"QuestionnaireResponse".item


define QA21:
	("QT".item I
		where I.linkId.value = '2.1')QR
		return First(QR.answer).value


define QA22:
	("QT".item I
		where I.linkId.value = '2.2')QR
		return First(QR.answer).value


define QA23:
    ("QT".item I
		where I.linkId.value = '2.3')QR
		return First(QR.answer).value

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
		
define PrimaryDecision:
	if (("ConservativeTherapy" = true) and ("Limitations" = false))
	then true
	else 
	if (("SaphenousVeins" = true) and ("Limitations" = false))
	then true
	else 
	if (("PerforatorVeins" = true) and ("Limitations" = false))
	then true
	else false
	
define FinalDecision:
	if ("PrimaryDecision" = true)
	then 'YES'
	else 'NO'
	

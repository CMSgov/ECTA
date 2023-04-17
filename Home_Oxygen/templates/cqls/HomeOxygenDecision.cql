library HomeOxygenDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

codesystem "ICD10CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "LOINC": 'http://loinc.org'
codesystem "NUCCPT" : '2.16.840.1.113883.6.101'
codesystem "ActRelationshipType" : '2.16.840.1.113883.5.1002'
codesystem "HCPCS": '2.16.840.1.113883.6.285'


valueset "Chronic Obstructive Lung Disease (COPD) ICD10CM": '2.16.840.1.113762.1.4.1219.4'
valueset "Cystic Fibrosis": '2.16.840.1.113883.3.464.1003.102.12.1002'
valueset "Interstitial lung disease": '2.16.840.1.113883.3.666.5.777'
valueset "Bronchiectasis": '2.16.840.1.113883.3.666.5.773'
valueset "Home Oxygen Therapy Qualifying Conditions": '2.16.840.1.113762.1.4.1219.25'
valueset "Malignant Neoplasm of Respiratory and Intrathoracic Organs": '2.16.840.1.113883.3.464.1003.108.11.1012'
valueset "Mild cognitive impairment": '2.16.840.1.113762.1.4.1108.9'
valueset "Hypoxemia": '2.16.840.1.113762.1.4.1111.55'
valueset "Hematocrit": '2.16.840.1.113762.1.4.1222.143'
valueset "Face to Face Encounter": '2.16.840.1.113762.1.4.1047.428'


code "Cystic fibrosis with pulmonary manifestations": 'J84' from "ICD10CM" display 'Cystic fibrosis with pulmonary manifestations'
code "Oxygen [Partial pressure] in Arterial blood": '2703-7' from "LOINC" display 'Oxygen [Partial pressure] in Arterial blood'
code "Oxygen saturation in Arterial blood by Pulse oximetry --W exercise": '89276-0' from "LOINC" display 'Oxygen saturation in Arterial blood by Pulse oximetry --W exercise'
code "Oxygen saturation in Arterial blood by Pulse oximetry --on room air": '59410-1' from "LOINC" display 'Oxygen saturation in Arterial blood by Pulse oximetry --on room air'
code "Oxygen saturation in Arterial blood by Pulse oximetry --resting": '59417-6' from "LOINC" display 'Oxygen saturation in Arterial blood by Pulse oximetry --resting'
code "Oxygen saturation in Arterial blood by Pulse oximetry": '59408-5' from"LOINC" display 'Oxygen saturation in Arterial blood by Pulse oximetry'
code "Angina pectoris, unspecified": 'I20.9' from "ICD10CM" display 'Angina pectoris, unspecified'
code "Pulmonary hypertension, unspecified" : 'I27.20' from "ICD10CM" display 'Pulmonary hypertension, unspecified'
code "Congestive heart failure (disorder)": '42343007' from "SNOMEDCT" display 'Congestive heart failure (disorder)'
code "Cor pulmonale (chronic)" : 'I27.81' from "ICD10CM" display 'Cor pulmonale (chronic)'
code "Familial erythrocytosis" : 'D75.0' from "ICD10CM" display 'Familial erythrocytosis'
code "Restlessness and agitation":'R45.1' from "ICD10CM" display 'Restlessness and agitation'
code "Morning headache (finding)" : '162310002' from  "SNOMEDCT" display 'Morning headache (finding)'
code "Dependent edema (finding)": '248499004' from "SNOMEDCT" display 'Dependent edema (finding)'
code "Pulmonary artery pressure monitoring (regime/therapy)": '24599003' from "SNOMEDCT" display 'Pulmonary artery pressure monitoring (regime/therapy)'
code "NM Heart Gated and Blood pool and Ejection fraction and Wall motion W single state of exercise": '81567-0' from "LOINC" display 'NM Heart Gated and Blood pool and Ejection fraction and Wall motion W single state of exercise'
code "Echocardiography (procedure)": '40701008' from "SNOMEDCT" display 'Echocardiography (procedure)'
code "P pulmonale (finding)": '164914003' from "SNOMEDCT" display 'P pulmonale (finding)'
code "Treatment stopped - alternative therapy undertaken (situation) code": '182868002' from "SNOMEDCT" display 'Treatment stopped - alternative therapy undertaken (situation)'
code "Polysomnography (procedure)": '60554003' from "SNOMEDCT" display 'Polysomnography (procedure)'
code "Cardiopulmonary exercise test (procedure)": '447346005' from "SNOMEDCT" display 'Cardiopulmonary exercise test (procedure)'
code "Secondary polycythemia": 'D75.1' from "ICD10CM" display 'Secondary polycythemia'
code "Age-related physical debility": 'R54' from "ICD10CM" display 'Age-related physical debility'
code "Breathless - mild exertion (finding)": '161940008' from "SNOMEDCT" display 'Breathless - mild exertion (finding)'
code "Peripheral vascular disease (disorder)": '400047006' from "SNOMEDCT" display 'Peripheral vascular disease (disorder)'
code "Desaturation of blood (disorder)": '238159008' from "SNOMEDCT" display 'Desaturation of blood (disorder)'

parameter "Claim" Claim
parameter "QuestionnaireResponse" QuestionnaireResponse
parameter "DeviceRequest" DeviceRequest

context Patient

define "DeviceRequestResource":
	"DeviceRequest"

define function "GetId"(uri String):
	Last(Split(uri, '/'))
	
define EncounterResource: 
	singleton from([Encounter]E where 'Encounter/' + E.id.value = "DeviceRequest".encounter.reference.value )

define function "EncounterDiagnosis"(Encounter Encounter):
  	Encounter.diagnosis D
  	return singleton from ([Condition]C where C.id.value = "GetId"(D.condition.reference.value))

define EncounterCondition:
    "EncounterDiagnosis"("EncounterResource")
						 			
define Covered:
	("EncounterCondition" C
		where First(C.code.coding) in "Interstitial lung disease"
			or First(C.code.coding) in "Chronic Obstructive Lung Disease (COPD) ICD10CM"
			or First(C.code.coding) in "Cystic Fibrosis"
			or First(C.code.coding) in "Bronchiectasis"
			or First(C.code.coding) in "Malignant Neoplasm of Respiratory and Intrathoracic Organs"
			or First(C.code.coding) =  "Pulmonary hypertension, unspecified"
			or First(C.code.coding) in "Home Oxygen Therapy Qualifying Conditions")Covered
			 where Covered.clinicalStatus.coding[0].code.value = 'active'
		
define "Group1 Conditiona":
	[Observation] Ox
	with [Observation] Pa
	such that  First(Ox.code.coding) = "Oxygen saturation in Arterial blood by Pulse oximetry"
	 	and Ox.value as Quantity <= 88 
		and Ox.status.value = 'final'
		and Ox.performer is not null 
		and First(Pa.code.coding) = "Oxygen [Partial pressure] in Arterial blood"
		and Pa.value as Quantity <= 55 
		and Pa.status.value = 'final'
		and Pa.performer is not null 
				
define "Group1Condition1Final":
	if (("Group1 Conditiona" is not null ) and ("Covered" is not null))
		then true 
		else false

define "Group1Condition2aSleepObservation":
	([Observation]Ox 
	with [Observation]Pa
	such that First(Ox.code.coding) = "Oxygen saturation in Arterial blood by Pulse oximetry"
		and Ox.value as Quantity <= 88 
		and Ox.status.value = 'final'
		and Ox.performer is not null
		and First(Pa.code.coding) = "Oxygen [Partial pressure] in Arterial blood"
		and Pa.value as Quantity <= 55 
		and Pa.status.value = 'final'
		and Pa.performer is not null)
		
define "Group1Condition2aSleep":
	"Group1Condition2aSleepObservation" GC
	 with [Observation] P
		such that First(P.code.coding) = "Polysomnography (procedure)"
			and P.performer is not null
			and P.status.value = 'final'
			
define "Group1Condition2bRoom":
	[Observation] Ox
		with[Observation]Pa
	 	such that First(Ox.code.coding) = "Oxygen saturation in Arterial blood by Pulse oximetry"
	 	and Ox.value as Quantity >= 88 '%'
		and Ox.status.value = 'final'
		and Ox.performer is not null
		and First(Pa.code.coding) = "Oxygen [Partial pressure] in Arterial blood"
		and Pa.value as Quantity >= 55 
		and Pa.status.value = 'final'
		and Pa.performer is not null
		
define "Group1Condition2Final":
	if (("Group1Condition2bRoom"is not null)  and ("Group1Condition2aSleep" is not null)and  ("Covered" is not null))
	then true 
	else false
	
define "Group1Condition3a":
	  [Observation] Pa
	 	with [Observation]P
	 	such that First(Pa.code.coding) ="Oxygen [Partial pressure] in Arterial blood"
		and Pa.value as Quantity >= 55 
		and Pa.status.value = 'final'
		and Pa.performer is not null
		and First(P.code.coding) = "Cardiopulmonary exercise test (procedure)"
		and P.performer is not null
		and P.status.value = 'completed'
		

define "Group1Condition3":
	"Group1Condition3a" GC
	with [Observation] Ox
	such that First(Ox.code.coding) ="Oxygen saturation in Arterial blood by Pulse oximetry --on room air"
		and Ox.value as Quantity >= 88 '%'
		and Ox.status.value = 'final'
		and Ox.performer is not null
		and First(Ox.performer).type ='http://hl7.org/fhir/StructureDefinition/Practitioner'
		
define "Group1Condition3Final":
	if (("Group1Condition3" is not null)and ("Covered" is not null))
	then true 
	else false
	
define "Group1":
	if (("Group1Condition1Final" = true) or ("Group1Condition2Final" = true) or ("Group1Condition3Final" = true))
	then true 
	else false
	
define "Group2Condition1":
	[Observation] Ox
	 	with [Observation]Pa
	 	such that First(Ox.code.coding) ="Oxygen saturation in Arterial blood by Pulse oximetry --on room air"
		and Ox.value as Quantity = 89 '%'
		and Ox.status.value = 'final'
		and Ox.performer is not null
		and First(Pa.code.coding) = "Oxygen [Partial pressure] in Arterial blood"
		and Pa.value as Quantity >= 56  and Pa.value as Quantity <= 59 
		and Pa.status.value = 'final'
		and Pa.performer is not null
		

define "Group2Condition2a":
	([Condition]Edema
	with [Condition]HeartFailure
	such that First(HeartFailure.code.coding) = "Congestive heart failure (disorder)"
		and First(Edema.code.coding) = "Dependent edema (finding)"
		and Edema.onset as Period overlaps HeartFailure.onset as Period)EdemaWithHeart
		where First(EdemaWithHeart.clinicalStatus.coding).code.value = 'active'


define "Group2Condition2":
	"Group2Condition2a"
	union ([Condition]PulmonaryHypertension where First(PulmonaryHypertension.code.coding) = "Pulmonary hypertension, unspecified")
	union ([Condition]Corpulmonale where First(Corpulmonale.code.coding) = "Cor pulmonale (chronic)")
	union ([Condition]SecondaryPolycythemia
		with [Observation: "Hematocrit"]Hematocrit
		such that Hematocrit.value as Quantity > 56 '%'
		and Hematocrit.status.value = 'final'
		and First(SecondaryPolycythemia.code.coding) = "Secondary polycythemia"
		and First(SecondaryPolycythemia.clinicalStatus.coding).code.value = 'active')

define "Group2":
	if ((("Group2Condition1" is not null)and ("Covered" is not null)) or (("Group2Condition2" is not null) and ("Covered" is not null)))
	then true 
	else false
	
define "Group3a":
	[Observation] Ox
	 	with [Observation] Pa
	 	such that Ox.code.coding[0] ="Oxygen saturation in Arterial blood by Pulse oximetry --on room air"
		and Ox.value as Quantity > 90 
		and Ox.status.value = 'final'
		and Ox.performer is not null
		and First(Pa.code.coding) = "Oxygen [Partial pressure] in Arterial blood"
		and Pa.value as Quantity > 60 
		and Pa.performer is not null
		
define "Group3b":
	[Observation]OB
	with [Condition]C
	 such that First(C.code.coding) = "Age-related physical debility"
		and OB.subject is not null
		and OB.status.value = 'final'
		 and OB.subject.type = 'http://hl7.org/fhir/StructureDefinition/Location'
		 //and defaultlib."GetLocation"(OB.subject).position.altitude > 500 'm'


define "Group3":
	if ((("Group3a" is not null)and ("Covered" is not null)) or (("Group3b" is not null) and ("Covered" is not null)))
	then true 
	else false



define function "EncounterPractitioner"(Encounter Encounter):
	Encounter.participant PR
	return singleton from ([Practitioner]P where 'Practitioner/' + P.id.value = PR.individual.reference.value)
		
define "FaceToFaceEncounter":
	"EncounterResource" F2FEncounter
	where First(F2FEncounter.type) in "Face to Face Encounter"
	and First(F2FEncounter.participant).individual.type = 'http://hl7.org/fhir/StructureDefinition/Practitioner'
	and (First("EncounterPractitioner"(F2FEncounter).qualification.code.coding).code = 'MD'
		or First("EncounterPractitioner"(F2FEncounter).qualification.code.coding).code = 'NP'
		or First("EncounterPractitioner"(F2FEncounter).qualification.code.coding).code = 'CNS'
		or First("EncounterPractitioner"(F2FEncounter).qualification.code.coding).code = 'PA')

define BeneficiaryNameObject:
	singleton from(Patient.name name where name.use.value='official')
	
define MiddleInitials:
  	Substring(Combine(("BeneficiaryNameObject".given given return Substring(given.value,0,1)),', '),3)

define PatientName:
	if (PatientFirstName is not null and PatientMiddleInitial is not null and PatientLastName is not null) then
		PatientFirstName +' '+PatientMiddleInitial + ' '+ PatientLastName
			else PatientFirstName + ' '+ PatientLastName

define PatientLastName: 
	"BeneficiaryNameObject".family.value

define PatientMiddleInitial:
	if (Length("BeneficiaryNameObject".given)>1) then "MiddleInitials"
	else ''

define PatientFirstName: 
	First("BeneficiaryNameObject".given).value
	
define BeneficiaryDateOfBirth:
	Patient.birthDate.value

define Practitioner: 
	singleton from ([Practitioner] practitioner
    		where ('Practitioner/' + practitioner.id) = "Claim".careTeam[0].provider.reference.value)


define PractitionerName: 
singleton from (
  	"Practitioner".name name where name.use.value = 'official') 

define PractitionerLastName: 
	"PractitionerName".family.value
	
define PractitionerMiddleInitial: 
  	Substring(Combine(("PractitionerName".given given return Substring(given.value,0,1)),', '),3)
	
define "PractitionerFirstName": 
	"PractitionerName".given[0].value
	
define "PractitionerFullName":
  	Coalesce("PractitionerFirstName" + ' ' + "PractitionerMiddleInitial" + ' ' + "PractitionerLastName", "PractitionerFirstName" + ' ' + "PractitionerLastName")
  
define "PractitionerNPI": (singleton from (
  	"Practitioner".identifier identifier
    		where identifier.system.value = 'http://hl7.org/fhir/sid/us-npi')).value.value

define "DeviceRequestDescription": 
	'HCPCS ' + First("DeviceRequest".code.coding).code.value + ' - ' + First("DeviceRequest".code.coding).display.value

define "DeviceRequestedIsPortable": 
	First("DeviceRequest".code.coding).code.value in { 'E0433', 'E0434', 'E0444', 'EO431', 'K0738', 'E0443', 'E1392' }

define "DeviceRequestedIsStationary": 
	First("DeviceRequest".code.coding).code.value in { 'E0439', 'E0442', 'E0424', 'E0441', 'E1390', 'E1391' }

define "WOPD":
	if(("PatientName" is not null)
		and ("PractitionerFullName" is not null)
		and ("PractitionerNPI" is not null)
		and ("DeviceRequestDescription" is not null)
		//and ("DeviceOrderDate")
		)
		then true else false

define QT:
	"QuestionnaireResponse".item
				
define "PrimaryDecision":
	if (("Group1" = true) or ("Group2" = true) or ("Group3" = true))
	then true 
	else false

define "FinalDecision":
	if(("PrimaryDecision" = true) and ("FaceToFaceEncounter" is not null) and("WOPD"= true))
	then 'YES'
	else 'NO'
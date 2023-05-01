library HomeOxygenDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

codesystem "ICD10CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "LOINC": 'http://loinc.org'
codesystem "NUCCPT" : 'https://www.nlm.nih.gov/research/umls/sourcereleasedocs/current/NUCCPT/sourcerepresentation.html'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "CPT": 'http://www.ama-assn.org/go/cpt'
codesystem "ActEncounterCodev2": 'http://terminology.hl7.org/CodeSystem/v2-0004'
codesystem "ActEncounterCode": 'http://terminology.hl7.org/ValueSet/v3-ActEncounterCode'


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
valueset "Inpatient Stay": '2.16.840.1.113762.1.4.1182.285'

valueset "Acute or Chronic Heart Failure Disorder ICD10CM": '2.16.840.1.113762.1.4.1219.22'
valueset "Acute Pulmonary Edema": '2.16.840.1.113883.17.4077.2.2018'
valueset "Breath Sounds": '2.16.840.1.113883.3.7643.3.1023'
valueset "Pleuritis (SNOMED)": '2.16.840.1.113762.1.4.1146.2101'


valueset "Secondary Erythrocytosis Disorder": '2.16.840.1.113762.1.4.1219.21'
valueset "Cluster Headache" : '2.16.840.1.113762.1.4.1034.464'

valueset "Poor Sleep Hygeine or Sleep Challenges": '2.16.840.1.113762.1.4.1222.1072'
valueset "Fatigue": '2.16.840.1.113762.1.4.1222.1398'
valueset "Fever (ICD10CM)": '2.16.840.1.113762.1.4.1146.671'
valueset "Chills (ICD10CM)": '2.16.840.1.113762.1.4.1146.812'
valueset "Night Sweats (SNOMED)": '2.16.840.1.113762.1.4.1146.906'

valueset "Spine or Neck Disorder": '2.16.840.1.113762.1.4.1219.117'

valueset "Cough (ICD10CM)": '2.16.840.1.113762.1.4.1146.90'
valueset "Difficulty Breathing (ICD10CM)": '2.16.840.1.113762.1.4.1146.890'
valueset "Chest Pain (ICD10CM)" : '2.16.840.1.113762.1.4.1146.662'
valueset "Wheezing": '2.16.840.1.113762.1.4.1182.55'
valueset "Hemoptysis (ICD10CM)": '2.16.840.1.113762.1.4.1146.936'
valueset "Sputum (Specimen Type) (SNOMED)": '2.16.840.1.113762.1.4.1146.1796'

valueset "Chest Pain": '2.16.840.1.113762.1.4.1222.1426'
valueset "Heart Palpitations": '2.16.840.1.113883.3.7643.3.1088'
valueset "Syncope": '2.16.840.1.113762.1.4.1106.101'

valueset "Edema": '2.16.840.1.113762.1.4.1222.1415'
valueset "Claudication": '2.16.840.1.113762.1.4.1222.759'
valueset "Phlebitis and Thrombophlebitis of the Veins of lower extremity": '2.16.840.1.113762.1.4.1200.195'
valueset "Acute Peptic Ulcer": '2.16.840.1.113883.3.3157.4031'

valueset "Dysphagia (SNOMED)": '2.16.840.1.113762.1.4.1146.976'
valueset "Abdominal Pain (ICD10CM)": '2.16.840.1.113762.1.4.1146.680'
valueset "Constipation": '2.16.840.1.113762.1.4.1222.1440'
valueset "Diarrhea": '2.16.840.1.113883.3.7643.3.1083'
valueset "Urinary Incontinence": '2.16.840.1.113762.1.4.1222.718'
valueset "Nausea (ICD10CM)": '2.16.840.1.113762.1.4.1146.863'
valueset "Vomiting": '2.16.840.1.113883.17.4077.3.1015'
valueset "Jaundice": '2.16.840.1.113883.3.3157.1022'
valueset "Hematemesis [Unspecified Cause] (ICD10CM)": '2.16.840.1.113762.1.4.1146.932'

valueset "Pain": '2.16.840.1.113762.1.4.1222.1424'

valueset "Stiff neck (SNOMED)": '2.16.840.1.113762.1.4.1146.1561'
valueset "Arthritis Disorders": '2.16.840.1.113762.1.4.1222.81'
valueset "Gout": '2.16.840.1.113762.1.4.1222.586'
valueset "Abdominal Cramps (SNOMED)": '2.16.840.1.113762.1.4.1146.649'
valueset "Myalgia (ICD10CM)": '2.16.840.1.113762.1.4.1146.687'
valueset "Multiple System Atrophy (SNOMED)": '2.16.840.1.113762.1.4.1146.1054'
valueset "HEDIS Fractures Value Set ICD10CM": '2.16.840.1.113762.1.4.1195.285'
valueset "Osteopathies chondropathies and acquired musculoskeletal deformities": '2.16.840.1.113883.3.3157.1807'
valueset "Muscle weakness (ICD10CM)": '2.16.840.1.113762.1.4.1146.1690'

valueset "Seizure": '2.16.840.1.113883.17.4077.3.2015'
valueset "Short Term Memory Deficits": '2.16.840.1.113883.17.4077.3.1031'
valueset "Difficulty Concentrating" : '2.16.840.1.113883.3.3616.200.110.102.6312'
valueset "NU_Weakness (ICD10CM)": '2.16.840.1.113762.1.4.1146.837'
valueset "Spinal Cord Injury or Paralysis Disorder": '2.16.840.1.113762.1.4.1219.169'
valueset "Essential tremor": '2.16.840.1.113762.1.4.1078.335'
valueset "Abnormality of Gait and Mobility": '2.16.840.1.113762.1.4.1206.34'
valueset "Fall Risk": '2.16.840.1.113762.1.4.1222.712'
valueset "Vertigo": '2.16.840.1.113883.3.3616.200.110.102.6314'
valueset "Headache": '2.16.840.1.113883.17.4077.3.1027'
valueset "Stroke": '2.16.840.1.113762.1.4.1222.618'

valueset "Anxiety": '2.16.840.1.113762.1.4.1021.94'

valueset "Anemia Conditions": '2.16.840.1.113762.1.4.1222.53'
valueset "Bleeding Disorder": '2.16.840.1.113762.1.4.1029.286'

valueset "Diabetes": '2.16.840.1.113762.1.4.1078.88'

valueset "Long Acting Inhaled Bronchodilators": '2.16.840.1.113762.1.4.1182.60'
valueset "Inhaled Steroid Combinations": '2.16.840.1.113883.3.464.1003.196.11.1086'
valueset "COVID19 SNOMED Value Set for Non Invasive Respiratory Support": '2.16.840.1.113883.3.3616.200.110.102.6198'
valueset "COVID19 SNOMED Value Set for Invasive Mechanical Ventilation": '2.16.840.1.113883.3.3616.200.110.102.6158'
valueset "Cromolyn Inhalant Preparations": '2.16.840.1.113762.1.4.1196.465'

code "inpatient encounter": 'IMP' from "ActEncounterCode" display 'inpatient encounter'
code "Outpatient": 'O' from "ActEncounterCodev2" display 'Outpatient'
code "Unintentional weight gain (finding)": '441361000124104' from "SNOMEDCT" display 'Unintentional weight gain (finding)'
code "Unintentional weight loss (finding)": '448765001' from "SNOMEDCT" display 'Unintentional weight loss (finding)'

code "Acute lymphadenitis of neck (disorder)": '10629031000119100' from "SNOMEDCT" display 'Acute lymphadenitis of neck (disorder)'

code "Orthopnea": 'R06.01' from "ICD10CM" display 'Orthopnea'
code "Cardiac murmur, unspecified": 'R01.1' from "ICD10CM" display 'Cardiac murmur, unspecified'

code "Varicose vein finding (finding)": '271652003' from "SNOMEDCT" display 'Varicose vein finding (finding)'

code "Cardiac blood pool imaging, gated equilibrium": '78472' from "CPT" display 'Cardiac blood pool imaging, gated equilibrium'
code "P pulmonale by electrocardiogram" : '164914003' from "SNOMEDCT" display 'P pulmonale by electrocardiogram'

code "Hematocrit/Hemoglobin [Ratio] of Blood by Automated count": '16931-8' from "LOINC" display 'Hematocrit/Hemoglobin [Ratio] of Blood by Automated count'

code "I tossed and turned at night in past 7 days [PROMIS]": '62008-8' from "LOINC" display 'I tossed and turned at night in past 7 days [PROMIS]'

code "Restlessness and agitation":'R45.1' from "ICD10CM" display 'Restlessness and agitation'
code "Morning headache (finding)" : '162310002' from  "SNOMEDCT" display 'Morning headache (finding)'
code "Breathless - mild exertion (finding)": '161940008' from "SNOMEDCT" display 'Breathless - mild exertion (finding)'

code "Overnight pulse oximetry (procedure)": '252568001' from "SNOMEDCT" display 'Overnight pulse oximetry (procedure)'
code "Polysomnography (procedure)": '60554003' from "SNOMEDCT" display 'Polysomnography (procedure)'

code "Chronic respiratory failure with hypoxia": 'J96. 11' from "ICD10CM" display 'Chronic respiratory failure with hypoxia'
code "Desaturation of blood (disorder)": '238159008' from "SNOMEDCT" display 'Desaturation of blood (disorder)'
 
code "Long-term oxygen therapy (procedure)": '243137006' from "SNOMEDCT" display 'Long-term oxygen therapy (procedure)'
code "6-minute walk test (procedure)": '252478000' from "SNOMEDCT" display '6-minute walk test (procedure)' 

code "Melena": 'K92.1' from "ICD10CM" display 'Melena'
code "Hemorrhage of anus and rectum": 'K62.5' from "ICD10CM" display 'Hemorrhage of anus and rectum'

code "Heartburn": 'R12' from "ICD10CM" display 'Heartburn'

code "Inhaled oxygen flow rate": '3151-8' from "LOINC" display 'Inhaled oxygen flow rate'
code "Oxygen [Partial pressure] adjusted to patients actual temperature in Arterial blood": '19255-9' from "LOINC" display 'Oxygen [Partial pressure] adjusted to patients actual temperature in Arterial blood'

code "Oxygen saturation in Arterial blood by Pulse oximetry --W exercise": '89276-0' from "LOINC" display 'Oxygen saturation in Arterial blood by Pulse oximetry --W exercise'
code "Oxygen saturation in Arterial blood by Pulse oximetry --on room air": '59410-1' from "LOINC" display 'Oxygen saturation in Arterial blood by Pulse oximetry --on room air'
code "Oxygen saturation in Arterial blood by Pulse oximetry --resting": '59417-6' from "LOINC" display 'Oxygen saturation in Arterial blood by Pulse oximetry --resting'
code "Oxygen saturation in Arterial blood by Pulse oximetry": '59408-5' from"LOINC" display 'Oxygen saturation in Arterial blood by Pulse oximetry'

code "Oxygen saturation in Arterial blood": '2708-6' from "LOINC" display 'Oxygen saturation in Arterial blood'
code "Oxygen [Partial pressure] in Arterial blood": '2703-7' from "LOINC" display 'Oxygen [Partial pressure] in Arterial blood'
code "Bicarbonate [Moles/volume] in Arterial blood": '1960-4' from "LOINC" display 'Bicarbonate [Moles/volume] in Arterial blood'
code "Carbon dioxide [Partial pressure] in Arterial blood": '2019-8' from "LOINC" display 'Carbon dioxide [Partial pressure] in Arterial blood'
code "pH of Arterial blood": '2744-1' from "LOINC" display 'pH of Arterial blood'
code "Hematocrit [Volume Fraction] of Arterial blood": '32354-3' from "LOINC" display 'Hematocrit [Volume Fraction] of Arterial blood'
	
code "Swelling (finding)": '65124004' from "SNOMEDCT" display 'Swelling (finding)'
code "Functional limitation in range of motion [CMS Assessment]": '54525-1' from "LOINC" display 'Functional limitation in range of motion [CMS Assessment]'
code "Fasciculation": 'R25.3' from "ICD10CM" display 'Fasciculation'
code "Muscle wasting and atrophy, not elsewhere classified, unspecified site": 'M62.50' from "ICD10CM" display 'Muscle wasting and atrophy, not elsewhere classified, unspecified site'

code "Numbness (finding)": '44077006' from "SNOMEDCT" display 'Numbness (finding)'
code "Numbness and tingling sensation of skin (finding)": '101000119102' from "SNOMEDCT" display 'Numbness and tingling sensation of skin (finding)'
code "Pins and needles (finding)": '62507009' from "SNOMEDCT" display 'Pins and needles (finding)'
code "Other disturbances of skin sensation": 'R20.8' from "ICD10CM" display 'Other disturbances of skin sensation'
code "Dysesthesia (finding)" : '279079003' from "SNOMEDCT" display 'Dysesthesia (finding)'
code "Weakness": 'R53.1' from "ICD10CM" display 'Weakness'
code "Involuntary movement symptom (finding)": '162227008' from "SNOMEDCT" display 'Involuntary movement symptom (finding)'
code "Speech disturbances, not elsewhere classified": 'R47' from "ICD10CM" display 'Speech disturbances, not elsewhere classified'

code "Hallucinations, unspecified": 'R44.3' from "ICD10CM" display 'Hallucinations, unspecified'
code "Delusional disorders": 'F22' from "ICD10CM" display 'Delusional disorders'
code "Other specified nonpsychotic mental disorders": 'F48.8' from "ICD10CM" display 'Other specified nonpsychotic mental disorders'
code "Mood disorder (disorder)": '46206005' from "SNOMEDCT" display 'Mood disorder (disorder)'

code "Bruising symptom (finding)": '161885008' from "SNOMEDCT" display 'Bruising symptom (finding)'
code "Bleeding (finding)": '131148009' from "SNOMEDCT" display 'Bleeding (finding)'

code "Goiter (disorder)":'3716002' from "SNOMEDCT" display 'Goiter (disorder)'
code "Lipids abnormal (finding)": '166818002' from "SNOMEDCT" display 'Lipids abnormal (finding)'

code "Oral steroid therapy (procedure)": '297280007' from "SNOMEDCT" display 'Oral steroid therapy (procedure)'
code "Intravenous hydrocortisone therapy (procedure)": '297283009' from "SNOMEDCT" display 'Intravenous hydrocortisone therapy (procedure)'
code "Steroid therapy (procedure)": '297279009' from "SNOMEDCT" display 'Steroid therapy (procedure)'
code "Inhaled steroid therapy (procedure)": '710818004' from "SNOMEDCT" display 'Inhaled steroid therapy (procedure)'
code "Interferon-gamma [Chemical/Ingredient]": 'N0000011343' from "SNOMEDCT" display 'Interferon-gamma [Chemical/Ingredient]'



code "Blood gas analysis (procedure)": '278297009' from "SNOMEDCT" display 'Blood gas analysis (procedure)'
code "Blood gas measurement (procedure)": '167018008' from "SNOMEDCT" display 'Blood gas measurement (procedure)'


code "Walks indoors - usual functional ability during assessment period [CMS Assessment]": '94996-6' from "LOINC" display 'Walks indoors - usual functional ability during assessment period [CMS Assessment]'
code "Angina pectoris, unspecified": 'I20.9' from "ICD10CM" display 'Angina pectoris, unspecified'
code "Cystic fibrosis with pulmonary manifestations": 'J84' from "ICD10CM" display 'Cystic fibrosis with pulmonary manifestations'
code "Pulmonary hypertension, unspecified" : 'I27.20' from "ICD10CM" display 'Pulmonary hypertension, unspecified'
code "Congestive heart failure (disorder)": '42343007' from "SNOMEDCT" display 'Congestive heart failure (disorder)'
code "Cor pulmonale (chronic)" : 'I27.81' from "ICD10CM" display 'Cor pulmonale (chronic)'
code "Familial erythrocytosis" : 'D75.0' from "ICD10CM" display 'Familial erythrocytosis'

code "Dependent edema (finding)": '248499004' from "SNOMEDCT" display 'Dependent edema (finding)'
code "Pulmonary artery pressure monitoring (regime/therapy)": '24599003' from "SNOMEDCT" display 'Pulmonary artery pressure monitoring (regime/therapy)'
code "NM Heart Gated and Blood pool and Ejection fraction and Wall motion W single state of exercise": '81567-0' from "LOINC" display 'NM Heart Gated and Blood pool and Ejection fraction and Wall motion W single state of exercise'
code "Echocardiography (procedure)": '40701008' from "SNOMEDCT" display 'Echocardiography (procedure)'
code "P pulmonale (finding)": '164914003' from "SNOMEDCT" display 'P pulmonale (finding)'
code "Treatment stopped - alternative therapy undertaken (situation) code": '182868002' from "SNOMEDCT" display 'Treatment stopped - alternative therapy undertaken (situation)'

code "Cardiopulmonary exercise test (procedure)": '447346005' from "SNOMEDCT" display 'Cardiopulmonary exercise test (procedure)'
code "Secondary polycythemia": 'D75.1' from "ICD10CM" display 'Secondary polycythemia'
code "Age-related physical debility": 'R54' from "ICD10CM" display 'Age-related physical debility'

code "Peripheral vascular disease (disorder)": '400047006' from "SNOMEDCT" display 'Peripheral vascular disease (disorder)'

parameter "Claim" Claim
parameter "QuestionnaireResponse" QuestionnaireResponse
parameter "DeviceRequest" DeviceRequest
parameter "Encounter" Encounter

context Patient

define "prior-auth":
  true

define "documentation":
  false

define "dtr-clin":
  true

define function ToCode(coding FHIR.Coding):
    if coding is null then
        null
    else
        System.Code {
          code: coding.code.value,
          system: coding.system.value,
          version: coding.version.value,
          display: coding.display.value
        }

define "DeviceRequestResource":
	"DeviceRequest"

define function "GetId"(uri String):
	Last(Split(uri, '/'))
	
define EncounterResource: 
	Coalesce(singleton from([Encounter]E where 'Encounter/' + E.id.value = "DeviceRequest".encounter.reference.value ), "Encounter")

define function "EncounterDiagnosis"(Encounter Encounter):
  	Encounter.diagnosis D
  	return singleton from ([Condition]C where C.id.value = "GetId"(D.condition.reference.value))

define EncounterCondition:
    "EncounterDiagnosis"("EncounterResource")
						 			
define Covered:
	("EncounterCondition" C
		where First(C.code.coding) in "Interstitial lung disease"
			or First(C.code.coding) in "Chronic Obstructive Lung Disease (COPD) ICD10CM"
			or First(C.code.coding) in "Hypoxemia"
			or First(C.code.coding) in "Cystic Fibrosis"
			or First(C.code.coding) in "Bronchiectasis"
			or First(C.code.coding) in "Malignant Neoplasm of Respiratory and Intrathoracic Organs"
			or "ToCode"(First(C.code.coding)) = "Familial erythrocytosis"
			or "ToCode"(First(C.code.coding)) = "Cor pulmonale (chronic)"
			or "ToCode"(First(C.code.coding)) = "Congestive heart failure (disorder)"
			or "ToCode"(First(C.code.coding)) = "Pulmonary hypertension, unspecified"
			or First(C.code.coding) in "Home Oxygen Therapy Qualifying Conditions")Covered
			 where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed'
		
define "Group1 Conditiona":
	if exists(
		[Observation] Ox
			where "ToCode"(First(Ox.code.coding)) = "Oxygen saturation in Arterial blood by Pulse oximetry"
				and Ox.value <= 88 
				and Ox.performer is not null 
				and Ox.status.value = 'final')
	then true
	else if exists([Observation] Pa
		where "ToCode"(First(Pa.code.coding)) = "Oxygen [Partial pressure] in Arterial blood"
				and Pa.value <= 55 
				and Pa.status.value = 'final'
				and Pa.performer is not null)
	then true
	else false
			
define "Group1Condition1Final":
	if (("Group1 Conditiona" = true) and ("Covered" is not null))
		then true 
		else false

define "Group1Condition2aSleepObservation":
	if exists(
		[Observation] Ox
			where "ToCode"(First(Ox.code.coding)) = "Oxygen saturation in Arterial blood by Pulse oximetry"
				and Ox.value <= 88 
				and First(Ox.method.coding) = "Polysomnography (procedure)"
				and Ox.performer is not null 
				and Ox.status.value = 'final')
	then true
	else if exists([Observation] Pa
		where "ToCode"(First(Pa.code.coding)) = "Oxygen [Partial pressure] in Arterial blood"
				and Pa.value <= 55 
				and First(Pa.method.coding) = "Polysomnography (procedure)"
				and Pa.status.value = 'final'
				and Pa.performer is not null)
	then true
	else false
		
define "Group1Condition2aSleep":
	"Group1Condition2aSleepObservation" 
			
define "Group1Condition2bRoom":
	if exists(
		[Observation] Ox
			where "ToCode"(First(Ox.code.coding)) = "Oxygen saturation in Arterial blood by Pulse oximetry"
				and Ox.value >= 88 
				and Ox.performer is not null 
				and Ox.status.value = 'final')
	then true
	else if exists([Observation] Pa
		where "ToCode"(First(Pa.code.coding)) = "Oxygen [Partial pressure] in Arterial blood"
				and Pa.value >= 55 
				and Pa.status.value = 'final'
				and Pa.performer is not null)
	then true
	else false
		
define "Group1Condition2Final":
	if (("Group1Condition2bRoom" = true)  and ("Group1Condition2aSleep"  = true)and  ("Covered" is not null))
	then true 
	else false
	
define "Group1Condition3":
	if exists(
		[Observation] Ox
			where "ToCode"(First(Ox.code.coding)) = "Oxygen saturation in Arterial blood by Pulse oximetry --on room air"
				and Ox.value >= 88 
				and First(Ox.method.coding) = "Cardiopulmonary exercise test (procedure)"
				and Ox.performer is not null 
				and Ox.status.value = 'final')
	then true
	else if exists([Observation] Pa
		where "ToCode"(First(Pa.code.coding)) = "Oxygen [Partial pressure] in Arterial blood"
				and Pa.value >= 55 
				and First(Pa.method.coding) = "Cardiopulmonary exercise test (procedure)"
				and Pa.status.value = 'final'
				and Pa.performer is not null)
	then true
	else false
		
define "Group1Condition3Final":
	if (("Group1Condition3" = true)and ("Covered" is not null))
	then true 
	else false
	
define "Group1":
	if (("Group1Condition1Final" = true) or ("Group1Condition2Final" = true) or ("Group1Condition3Final" = true))
	then true 
	else false
	
define "Group2Condition1":
	if exists(
		[Observation] Ox
			where "ToCode"(First(Ox.code.coding)) = "Oxygen saturation in Arterial blood by Pulse oximetry"
				and Ox.value = 89  
				and Ox.performer is not null 
				and Ox.status.value = 'final')
	then true
	else if exists([Observation] Pa
		where "ToCode"(First(Pa.code.coding)) = "Oxygen [Partial pressure] in Arterial blood"
				and Pa.value  >= 56  and Pa.value <= 59 
				and Pa.status.value = 'final'
				and Pa.performer is not null)
	then true
	else false

define "Group2Condition2a":
	([Condition]Edema
	with [Condition]HeartFailure
	such that "ToCode"(First(HeartFailure.code.coding)) = "Congestive heart failure (disorder)"
		and "ToCode"(First(Edema.code.coding)) = "Dependent edema (finding)"
		and Edema.onset as Period overlaps HeartFailure.onset as Period)EdemaWithHeart
		where First(EdemaWithHeart.clinicalStatus.coding).code.value = 'active'

define PulmonaryHypertension:
	exists([Condition]PulmonaryHypertension 
	where "ToCode"(First(PulmonaryHypertension.code.coding)) = "Pulmonary hypertension, unspecified"
			or "ToCode"(First(PulmonaryHypertension.code.coding)) = "Cor pulmonale (chronic)")


define SecondaryPolycythemia:
	exists([Condition]SecondaryPolycythemia
		with [Observation: "Hematocrit"]Hematocrit
		such that Hematocrit.value > 56 
		and Hematocrit.status.value = 'final'
		and "ToCode"(First(SecondaryPolycythemia.code.coding)) = "Secondary polycythemia"
		and First(SecondaryPolycythemia.clinicalStatus.coding).code.value = 'active')

define "Group2Condition2":
	if(("Group2Condition2a" is not null)
		or ("PulmonaryHypertension" = true)
		or ("SecondaryPolycythemia" = true))
		then true
		else false
	
define "Group2":
	if (("Group2Condition1" = true)
		and ("Group2Condition2" = true))
	then true 
	else false
	
define "Group3a":
	if exists(
		[Observation] Ox
			where "ToCode"(First(Ox.code.coding)) = "Oxygen saturation in Arterial blood by Pulse oximetry"
				and Ox.value >90
				and Ox.performer is not null 
				and Ox.status.value = 'final')
	then true
	else if exists([Observation] Pa
		where "ToCode"(First(Pa.code.coding)) = "Oxygen [Partial pressure] in Arterial blood"
				and Pa.value >60
				and Pa.status.value = 'final'
				and Pa.performer is not null)
	then true
	else false
	
		
define "Group3b":
	[Observation]OB
	with [Condition]C
	 such that First(C.code.coding) = "Age-related physical debility"
		and OB.subject is not null
		and OB.status.value = 'final'
		 and OB.subject.type = 'http://hl7.org/fhir/StructureDefinition/Location'
		 //and defaultlib."GetLocation"(OB.subject).position.altitude > 500 'm'


define "Group3":
	if ((("Group3a" = true)and ("Covered" is not null)) or (("Group3b" is not null) and ("Covered" is not null)))
	then true 
	else false



define function "EncounterPractitioner"(Encounter Encounter):
	Encounter.participant PR
	return singleton from ([Practitioner]P where 'Practitioner/' + P.id.value = PR.individual.reference.value)
		
define "FaceToFaceEncounter":
	"EncounterResource" F2FEncounter
	where First(F2FEncounter.type) in "Face to Face Encounter"
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
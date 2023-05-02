library HomeOxygenTherapy version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include HomeOxygenAdaptive version '1.0.0' called HOAdaptive

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

code "E0433": 'E0433' from "HCPCS"
code "E0434": 'E0434' from "HCPCS"
code "E0444": 'E0444' from "HCPCS"
code "E0431": 'E0431' from "HCPCS"
code "K0738": 'K0738' from "HCPCS"
code "E0443": 'E0443' from "HCPCS"
code "E1392": 'E1392' from "HCPCS"
code "E0439": 'E0439' from "HCPCS"
code "E0442": 'E0442' from "HCPCS"
code "E0424": 'E0424' from "HCPCS"
code "E0441": 'E0441' from "HCPCS"
code "E1390": 'E1390' from "HCPCS"
code "E1391": 'E1391' from "HCPCS"

//Immobilization_Codes
code "102491009": '102491009' from "SNOMEDCT"
code "129857008": '129857008' from "SNOMEDCT"
code "129859006": '129859006' from "SNOMEDCT"
code "160685001": '160685001' from "SNOMEDCT"
code "371632003": '371632003' from "SNOMEDCT"
code "8510008": '8510008' from "SNOMEDCT"

parameter "Encounter" Encounter
parameter "DeviceRequest" DeviceRequest

context Patient

define "DeviceRequestResource":
	"DeviceRequest"

define "CertificationDate":
	ToDate(start of "FaceToFaceEncounter".period)

define EncounterResource: 
	Coalesce(singleton from([Encounter]E where 'Encounter/' + E.id.value = ("DeviceRequest".encounter).reference.value ), HOAdaptive."EncounterResponse")

define function "EncounterDiagnosis"(Encounter Encounter):
  	Encounter.diagnosis D
  	return singleton from ([Condition]C where C.id.value = "GetId"(D.condition.reference.value))

define EncounterCondition:
    "EncounterDiagnosis"("EncounterResource")

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

define OrderingPhysician:
	"FaceToFaceEncounter".participant PR
	return singleton from ([Practitioner]P where 'Practitioner/' + P.id.value = PR.individual.reference.value)

define OrderingPhysicianNPI:
	(First("OrderingPhysician".identifier identifier
    		where identifier.system.value = 'http://hl7.org/fhir/sid/us-npi')).value.value

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

define "BloodGasStudy":
	First([Procedure]P
		where P.status.value = 'completed'
		and ("ToCode"(First(P.code.coding)) = "Blood gas analysis (procedure)"
				or "ToCode"(First(P.code.coding)) = "Blood gas measurement (procedure)")
		and (("Normalize Interval"(P.performed) starts 2 days before end of "FaceToFaceEncounter".period)
				and "ToCode"("FaceToFaceEncounter".class) = "inpatient encounter")
				or
			(("Normalize Interval"(P.performed) starts during Interval[ToDateTime("CertificationDate") , ToDateTime("CertificationDate"+30 days)])
				and "ToCode"("FaceToFaceEncounter".class) = "Outpatient"))
	

define BloodGasStudyDate:
	start of "Normalize Interval"("BloodGasStudy".performed)

define BloodGasStudyPH:
	(First([Observation]O
		where "ToCode"(First(O.code.coding)) = "pH of Arterial blood"))O
	return FHIRHelpers.ToQuantity(O.value)

define BloodGasStudyPaCO2:
	(First([Observation]O
		where "ToCode"(First(O.code.coding)) = "Carbon dioxide [Partial pressure] in Arterial blood"))O
	return FHIRHelpers.ToQuantity(O.value) 

define BloodGasStudyO2Sat:
	(First([Observation]O
		where "ToCode"(First(O.code.coding)) = "Oxygen saturation in Arterial blood"))O
	return FHIRHelpers.ToQuantity(O.value)

define BloodGasStudyHCO3:
	(First([Observation]O
		where "ToCode"(First(O.code.coding)) = "Bicarbonate [Moles/volume] in Arterial blood"))O
	return FHIRHelpers.ToQuantity(O.value)

define BloodGasStudyHematocrit:
	(First([Observation]O
		where "ToCode"(First(O.code.coding)) = "Hematocrit [Volume Fraction] of Arterial blood"))O
	return FHIRHelpers.ToQuantity(O.value)

define BloodGasStudyPaO2:
	(First([Observation]O
		where "ToCode"(First(O.code.coding)) = "Oxygen [Partial pressure] in Arterial blood"))O
	return FHIRHelpers.ToQuantity(O.value)


define "Hematocrit_lab_test_Codes": { '20570-8', '31100-1', '32354-3', '41654-5', '41655-2', '4544-3', '4545-0', '71829-6', '71830-4', '71832-0', '71833-8' }

// Other codes
define "Immobilization_Codes": { '102491009', '129857008', '129859006', '160685001', '371632003', '8510008' }

define function "GetId"(uri String):
	Last(Split(uri, '/'))
   				
define ArterialOxygenSaturation:
	(First([Observation] P
		where "ToCode"(First(P.code.coding)) = "Oxygen saturation in Arterial blood by Pulse oximetry --resting"))O
			return FHIRHelpers.ToQuantity(O.value)
					
define ArterialPartialPressureOfOxygen: 
	(First([Observation] P 
		where "ToCode"(First(P.code.coding)) =  "Oxygen [Partial pressure] in Arterial blood"))O
		return FHIRHelpers.ToQuantity(O.value)
		
define ArterialOxygenSaturationExercise:
	(First([Observation] P 
		where "ToCode"(First(P.code.coding)) = "Oxygen saturation in Arterial blood by Pulse oximetry --W exercise"))O
		return FHIRHelpers.ToQuantity(O.value)

define ArterialOxygenSaturationExerciseWithOxygen:
	(First([Observation] P 
		where "ToCode"(First(P.code.coding)) = "6-minute walk test (procedure)"))O
		return FHIRHelpers.ToQuantity(O.value)
		
define PulseOximetryO2:
	(First([Observation] P 
		where "ToCode"(First(P.code.coding)) = "Overnight pulse oximetry (procedure)"))O
		return FHIRHelpers.ToQuantity(O.value)

define TestingDate:
	(First([Observation] P
		where "ToCode"(First(P.code.coding)) = "Oxygen saturation in Arterial blood by Pulse oximetry"))O
			return (O.effective as dateTime).value
		
define PatientMobile: 
	exists([Observation] P 
		where "ToCode"(First(P.code.coding)) = "Walks indoors - usual functional ability during assessment period [CMS Assessment]")

define InhaledFlowRate:
	(First([Observation] P 
		where "ToCode"(First(P.code.coding)) = "Inhaled oxygen flow rate"))O
		return FHIRHelpers.ToQuantity(O.value)

define PatientDiagnoses:
		if exists([Condition] P
					where exists(P.code.coding P
						where P in "Chronic Obstructive Lung Disease (COPD) ICD10CM"))
			then 'COPD'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Bronchiectasis"))
			then 'Bronchiectasis'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Hypoxemia"))
			then 'Hypoxemia'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Interstitial lung disease"))
			then 'Diffuse interstitial lung disease'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Cystic Fibrosis"))
			then 'Cystic Fibrosis'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Malignant Neoplasm of Respiratory and Intrathoracic Organs"))
			then 'Pulmonary neoplasm'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Familial erythrocytosis")
			then 'Erythrocytosis'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Cor pulmonale (chronic)")
			then 'Pulmonary hypertension'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Congestive heart failure (disorder)")
			then 'Recurring CHF d/t Cor Pulmonale'
		else ''

define SecondaryToCORPulmonale:
	if exists([Condition] P
					where exists(P.code.coding P
						where P in "Acute or Chronic Heart Failure Disorder ICD10CM"))
			then 'Recurring heart failure'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Acute Pulmonary Edema"))
			then 'Edema'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Breath Sounds")) 
			then 'Pulmonary Rales'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Pleuritis (SNOMED)")) 
			then 'Fluid on CXR'
		else if exists([Observation] P
					where "ToCode"(First(P.code.coding)) = "Cardiac blood pool imaging, gated equilibrium")
			then 'Gated blood pool scan'
		else if exists([Observation] P
					where "ToCode"(First(P.code.coding)) = "P pulmonale by electrocardiogram")
			then '“p” Pulmonale on ECG'
		else ''	

define Erythrocythemia: 
	exists([Condition] P
		where exists(P.code.coding P
						where P in "Secondary Erythrocytosis Disorder"))
	
define HematocritResult:
	First([Observation] P
		where "ToCode"(First(P.code.coding)) = "Hematocrit/Hemoglobin [Ratio] of Blood by Automated count").value
			
define NocturnalRestlessness:
	exists([Observation] P
					where "ToCode"(First(P.code.coding)) = "I tossed and turned at night in past 7 days [PROMIS]"
					or "ToCode"(First(P.code.coding)) = "Restlessness and agitation"
					or "ToCode"(First(P.code.coding)) = "Morning headache (finding)"
					) 

define NocturnalRestlessnessStudy:
	if exists([Observation] P
					where "ToCode"(First(P.code.coding)) = "Overnight pulse oximetry (procedure)")
			then 'Nocturnal oximetry'
		else if exists([Observation] P
					where "ToCode"(First(P.code.coding)) = "Polysomnography (procedure)")
			then 'Sleep Study'
		else ''

define ExertionalHypoxia:
	exists([Condition] P
			where "ToCode"(First(P.code.coding)) = "Chronic respiratory failure with hypoxia"
				or "ToCode"(First(P.code.coding)) = "Desaturation of blood (disorder)")

define ClinicalTrials:
	if exists([Procedure] P
		where "ToCode"(First(P.code.coding)) = "Long-term oxygen therapy (procedure)")
		then 'Long-term O2 therapy'
	else if exists([Procedure] P
		where "ToCode"(First(P.code.coding)) = "6-minute walk test (procedure)")
		then '“6” minute walk'
	else if exists([Procedure] P
		where exists(P.code.coding P
						where P in "Cluster Headache"))
		then 'Cluster headache'
	else ''

define GeneralSymptoms:
	if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Unintentional weight gain (finding)")
			then 'weight gain'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Unintentional weight loss (finding)")
			then 'weight loss'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Poor Sleep Hygeine or Sleep Challenges")) 
			then 'sleeping problems'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Fatigue")) 
			then 'fatigue'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Fever (ICD10CM)")) 
			then 'fever'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Chills (ICD10CM)")) 
			then 'chills'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Night Sweats (SNOMED)")) 
			then 'night sweats / diaphoresi'
		else ''	

define NeckReview: 
	if exists([Condition] P
					where exists(P.code.coding P
						where P in "Spine or Neck Disorder")) 
			then 'pain on movement'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Acute lymphadenitis of neck (disorder)")
			then 'lumps'
		else ''

define PulmonaryReview:
	if exists([Condition] P
					where exists(P.code.coding P
						where P in "Cough (ICD10CM)"))
			then 'cough'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Difficulty Breathing (ICD10CM)"))
			then 'shortness of breath'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Chest Pain (ICD10CM)"))
			then 'pain'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Wheezing"))
			then 'wheezing'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Hemoptysis (ICD10CM)"))
			then 'hemoptysis'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Sputum (Specimen Type) (SNOMED)"))
			then 'sputum production'
		else ''

define CardiacReview: 
	if exists([Condition] P
					where exists(P.code.coding P
						where P in "Chest Pain"))
			then 'chest pain'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Heart Palpitations"))
			then 'palpitations'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Orthopnea")
			then 'orthopnea'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Cardiac murmur, unspecified")
			then 'murmur'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Syncope"))
			then 'syncope'
		else ''

define VascularReview:
	if exists([Condition] P
					where exists(P.code.coding P
						where P in "Edema"))
			then 'edema'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Claudication"))
			then 'claudication'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Varicose vein finding (finding)")
			then 'varicose veins'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Phlebitis and Thrombophlebitis of the Veins of lower extremity"))
			then 'thrombophlebitis'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Acute Peptic Ulcer"))
			then 'ulcers'
		else ''

define HematologyReview:
	if exists([Condition] P
			where exists(P.code.coding P
				where P in "Anemia Conditions"))
		then 'anemia'
	else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Bruising symptom (finding)")
			then 'bruising'
	else if exists([Condition] P
			where exists(P.code.coding P
				where P in "Bleeding Disorder"))
		then 'bleeding disorders (conditional)'
	else ''

define EndocrineReview:
	if exists([Condition] P
			where exists(P.code.coding P
				where P in "Diabetes"))
		then 'diabetes'
	else if exists([Condition] P
				where "ToCode"(First(P.code.coding)) = "Goiter (disorder)")
		then 'goiter'
	else if exists([Condition] P
				where "ToCode"(First(P.code.coding)) = "Lipids abnormal (finding)")
		then 'lipid disorders'
	else ''

define TreatmentsTried:
	if exists([Procedure] P
			where exists(P.code.coding P
				where P in "Long Acting Inhaled Bronchodilators"))
		then 'Bronchodilators'
	else if exists([Procedure] P
			where exists(P.code.coding P
				where P in "Inhaled Steroid Combinations"))
		then 'Steroids'
	else if exists([Procedure] P
			where exists(P.code.coding P
				where P in "COVID19 SNOMED Value Set for Non Invasive Respiratory Support"))
		then 'diabetes'
	else if exists([Procedure] P
			where exists(P.code.coding P
				where P in "COVID19 SNOMED Value Set for Invasive Mechanical Ventilation"))
		then 'Ventilation'
	else if exists([Procedure] P
			where exists(P.code.coding P
				where P in "Cromolyn Inhalant Preparations"))
		then 'Anti-Inflammatory'
	else 'None'

define PsychiatricReview:
	if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Hallucinations, unspecified")
			then 'hallucinations'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Delusional disorders")
			then 'delusions'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Anxiety"))
			then 'anxiety'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Other specified nonpsychotic mental disorders")
			then 'nervous breakdown'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Mood disorder (disorder)")
			then 'mood changes'
		else ''



define NeurologicalReview:
	if exists([Condition] P
					where exists(P.code.coding P
						where P in "Seizure"))
			then 'seizures'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Short Term Memory Deficits"))
			then 'poor memory'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Difficulty Concentrating"))
			then 'poor concentration'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Numbness (finding)"
						or "ToCode"(First(P.code.coding)) = "Numbness and tingling sensation of skin (finding)")
			then 'numbness / tingling'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Pins and needles (finding)")
			then 'pins and needles sensation'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Other disturbances of skin sensation")
			then 'hyperpathia'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Dysesthesia (finding)")
			then 'dysesthesia'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Weakness")
			then 'weakness'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Spinal Cord Injury or Paralysis Disorder"))
			then 'paralysis'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Essential tremor"))
			then 'tremors'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Involuntary movement symptom (finding)")
			then 'involuntary movements'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Abnormality of Gait and Mobility"))
			then 'unstable gait'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Fall Risk"))
			then 'fall'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Vertigo"))
			then 'vertigo'
		
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Headache"))
			then 'headache'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Stroke"))
			then 'stroke'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Speech disturbances, not elsewhere classified")
			then 'speech disorders'
		else ''
		
define MusculoskeletalReview:
	if exists([Condition] P
					where exists(P.code.coding P
						where P in "Pain"))
			then 'pain'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Swelling (finding)")
			then 'swelling'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Stiff neck (SNOMED)"))
			then 'stiffness'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Functional limitation in range of motion [CMS Assessment]")
			then 'limitation of range of motion'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Arthritis Disorders"))
			then 'arthritis'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Gout"))
			then 'gout'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Abdominal Cramps (SNOMED)"))
			then 'cramps'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Myalgia (ICD10CM)"))
			then 'myalgia'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Fasciculation")
			then 'fasciculation'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Multiple System Atrophy (SNOMED)"))
			then 'atrophy'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "HEDIS Fractures Value Set ICD10CM"))    
			then 'fracture'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Osteopathies chondropathies and acquired musculoskeletal deformities"))
			then 'deformity'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Muscle weakness (ICD10CM)"))
			then 'weakness'
		else ''

define GastrointestinalReview:
	if exists([Condition] P
					where exists(P.code.coding P
						where P in "Dysphagia (SNOMED)"))
			then 'swallowing problems'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Abdominal Pain (ICD10CM)"))
			then 'abdominal pain'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Constipation"))
			then 'constipation'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Diarrhea"))
			then 'diarrhea'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Urinary Incontinence"))
			then 'incontinence'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Nausea (ICD10CM)"))
			then 'nausea'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Vomiting"))
			then 'vomiting'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Acute Peptic Ulcer"))
			then 'ulcers'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Melena")
			then 'melena'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Hemorrhage of anus and rectum")
			then 'rectal bleeding'
		else if exists([Condition] P
					where "ToCode"(First(P.code.coding)) = "Heartburn")
			then 'heartburn'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Jaundice"))    
			then 'jaundice'
		else if exists([Condition] P
					where exists(P.code.coding P
						where P in "Hematemesis [Unspecified Cause] (ICD10CM)"))
			then 'hematemesis'
		else ''

define HematocritThatIsGreaterThanThreshold: 
	FHIRHelpers.ToQuantity(singleton from([Observation] P where First(P.code.coding).code.value in "Hematocrit_lab_test_Codes").value).value 
	
define PatientHasHematocritThatIsGreaterThanThreshold: 
	if ("HematocritThatIsGreaterThanThreshold" >56)
	then true else false

define DeviceRequestDescription: 'HCPCS ' + First("DeviceRequest".code.coding).code.value + ' - ' + First("DeviceRequest".code.coding).display.value

define DeviceRequestCode: First("DeviceRequest".code.coding).code.value

define DeviceOrderId: "DeviceRequest".groupIdentifier

define DeviceRequestedIsPortable: First("DeviceRequest".code.coding).code.value in { 'E0433', 'E0434', 'E0444', 'EO431', 'K0738', 'E0443', 'E1392' }

define DeviceRequestedIsStationary: First("DeviceRequest".code.coding).code.value in { 'E0439', 'E0442', 'E0424', 'E0441', 'E1390', 'E1391' }

define function "Normalize Interval"(onset Choice<FHIR.dateTime, FHIR.Age, FHIR.Period, FHIR.Range, FHIR.string>):
  if onset is FHIR.dateTime then
	  Interval[FHIRHelpers.ToDateTime(onset as FHIR.dateTime), FHIRHelpers.ToDateTime(onset as FHIR.dateTime)]
	else if onset is FHIR.Period then
	  FHIRHelpers.ToInterval(onset as FHIR.Period)
	else if onset is FHIR.Age then
	  Interval[FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(onset as FHIR.Age),
		  FHIRHelpers.ToDate(Patient.birthDate) + FHIRHelpers.ToQuantity(onset as FHIR.Age) + 1 year)
	else null
		






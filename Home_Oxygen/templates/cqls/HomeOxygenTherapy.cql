library HomeOxygenTherapy version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

codesystem "ICD10CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "LOINC": 'http://loinc.org'
codesystem "NUCCPT": 'https://www.nlm.nih.gov/research/umls/sourcereleasedocs/current/NUCCPT/sourcerepresentation.html'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "CPT": 'http://www.ama-assn.org/go/cpt'
codesystem "ActEncounterCodev2": 'http://terminology.hl7.org/CodeSystem/v2-0004'
codesystem "ActEncounterCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode'
codesystem "HealthCareProviderTaxonomy": 'http://terminology.hl7.org/CodeSystem/v3-HealthcareProviderTaxonomyHIPAA'

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
valueset "Cluster Headache": '2.16.840.1.113762.1.4.1034.464'
valueset "Poor Sleep Hygeine or Sleep Challenges": '2.16.840.1.113762.1.4.1222.1072'
valueset "Fatigue": '2.16.840.1.113762.1.4.1222.1398'
valueset "Fever (ICD10CM)": '2.16.840.1.113762.1.4.1146.671'
valueset "Chills (ICD10CM)": '2.16.840.1.113762.1.4.1146.812'
valueset "Night Sweats (SNOMED)": '2.16.840.1.113762.1.4.1146.906'
valueset "Spine or Neck Disorder": '2.16.840.1.113762.1.4.1219.117'
valueset "Cough (ICD10CM)": '2.16.840.1.113762.1.4.1146.90'
valueset "Difficulty Breathing (ICD10CM)": '2.16.840.1.113762.1.4.1146.890'
valueset "Chest Pain (ICD10CM)": '2.16.840.1.113762.1.4.1146.662'
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
valueset "Difficulty Concentrating": '2.16.840.1.113883.3.3616.200.110.102.6312'
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
valueset "Oxygen Saturation by Pulse Oximetry": '2.16.840.1.113762.1.4.1045.151'
valueset "Home Oxygen Therapy Accessory": '2.16.840.1.113762.1.4.1219.130'

valueset "Obstructive Sleep Apnea (ICD10CM)":'2.16.840.1.113762.1.4.1034.477'
valueset "Dyspnea": '2.16.840.1.113762.1.4.1182.47'
valueset "Limited Life Expectancy":'2.16.840.1.113883.3.526.2.1353'
valueset "Acne": '2.16.840.1.113883.3.464.1003.116.11.1029'
valueset "Atopic Dermatitis": '2.16.840.1.113762.1.4.1078.158'
valueset "Cellulitis": '2.16.840.1.113762.1.4.1222.533'
valueset "Rheumatoid Arthritis": '2.16.840.1.113883.3.464.1003.113.12.1005'
valueset "Multiple Sclerosis": '2.16.840.1.113762.1.4.1034.187'
valueset "Celiac disease (ICD10)":'2.16.840.1.113762.1.4.1034.575'

code "inpatient encounter": 'IMP' from "ActEncounterCode" display 'inpatient encounter'
code "Outpatient": 'O' from "ActEncounterCodev2" display 'Outpatient'

// Device Accessory Codes

code "Home ventilator, any type, used with invasive interface, (e.g., tracheostomy tube)": 'E0465' from "HCPCS" display 'Home ventilator, any type, used with invasive interface, (e.g., tracheostomy tube)'
code "Home ventilator, any type, used with non-invasive interface, (e.g., mask, chest shell)": 'E0466' from "HCPCS" display 'Home ventilator, any type, used with non-invasive interface, (e.g., mask, chest shell)'
code "Home ventilator, multi-function respiratory device, also performs any or all of the additional functions of oxygen concentration, drug nebulization, aspiration, and cough stimulation, includes all accessories, components and supplies for all functions" : 'E0467' from "HCPCS" display 'Home ventilator, multi-function respiratory device, also performs any or all of the additional functions of oxygen concentration, drug nebulization, aspiration, and cough stimulation, includes all accessories, components and supplies for all functions'
code "Respiratory assist device, bi-level pressure capability, without backup rate feature, used with noninvasive interface, e.g., nasal or facial mask (intermittent assist device with continuous positive airway pressure device)" : 'E0470' from "HCPCS" display 'Respiratory assist device, bi-level pressure capability, without backup rate feature, used with noninvasive interface, e.g., nasal or facial mask (intermittent assist device with continuous positive airway pressure device)'
code "Respiratory assist device, bi-level pressure capability, with back-up rate feature, used with noninvasive interface, e.g., nasal or facial mask (intermittent assist device with continuous positive airway pressure device)" : 'E0471' from "HCPCS" display 'Respiratory assist device, bi-level pressure capability, with back-up rate feature, used with noninvasive interface, e.g., nasal or facial mask (intermittent assist device with continuous positive airway pressure device)'
code "Respiratory assist device, bi-level pressure capability, with backup rate feature, used with invasive interface, e.g., tracheostomy tube (intermittent assist device with continuous positive airway pressure device)": 'E0472' from "HCPCS" display 'Respiratory assist device, bi-level pressure capability, with backup rate feature, used with invasive interface, e.g., tracheostomy tube (intermittent assist device with continuous positive airway pressure device)'
code "Cannula, nasal": 'A4615' from "HCPCS" display 'Cannula, nasal'


// Procedure Codes

// code "Polysomnography (procedure)": '60554003' from "SNOMEDCT" display 'Polysomnography (procedure)'
// code "Echocardiography (procedure)": '40701008' from "SNOMEDCT" display 'Echocardiography (procedure)'
// code "Cardiopulmonary exercise test (procedure)": '447346005' from "SNOMEDCT" display 'Cardiopulmonary exercise test (procedure)'
// code "Positive airway pressure nap study (procedure)": '703476007' from "SNOMEDCT" display 'Positive airway pressure nap study (procedure)'
// code "Continuous positive airway pressure titration (procedure)": '446573003' from "SNOMEDCT" display 'Continuous positive airway pressure titration (procedure)'
// code "Titration method (procedure)": '117007006' from "SNOMEDCT" display 'Titration method (procedure)'
// code "Oral steroid therapy (procedure)": '297280007' from "SNOMEDCT" display 'Oral steroid therapy (procedure)'
// code "Intravenous hydrocortisone therapy (procedure)": '297283009' from "SNOMEDCT" display 'Intravenous hydrocortisone therapy (procedure)'
// code "Steroid therapy (procedure)": '297279009' from "SNOMEDCT" display 'Steroid therapy (procedure)'
// code "Inhaled steroid therapy (procedure)": '710818004' from "SNOMEDCT" display 'Inhaled steroid therapy (procedure)'
// code "Long-term oxygen therapy (procedure)": '243137006' from "SNOMEDCT" display 'Long-term oxygen therapy (procedure)'
// code "6-minute walk test (procedure)": '252478000' from "SNOMEDCT" display '6-minute walk test (procedure)'

code "Blood gas analysis (procedure)": '278297009' from "SNOMEDCT" display 'Blood gas analysis (procedure)'
code "Blood gas measurement (procedure)": '167018008' from "SNOMEDCT" display 'Blood gas measurement (procedure)'
code "Pulse oximetry (procedure)": '252465000' from "SNOMEDCT" display 'Pulse oximetry (procedure)'
code "Nocturnal continuous positive airway pressure (regime/therapy)": '34281000175105' from "SNOMEDCT" display 'Nocturnal continuous positive airway pressure (regime/therapy)'
code "Overnight pulse oximetry (procedure)": '252568001' from "SNOMEDCT" display 'Overnight pulse oximetry (procedure)'

//Observation Codes

// code "Apnea hypopnea index 24 hour": '69990-0' from "LOINC" display 'Apnea hypopnea index 24 hour'
// code "Respiratory disturbance index": '90566-1' from "LOINC" display 'Respiratory disturbance index'
// code "Bicarbonate [Moles/volume] in Arterial blood": '1960-4' from "LOINC" display 'Bicarbonate [Moles/volume] in Arterial blood'
// code "Carbon dioxide [Partial pressure] in Arterial blood": '2019-8' from "LOINC" display 'Carbon dioxide [Partial pressure] in Arterial blood'
// code "pH of Arterial blood": '2744-1' from "LOINC" display 'pH of Arterial blood'
// code "Inhaled oxygen flow rate": '3151-8' from "LOINC" display 'Inhaled oxygen flow rate'

code "Pigmentation of skin or mucosa (finding)": '373923006' from "SNOMEDCT" display 'Pigmentation of skin or mucosa (finding)'
code "Use of supplemental oxygen": '88658-0' from "LOINC" display 'Use of supplemental oxygen'
code "Hemoglobin [Mass/volume] in Blood": '718-7' from "LOINC" display 'Hemoglobin [Mass/volume] in Blood'
code "High altitude residence": '271209008' from "SNOMEDCT" display 'High altitude residence'
code "Effects of high altitude (disorder)": '87284002' from "SNOMEDCT" display 'Effects of high altitude (disorder)'
code "Accidents due to residence or prolonged visit at high altitude (event)": '217615009' from "SNOMEDCT" display 'Accidents due to residence or prolonged visit at high altitude (event)'
code "Periodic breathing of sleep at high altitude (finding)": '442549008' from "SNOMEDCT" display 'Periodic breathing of sleep at high altitude (finding)'
code "Pulmonary artery pressure monitoring (regime/therapy)": '24599003' from "SNOMEDCT" display 'Pulmonary artery pressure monitoring (regime/therapy)'
code "Walks indoors - usual functional ability during assessment period [CMS Assessment]": '94996-6' from "LOINC" display 'Walks indoors - usual functional ability during assessment period [CMS Assessment]'
code "Hematocrit [Volume Fraction] of Arterial blood": '32354-3' from "LOINC" display 'Hematocrit [Volume Fraction] of Arterial blood'
code "Oxygen [Partial pressure] adjusted to patient's actual temperature in Arterial blood": '19255-9' from "LOINC" display 'Oxygen [Partial pressure] adjusted to patient\'s actual temperature in Arterial blood'
code "Oxygen saturation in Arterial blood by Pulse oximetry --W exercise": '89276-0' from "LOINC" display 'Oxygen saturation in Arterial blood by Pulse oximetry --W exercise'
code "Oxygen saturation in Arterial blood by Pulse oximetry --on room air": '59410-1' from "LOINC" display 'Oxygen saturation in Arterial blood by Pulse oximetry --on room air'
code "Oxygen saturation in Arterial blood by Pulse oximetry --resting": '59417-6' from "LOINC" display 'Oxygen saturation in Arterial blood by Pulse oximetry --resting'
code "Oxygen saturation in Arterial blood by Pulse oximetry": '59408-5' from "LOINC" display 'Oxygen saturation in Arterial blood by Pulse oximetry'
code "Oxygen saturation in Arterial blood": '2708-6' from "LOINC" display 'Oxygen saturation in Arterial blood'
code "Oxygen [Partial pressure] in Arterial blood": '2703-7' from "LOINC" display 'Oxygen [Partial pressure] in Arterial blood'
code "Cardiac blood pool imaging, gated equilibrium": '78472' from "CPT" display 'Cardiac blood pool imaging, gated equilibrium; planar, single study at rest or stress (exercise and/or pharmacologic), wall motion study plus ejection fraction, with or without additional quantitative processing'
code "P pulmonale by electrocardiogram": '164914003' from "SNOMEDCT" display 'P pulmonale by electrocardiogram'
code "Hematocrit/Hemoglobin [Ratio] of Blood by Automated count": '16931-8' from "LOINC" display 'Hematocrit/Hemoglobin [Ratio] of Blood by Automated count'
code "I tossed and turned at night in past 7 days [PROMIS]": '62008-8' from "LOINC" display 'I tossed and turned at night in past 7 days [PROMIS]'
code "Restlessness and agitation": 'R45.1' from "ICD10CM" display 'Restlessness and agitation'
code "Morning headache (finding)": '162310002' from "SNOMEDCT" display 'Morning headache (finding)'


// Condition Codes

// code "Dependent edema (finding)": '248499004' from "SNOMEDCT" display 'Dependent edema (finding)'
// code "P pulmonale (finding)": '164914003' from "SNOMEDCT" display 'P pulmonale (finding)'
// code "Secondary polycythemia": 'D75.1' from "ICD10CM" display 'Secondary polycythemia'
// code "Age-related physical debility": 'R54' from "ICD10CM" display 'Age-related physical debility'
// code "Bleeding (finding)": '131148009' from "SNOMEDCT" display 'Bleeding (finding)'
// code "Muscle wasting and atrophy, not elsewhere classified, unspecified site": 'M62.50' from "ICD10CM" display 'Muscle wasting and atrophy, not elsewhere classified, unspecified site'
// code "Pulmonary hypertension, unspecified": 'I27.20' from "ICD10CM" display 'Pulmonary hypertension, unspecified'
// code "Desaturation of blood (disorder)": '238159008' from "SNOMEDCT" display 'Desaturation of blood (disorder)'

code "Numbness (finding)": '44077006' from "SNOMEDCT" display 'Numbness (finding)'
code "Numbness and tingling sensation of skin (finding)": '101000119102' from "SNOMEDCT" display 'Numbness and tingling sensation of skin (finding)'
code "Pins and needles (finding)": '62507009' from "SNOMEDCT" display 'Pins and needles (finding)'
code "Other disturbances of skin sensation": 'R20.8' from "ICD10CM" display 'Other disturbances of skin sensation'
code "Dysesthesia (finding)": '279079003' from "SNOMEDCT" display 'Dysesthesia (finding)'
code "Weakness": 'R53.1' from "ICD10CM" display 'Weakness'
code "Involuntary movement symptom (finding)": '162227008' from "SNOMEDCT" display 'Involuntary movement symptom (finding)'
code "Speech disturbances, not elsewhere classified": 'R47' from "ICD10CM" display 'Speech disturbances, not elsewhere classified'
code "Hallucinations, unspecified": 'R44.3' from "ICD10CM" display 'Hallucinations, unspecified'
code "Delusional disorders": 'F22' from "ICD10CM" display 'Delusional disorders'
code "Other specified nonpsychotic mental disorders": 'F48.8' from "ICD10CM" display 'Other specified nonpsychotic mental disorders'
code "Mood disorder (disorder)": '46206005' from "SNOMEDCT" display 'Mood disorder (disorder)'
code "Bruising symptom (finding)": '161885008' from "SNOMEDCT" display 'Bruising symptom (finding)'
code "Goiter (disorder)": '3716002' from "SNOMEDCT" display 'Goiter (disorder)'
code "Lipids abnormal": '166818002' from "SNOMEDCT" display 'Lipids abnormal'
code "Vitiligo (disorder)": '56727007' from "SNOMEDCT" display 'Vitiligo (disorder)'
code "Inflammatory bowel disease (disorder)": '24526004' from "SNOMEDCT" display 'Inflammatory bowel disease (disorder)'
code "Dyspnea on exertion (finding)": '60845006' from "SNOMEDCT" display 'Dyspnea on exertion (finding)'
code "Peripheral vascular disease (disorder)": '400047006' from "SNOMEDCT" display 'Peripheral vascular disease (disorder)'
code "Congestive heart failure (disorder)": '42343007' from "SNOMEDCT" display 'Congestive heart failure (disorder)'
code "Cor pulmonale (chronic)": 'I27.81' from "ICD10CM" display 'Cor pulmonale (chronic)'
code "Familial erythrocytosis": 'D75.0' from "ICD10CM" display 'Familial erythrocytosis'
code "Angina pectoris, unspecified": 'I20.9' from "ICD10CM" display 'Angina pectoris, unspecified'
code "Swelling (finding)": '65124004' from "SNOMEDCT" display 'Swelling (finding)'
code "Functional limitation in range of motion during assessment period [CMS Assessment]": '92908-3' from "LOINC" display 'Functional limitation in range of motion during assessment period [CMS Assessment]'
code "Fasciculation": 'R25.3' from "ICD10CM" display 'Fasciculation'
code "Melena": 'K92.1' from "ICD10CM" display 'Melena'
code "Hemorrhage of anus and rectum": 'K62.5' from "ICD10CM" display 'Hemorrhage of anus and rectum'
code "Heartburn": 'R12' from "ICD10CM" display 'Heartburn'
code "Chronic respiratory failure with hypoxia": 'J96.11' from "ICD10CM" display 'Chronic respiratory failure with hypoxia'
code "Breathless - mild exertion (finding)": '161940008' from "SNOMEDCT" display 'Breathless - mild exertion (finding)'
code "Breathless - moderate exertion (finding)": '161939006' from "SNOMEDCT" display 'Breathless - moderate exertion (finding)'
code "Unintentional weight gain (finding)": '441361000124104' from "SNOMEDCT" display 'Unintentional weight gain (finding)'
code "Unintentional weight loss (finding)": '448765001' from "SNOMEDCT" display 'Unintentional weight loss (finding)'
code "Acute lymphadenitis of neck (disorder)": '10629031000119100' from "SNOMEDCT" display 'Acute lymphadenitis of neck (disorder)'
code "Orthopnea": 'R06.01' from "ICD10CM" display 'Orthopnea'
code "Cardiac murmur, unspecified": 'R01.1' from "ICD10CM" display 'Cardiac murmur, unspecified'
code "Varicose vein finding (finding)": '271652003' from "SNOMEDCT" display 'Varicose vein finding (finding)'


context Patient

// CQL DEFINITIONS NEEDED FOR ORDER DETAILS SECTION OF THE QUESTIONNAIRE

define "H_O_DeviceRequest":
  singleton from([DeviceRequest])

define "H_O_DeviceRequestDescription":
  'HCPCS ' + First(H_O_DeviceRequest.code.coding).code.value + ' - ' + First(H_O_DeviceRequest.code.coding).display.value

define "H_O_DeviceRequestCode":
  First(H_O_DeviceRequest.code.coding).code.value

define "H_O_DeviceRequestId":
  H_O_DeviceRequest.id.value

define H_O_OrderingPractitionerRole:

  // If DeviceRequest's requester is PractitionerRole from DataBundle.

  if(singleton from ( [PractitionerRole] PR
      where 'PractitionerRole/' + PR.id.value = H_O_DeviceRequest.requester.reference.value)) is not null
    then singleton from ( [PractitionerRole] PR
        where 'PractitionerRole/' + PR.id.value = H_O_DeviceRequest.requester.reference.value)

  // Else if DeviceRequest's requester is PractitionerRole from DeviceRequest's contained.

  else if (singleton from ( H_O_DeviceRequest.contained.PractitionerRole PR 
      where PR is not null and 'PractitionerRole/' + ReplaceMatches(PR.id.value, '#', '') = H_O_DeviceRequest.requester.reference.value)) is not null 
    then singleton from ( H_O_DeviceRequest.contained.PractitionerRole PR where PR is not null and 'PractitionerRole/' + ReplaceMatches(PR.id.value, '#', '') = H_O_DeviceRequest.requester.reference.value)
  
  else null

define H_O_OrderingPractitioner:

  // If OrderingPractitionerRole's practitioner is Practitioner from DataBundle.

  if ("H_O_OrderingPractitionerRole" is not null 
      and (singleton from ([Practitioner] P where 'Practitioner/' + P.id.value = "H_O_OrderingPractitionerRole".practitioner.reference.value) is not null )) 
    then singleton from ([Practitioner] P where 'Practitioner/' + P.id.value = "H_O_OrderingPractitionerRole".practitioner.reference.value)
  
  // If OrderingPractitionerRole's practitioner is Practitioner from DeviceRequest's contained.

  else if (singleton from ( H_O_DeviceRequest.contained.Practitioner P 
      where P is not null and 'Practitioner/' + ReplaceMatches(P.id.value, '#', '') = "H_O_OrderingPractitionerRole".practitioner.reference.value)) is not null 
    then singleton from ( H_O_DeviceRequest.contained.Practitioner P where P is not null and 'Practitioner/' + ReplaceMatches(P.id.value, '#', '') = "H_O_OrderingPractitionerRole".practitioner.reference.value)
  
  // If DeviceRequest's requester is Practitioner from DataBundle.
  
  else if (singleton from ([Practitioner] P
      where 'Practitioner/' + P.id.value = H_O_DeviceRequest.requester.reference.value)) is not null
    then singleton from ( [Practitioner] P
      where 'Practitioner/' + P.id.value = H_O_DeviceRequest.requester.reference.value)

  // If DeviceRequest's requester is Practitioner from from DeviceRequest's contained.

  else if (singleton from ( H_O_DeviceRequest.contained.Practitioner P 
      where P is not null and 'Practitioner/' + ReplaceMatches(P.id.value, '#', '') = H_O_DeviceRequest.requester.reference.value)) is not null 
    then singleton from ( H_O_DeviceRequest.contained.Practitioner P where P is not null and 'Practitioner/' + ReplaceMatches(P.id.value, '#', '') = H_O_DeviceRequest.requester.reference.value)
  
  else null

define H_O_OrderingPractitionerNPI:
  if((First("H_O_OrderingPractitioner".identifier identifier
        where identifier.system.value = 'http://hl7.org/fhir/sid/us-npi')).value.value) is not null 
    then (First("H_O_OrderingPractitioner".identifier identifier
        where identifier.system.value = 'http://hl7.org/fhir/sid/us-npi')).value.value
  else null

// START OF CQL DEFINITIONS NEEDED FOR PRIMARY DETAILS SECTION OF THE QUESTIONNAIRE

define "H_O_Encounter":
  singleton from([Encounter] E
        where 'Encounter/' + E.id.value = (H_O_DeviceRequest.encounter).reference.value)

define H_O_Encounter_InpatientStay:
  if ("H_O_Encounter" E where E.class ~ "inpatient encounter") is not null then true
  else false

//----------------- Start of definitions regarding O2, Hematocrit, PaO2 are the readings of oxygen taken during BLOOD GAS STUDY.-------------------

define "BloodGasStudyProcedureResource":
  First([Procedure] P
      where P.status.value = 'completed'
        and("ToCode"(First(P.code.coding)) = "Blood gas analysis (procedure)"
            or "ToCode"(First(P.code.coding)) = "Blood gas measurement (procedure)")
      sort by end of "Normalize Interval"(performed) desc
  )

define "ExistsBloodGasStudy":
  if "BloodGasStudyProcedureResource" is not null
    then true
  else false

define "BloodGasStudyDate":
  if "BloodGasStudyProcedureResource" is not null
    then start of "Normalize Interval"("BloodGasStudyProcedureResource".performed)
  else null

define "BloodGasStudyLocation":
  if (("BloodGasStudyProcedureResource" is not null) and (singleton from ( [Location] L
        where 'Location/' + L.id.value = BloodGasStudyProcedureResource.location.reference.value) is not null))
    then (singleton from ( [Location] L
        where 'Location/' + L.id.value = BloodGasStudyProcedureResource.location.reference.value)).name
  else null

define BloodGasStudyO2SatResource:
  if (GetObservationFromDiagnosticReportInProcedure(BloodGasStudyProcedureResource, "Oxygen saturation in Arterial blood")) is not null
      then GetObservationFromDiagnosticReportInProcedure(BloodGasStudyProcedureResource, "Oxygen saturation in Arterial blood")
  else if (GetObservationFromSameDayAsProcedure(BloodGasStudyProcedureResource, "Oxygen saturation in Arterial blood")) is not null
      then GetObservationFromSameDayAsProcedure(BloodGasStudyProcedureResource, "Oxygen saturation in Arterial blood")
  else null

define BloodGasStudyO2Sat:
  FHIRHelpers.ToQuantity ( "BloodGasStudyO2SatResource".value )

define BloodGasStudyPaO2Resource:
  if (GetObservationFromDiagnosticReportInProcedure(BloodGasStudyProcedureResource, "Oxygen [Partial pressure] in Arterial blood")) is not null
      then GetObservationFromDiagnosticReportInProcedure(BloodGasStudyProcedureResource, "Oxygen [Partial pressure] in Arterial blood")
  else if (GetObservationFromSameDayAsProcedure(BloodGasStudyProcedureResource, "Oxygen [Partial pressure] in Arterial blood")) is not null
      then GetObservationFromSameDayAsProcedure(BloodGasStudyProcedureResource, "Oxygen [Partial pressure] in Arterial blood")
  else null

define BloodGasStudyPaO2:
  FHIRHelpers.ToQuantity ( "BloodGasStudyPaO2Resource".value )

define BloodGasStudyHematocritResource:
  if (GetObservationFromDiagnosticReportInProcedure(BloodGasStudyProcedureResource, "Hematocrit [Volume Fraction] of Arterial blood")) is not null
      then GetObservationFromDiagnosticReportInProcedure(BloodGasStudyProcedureResource, "Hematocrit [Volume Fraction] of Arterial blood")
  else if (GetObservationFromSameDayAsProcedure(BloodGasStudyProcedureResource, "Hematocrit [Volume Fraction] of Arterial blood")) is not null
      then GetObservationFromSameDayAsProcedure(BloodGasStudyProcedureResource, "Hematocrit [Volume Fraction] of Arterial blood")
  else null

define BloodGasStudyHematocrit:
  FHIRHelpers.ToQuantity ( "BloodGasStudyHematocritResource".value )

define ImprovementWithTherapy:
  if "NocturnalO2SatWithO2AtRest".value > 89 then true
  else if "NocturnalPO2WithOxygen".value > 89 then true 
  else false

//----------------- END of definitions regarding O2, Hematocrit, PaO2 are the readings of oxygen taken during BLOOD GAS STUDY.-------------------


define PatientMobileResource:
  First( [Observation] Obs
      where "ToCode"(First(Obs.code.coding)) = "Walks indoors - usual functional ability during assessment period [CMS Assessment]"
      and Obs.value = true
  )

define PatientMobile:
  if "PatientMobileResource" is not null
  then true
  else false

// END OF CQL DEFINITIONS NEEDED FOR PRIMARY DETAILS SECTION OF THE QUESTIONNAIRE

//--------------------------------------------------------------------------------

// START OF CQL DEFINITIONS NEEDED FOR SYMPTOMS AND DIAGNOSTIC TESTING

define TravelToHigherElevation:
  exists ( [Observation] Obs
      where Obs.status.value = 'final'
        and ( "ToCode"(First(Obs.code.coding)) = "High altitude residence"
            or "ToCode"(First(Obs.code.coding)) = "Effects of high altitude (disorder)"
            or "ToCode"(First(Obs.code.coding)) = "Accidents due to residence or prolonged visit at high altitude (event)"
            or "ToCode"(First(Obs.code.coding)) = "Periodic breathing of sleep at high altitude (finding)"
        )
        and start of "Normalize Interval"(Obs.effective) less than 2 months before start of "H_O_Encounter".period
  )

define HbConcentration:
  ( [Observation] Obs
    where "ToCode"(First(Obs.code.coding)) = "Hemoglobin [Mass/volume] in Blood"
      and start of "Normalize Interval"(Obs.effective) in Interval["BloodGasStudyDate" - 2 days, "BloodGasStudyDate" + 2 days]) FinalObs
    return FHIRHelpers.ToQuantity ( FinalObs.value )

define OxygenCarryingCapacity:
  if ( First("HbConcentration".unit) = 'g/dL' ) then 1.34 * ( First("HbConcentration".value) ) 
    else null

define "O2CarryingCapacity":
  if ( "OxygenCarryingCapacity" < 20.1 ) then true 
    else if ("OxygenCarryingCapacity" > 20.1) then false
    else null

define SignsOfPigmentation:
  Last([Observation] Obs
      where Obs.status.value = 'final'
        and ("ToCode"(First(Obs.code.coding)) = "Pigmentation of skin or mucosa (finding)")
        and start of "Normalize Interval"(Obs.effective) after start of "H_O_Encounter".period)

define SkinPigmentation:
  if ("SignsOfPigmentation".value = true)
  then true
  else if ("SignsOfPigmentation".value = false)
  then false
  else null

define IsABGPOInaccuracy:
  TravelToHigherElevation or O2CarryingCapacity or SkinPigmentation

define ABGPOInaccuracyReason:
  {
    (if TravelToHigherElevation then 'highaltitude' else ''),
    (if O2CarryingCapacity then 'o2capacity' else ''),
    (if SkinPigmentation then 'Skin pigmentation' else '')
  }

define HypoxemiaConditionResource:
  First( [Condition] Cond
      where exists ( Cond.code.coding C
          where C in "Hypoxemia")
          and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed')

define HypoxemiaSymptoms:
  if "HypoxemiaConditionResource" is not null
  then true
  else if ("ArterialO2SatAtRest".value < 89) or ("ArterialPO2AtRest".value < 56) then true
  else if ("NocturnalO2SatAtRest".value < 89) or ("NocturnalPO2AtRest".value < 56) then true
  else if ("ArterialO2SatDuringExercise".value < 89) or ("ArterialPO2DuringExercise".value < 56) then true
  else false

define ExertionalHypoxiaResource:
  First( [Condition] Cond
      where ("ToCode"(First(Cond.code.coding)) = "Dyspnea on exertion (finding)"
      or "ToCode"(First(Cond.code.coding)) = "Breathless - moderate exertion (finding)"
      or "ToCode"(First(Cond.code.coding)) = "Breathless - mild exertion (finding)")
       and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed')

define PresenceOfExertionalHypoxia:
  if "ExertionalHypoxiaResource" is not null then true
  else false

define NocturnalSymptomsResource:
  First ( [Observation] Obs
      where ("ToCode"(First(Obs.code.coding)) = "I tossed and turned at night in past 7 days [PROMIS]"
        or "ToCode"(First(Obs.code.coding)) = "Restlessness and agitation"
        or "ToCode"(First(Obs.code.coding)) = "Morning headache (finding)")
        and Obs.value = true)

define PresenceOfNocturnalSymptoms:
  if "NocturnalSymptomsResource" is not null then true
  else false

define NocturnalSymptomsAnswer:
  { 
    ( if ( "ToCode"(First("NocturnalSymptomsResource".code.coding)) = "Morning headache (finding)" ) then 'Morning headache' 
      else ''
    ), ( if ( "ToCode"(First("NocturnalSymptomsResource".code.coding)) = "Restlessness and agitation" ) then 'Nocturnal restlessness' 
      else ''
    ), ( if ( "ToCode"(First("NocturnalSymptomsResource".code.coding)) = "I tossed and turned at night in past 7 days [PROMIS]" ) then 'Insomnia' 
      else ''
    )
  }

define OSA:
  First ( [Condition] Cond
      where exists ( Cond.code.coding C
                      where C in "Obstructive Sleep Apnea (ICD10CM)")
          and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed')
  
define PresenceOfOSA:
  if "OSA" is not null then true
  else false

define PAPResource:
    First( [Procedure] Proc
      where "ToCode"(First(Proc.code.coding)) = "Nocturnal continuous positive airway pressure (regime/therapy)"   
      and Proc.status.value = 'in-progress'   
  )      

define PresenceOfPAP:
    "PAPResource" is not null

// END OF CQL DEFINITIONS NEEDED FOR SYMPTOMS AND DIAGNOSTIC TESTING

//--------------------------------------------------------------------------------

// START OF CQL DEFINITIONS NEEDED FOR RELEVANT PATIENT OBSERVATIONS

//----------------- The below definitions regarding O2 and PaO2 are the readings of oxygen taken during PulseOximetry( Arterial & Nocturnal).-------------------

//----------------- Start of definitions regarding O2 and PaO2 are the readings of oxygen taken during PulseOximetry( Arterial ).-------------------

define PulseOximetry:
  First([Procedure] Proc
      where "ToCode"(First(Proc.code.coding)) = "Pulse oximetry (procedure)"
      and Proc.status.value = 'completed'
      sort by end of "Normalize Interval"(performed) desc)

define ExistsPulseOximetry:
  if "PulseOximetry" is not null
    then true
  else false

define ArterialPulseOximetryDate:
  start of "Normalize Interval"("PulseOximetry".performed)

// Arterial O2 Saturation at Rest

define ArterialO2SatObservationResource:
  First([Observation] Obs
      where "ToCode"(First(Obs.code.coding)) = "Oxygen saturation in Arterial blood by Pulse oximetry --resting"
          and Obs.component is null
          and (start of "Normalize Interval"(Obs.effective) same day as "ArterialPulseOximetryDate"))

define ArterialO2SatAtRest:
  FHIRHelpers.ToQuantity ( "ArterialO2SatObservationResource".value )

// Arterial PaO2 Saturation at Rest

define ArterialPO2ObservationResource:
  First([Observation] Obs
      where "ToCode"(First(Obs.code.coding)) = "Oxygen [Partial pressure] in Arterial blood"
          and Obs.component is null
          and (start of "Normalize Interval"(Obs.effective) same day as "ArterialPulseOximetryDate")
  )

define ArterialPO2AtRest:
  FHIRHelpers.ToQuantity ( "ArterialPO2ObservationResource".value )

// Arterial O2 Sat During Excercise

define ArterialO2SatDuringExerciseObservationResource:
  First([Observation] Obs
      where "ToCode"(First(Obs.code.coding)) = "Oxygen saturation in Arterial blood by Pulse oximetry --W exercise"
          and Obs.component is null
          and (start of "Normalize Interval"(Obs.effective) same day as "ArterialPulseOximetryDate")
  )

define ArterialO2SatDuringExercise:
  FHIRHelpers.ToQuantity ( "ArterialO2SatDuringExerciseObservationResource".value )

// Arterial PaO2 During Excercise

define ArterialPO2DuringExerciseObservationResource:
  First([Observation] Obs
      where "ToCode"(First(Obs.code.coding)) = "Oxygen [Partial pressure] adjusted to patient's actual temperature in Arterial blood"
          and Obs.component is null      
          and (start of "Normalize Interval"(Obs.effective) same day as "ArterialPulseOximetryDate")
  )

define ArterialPO2DuringExercise:
  FHIRHelpers.ToQuantity ( "ArterialPO2DuringExerciseObservationResource".value )

// Arterial O2 Sat During Excercise with Oxygen

define ArterialO2SatWithO2DuringExcerciseObservationResource:
  First([Observation] Obs
      where "ToCode"(First(Obs.code.coding)) = "Oxygen saturation in Arterial blood by Pulse oximetry --W exercise"
        and "ToCode"(First(First(Obs.component).code.coding)) = "Use of supplemental oxygen"
        and (start of "Normalize Interval"(Obs.effective) same day as "ArterialPulseOximetryDate")
  )

define ArterialO2SatWithO2DuringExcercise:
  FHIRHelpers.ToQuantity ( "ArterialO2SatWithO2DuringExcerciseObservationResource".value )

// Arterial PaO2 During Excercise with Oxygen

define ArterialPO2DuringExerciseWithO2ObservationResource:
  First([Observation] Obs
      where "ToCode"(First(Obs.code.coding)) = "Oxygen [Partial pressure] adjusted to patient's actual temperature in Arterial blood"
        and "ToCode"(First(First(Obs.component).code.coding)) = "Use of supplemental oxygen"
        and (start of "Normalize Interval"(Obs.effective) same day as "ArterialPulseOximetryDate")
  )

define ArterialPO2DuringExerciseWithO2:
    FHIRHelpers.ToQuantity ( "ArterialPO2DuringExerciseWithO2ObservationResource".value )

//----------------- End of definitions regarding O2 and PaO2 are the readings of oxygen taken during PulseOximetry( Arterial ).-------------------

define OvernightOximetry:
  First([Procedure]Proc
    where "ToCode"(First(Proc.code.coding)) = "Overnight pulse oximetry (procedure)"
    and Proc.status.value = 'completed')

define OvernightOximetryDate:
    start of "Normalize Interval"("OvernightOximetry".performed)

define TitrationPolysomnographyResource:
  First([Procedure] Proc 
          where "ToCode"(First(Proc.code.coding)) = "Nocturnal continuous positive airway pressure (regime/therapy)")

define NocturnalRestlessnessStudy:
{ 
   (if "OvernightOximetry" is not null 
          then 'Nocturnal oximetry'else ''),
   (if "TitrationPolysomnographyResource" is not null
          then 'Titration Polysomnography' else '')
}

//----------------- Start of definitions regarding O2 and PaO2 are the readings of oxygen taken during PulseOximetry( Nocturnal ).-------------------

// Nocturnal O2 Saturation at Rest

define NocturnalO2SatObservationResource:
  First([Observation] Obs
      where "ToCode"(First(Obs.code.coding)) = "Oxygen saturation in Arterial blood by Pulse oximetry --resting"
        and Obs.component is null
        and (start of "Normalize Interval"(Obs.effective) same day as "OvernightOximetryDate")
  )

define NocturnalO2SatAtRest:
  FHIRHelpers.ToQuantity ( "NocturnalO2SatObservationResource".value )

// Nocturnal PaO2 at Rest

define NocturnalPO2ObservationResource:
  First([Observation] Obs
      where "ToCode"(First(Obs.code.coding)) = "Oxygen [Partial pressure] in Arterial blood"
        and Obs.component is null
        and (start of "Normalize Interval"(Obs.effective) same day as "OvernightOximetryDate")
  )

define NocturnalPO2AtRest:
  FHIRHelpers.ToQuantity ( "NocturnalPO2ObservationResource".value )

// Nocturnal O2 Sat at Rest With Oxygen

define NocturnalO2SatWithO2AtRestObservationResource:
  First([Observation] Obs
      where "ToCode"(First(Obs.code.coding)) = "Oxygen saturation in Arterial blood by Pulse oximetry --resting"
        and (start of "Normalize Interval"(Obs.effective) same day as "OvernightOximetryDate")
      and "ToCode"(First(First(Obs.component).code.coding)) = "Use of supplemental oxygen"
  )

define NocturnalO2SatWithO2AtRest:
  FHIRHelpers.ToQuantity ( "NocturnalO2SatWithO2AtRestObservationResource".value )

// Nocturnal PO2 at Rest With Oxygen

define NocturnalPO2WithOxygenObservationResource:
  First([Observation] Obs
      where "ToCode"(First(Obs.code.coding)) = "Oxygen [Partial pressure] in Arterial blood"
        and (start of "Normalize Interval"(Obs.effective) same day as "OvernightOximetryDate")
      and "ToCode"(First(First(Obs.component).code.coding)) = "Use of supplemental oxygen"
  )

define NocturnalPO2WithOxygen:
  FHIRHelpers.ToQuantity ( "NocturnalPO2WithOxygenObservationResource".value )


define BloodGasStudyTestedLPM:
  if ArterialO2SatWithO2DuringExcerciseObservationResource is not null then FHIRHelpers.ToQuantity (First(ArterialO2SatWithO2DuringExcerciseObservationResource.component).value).value
  else if ArterialPO2DuringExerciseWithO2ObservationResource is not null then FHIRHelpers.ToQuantity (First(ArterialPO2DuringExerciseWithO2ObservationResource.component).value).value
  else if NocturnalO2SatWithO2AtRestObservationResource is not null then FHIRHelpers.ToQuantity (First(NocturnalO2SatWithO2AtRestObservationResource.component).value).value
  else if NocturnalPO2WithOxygenObservationResource is not null then FHIRHelpers.ToQuantity (First(NocturnalPO2WithOxygenObservationResource.component).value).value
  else null

define BloodGasStudyAt4LPMOrHigher:
  if BloodGasStudyTestedLPM >= 4.0 then true else false

//----------------- End of definitions regarding O2 and PaO2 are the readings of oxygen taken during PulseOximetry( Nocturnal ).-------------------

// END OF CQL DEFINITIONS NEEDED FOR RELEVANT PATIENT OBSERVATIONS

//--------------------------------------------------------------------------------

// START OF CQL DEFINITIONS NEEDED FOR DIAGNOSIS

define COPDResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Chronic Obstructive Lung Disease (COPD) ICD10CM"
          and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define BronchiectasisResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Bronchiectasis"
          and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define HypoxemiaResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Hypoxemia"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define ChronicrespiratoryFailureHypoxiaResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Chronic respiratory failure with hypoxia"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define DiffuseInterstitialLungDiseaseResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Interstitial lung disease"
          and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define "CysticFibrosisResource":
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Cystic Fibrosis"
          and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define PulmonaryNeoplasmResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Malignant Neoplasm of Respiratory and Intrathoracic Organs"
          and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define FamilialErythrocythemiaResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Familial erythrocytosis"
          and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define ErythrocythemiaResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Secondary Erythrocytosis Disorder"
          and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define ClusterHeadachesResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Cluster Headache"
          and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define PulmonaryHypertension:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Cor pulmonale (chronic)"
          and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define DependentEdemaResource:
  First ( [Condition] Cond
      where ("ToCode"(First(Cond.code.coding)) in "Acute or Chronic Heart Failure Disorder ICD10CM"
          or "ToCode"(First(Cond.code.coding)) in "Acute Pulmonary Edema")
          and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define RecurringCHFCorPulmonaleResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Congestive heart failure (disorder)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define PrimaryDiagnosis:
  {
    if "COPDResource" is not null
    then 'COPD' else null,  
    // Missing Code for Heart Failure
    // Missing Code for COVID-19
    if "HypoxemiaResource" is not null
    then 'Hypoxemia' else null,
    if "OSA" is not null
    then 'Obstructive sleep apnea' else null,
    if "ChronicrespiratoryFailureHypoxiaResource" is not null
    then 'Chronic respiratory failure with hypoxia' else null,
    // if "BronchiectasisResource" is not null
    // then 'Bronchiectasis' else null,
    // Missing Acute respiratory failure with hypoxia
    if "DiffuseInterstitialLungDiseaseResource" is not null
    then 'Interstitial pulmonary disease' else null,
    /*
    Missing Asthma and Pneumonia
    if "CysticFibrosisResource" is not null
    then 'Cystic Fibrosis' else null,
    if "PulmonaryNeoplasmResource" is not null
    then 'Pulmonary neoplasm' else null,
    */
    if "FamilialErythrocythemiaResource" is not null or "ErythrocythemiaResource" is not null
    then 'Erythrocythemia' else null,
    if "ClusterHeadachesResource" is not null
    then 'Cluster headaches' else null,
    if "PulmonaryHypertension" is not null
    then 'Pulmonary hypertension' else null,
    if "DependentEdemaResource" is not null
    then 'Dependent edema suggesting congestive heart failure' else null,
    if "RecurringCHFCorPulmonaleResource" is not null
    then 'Cor Pulmonale' else null
  }

define SecondaryToCORPulmonale:
  if exists ( [Observation] Obs
      where "ToCode"(First(Obs.code.coding)) = "Pulmonary artery pressure monitoring (regime/therapy)"
      and Obs.status.value = 'final') 
    then 'Pulmonary artery pressure monitoring (regime/therapy)' 
  else if exists ( [Observation] Obs
      where "ToCode"(First(Obs.code.coding)) = "Cardiac blood pool imaging, gated equilibrium"
      and Obs.status.value = 'final')
    then 'Gated blood pool scan' 
  else if exists ( [Observation] Obs
      where "ToCode"(First(Obs.code.coding)) = "P pulmonale by electrocardiogram"
      and Obs.status.value = 'final')
    then '“p” Pulmonale on EKG'
  else ''

define HematocritResultResource:
  First([Observation] Obs
      where "ToCode"(First(Obs.code.coding)) = "Hematocrit/Hemoglobin [Ratio] of Blood by Automated count"
  )

define HematocritResult:
  "HematocritResultResource".value

define AnginaPectorisResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Angina pectoris, unspecified"
          and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
      )

define DyspneaResource:
  First([Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Dyspnea"
          and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed')

define PeripheralVascularDiseaseResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Peripheral vascular disease (disorder)"
          and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
      )

define TerminalIllnessResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Limited Life Expectancy"
          and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
    )

define Group4Criteria:
  if "AnginaPectorisResource" is not null
    then 'Angina pectoris' 
    else if "DyspneaResource" is not null
    then 'Dyspnea' 
    else if "PeripheralVascularDiseaseResource" is not null
    then 'Peripheral Vascular Disease' 
    else if "TerminalIllnessResource" is not null
    then 'Terminal Illness'
    else ''

// END OF CQL DEFINITIONS NEEDED FOR DIAGNOSIS

//--------------------------------------------------------------------------------

// START OF CQL DEFINITIONS NEEDED FOR MEDICAL HISTORY

define WeightGainResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Unintentional weight gain (finding)"
        and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define WeightLossResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Unintentional weight loss (finding)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define SleepingProblemsResource:
  First( [Observation] Obs
      where "ToCode"(First(Obs.code.coding)) in "Poor Sleep Hygeine or Sleep Challenges"
      and Obs.status.value = 'final'
  )

define FatigueResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Fatigue"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define FeverResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Fever (ICD10CM)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define ChillsResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Chills (ICD10CM)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define NightSweatsResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Night Sweats (SNOMED)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define "GeneralSymptoms":
  if "WeightGainResource" is not null 
  then 'weight gain' 
    else if "WeightLossResource" is not null
  then 'weight loss' 
    else if "SleepingProblemsResource" is not null
  then 'sleeping problems' 
    else if "FatigueResource" is not null
  then 'fatigue' 
    else if "FeverResource" is not null
  then 'fever' 
    else if "ChillsResource" is not null
  then 'chills' 
    else if "NightSweatsResource" is not null 
  then 'night sweats / diaphoresi' 
    else 'None'

define PainOnNeckMovementResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Spine or Neck Disorder"
  )

define LumpsResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Acute lymphadenitis of neck (disorder)"
  )

define NeckConditions:
  if "PainOnNeckMovementResource" is not null 
  then 'pain on neck movement' 
  else if "LumpsResource" is not null 
  then 'lumps' 
  else 'None'

define CoughResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Cough (ICD10CM)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define ShortnessOfBreathResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Difficulty Breathing (ICD10CM)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define ChestPainICDResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Chest Pain (ICD10CM)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define WheezingResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Wheezing"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define HemoptysisResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Hemoptysis (ICD10CM)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define SputumProductionResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Sputum (Specimen Type) (SNOMED)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )   

define PulmonaryConditions:
  if "CoughResource" is not null
  then 'cough' 
  else if "ShortnessOfBreathResource" is not null 
  then 'shortness of breath' 
  else if "ChestPainICDResource" is not null 
  then 'pain' 
  else if "WheezingResource" is not null
  then 'wheezing' 
  else if "HemoptysisResource" is not null
  then 'hemoptysis' 
  else if "SputumProductionResource" is not null
  then 'sputum production' 
  else 'None'

define ChestPainResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Chest Pain"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define PalpitationsResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Heart Palpitations"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define OrthopneaResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Orthopnea"
        and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define MurmurResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Cardiac murmur, unspecified"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define SyncopeResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Syncope"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define EdemaResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Edema"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define ClaudicationResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Claudication"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define VaricodeVeinsResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Varicose vein finding (finding)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define ThrombophlebitisResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Phlebitis and Thrombophlebitis of the Veins of lower extremity"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define UlcersResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Acute Peptic Ulcer"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define CardiacConditions:
  if "ChestPainResource" is not null 
  then 'chest pain' 
  else if "PalpitationsResource" is not null
  then 'palpitations' 
  else if "OrthopneaResource" is not null
  then 'orthopnea' 
  else if "MurmurResource" is not null
  then 'murmur' 
  else if "SyncopeResource" is not null 
  then 'syncope' 
  else if "EdemaResource" is not null
  then 'edema' 
  else if "ClaudicationResource" is not null
  then 'claudication' 
  else if "VaricodeVeinsResource" is not null
  then 'varicose veins' 
  else if "ThrombophlebitisResource" is not null
  then 'thrombophlebitis' 
  else if "UlcersResource" is not null
  then 'ulcers'
    else 'None'

define AnemiaResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Anemia Conditions"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define BruisingResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Bruising symptom (finding)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define BleedingDisorderResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Bleeding Disorder"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define HematologyConditions:
  if "AnemiaResource" is not null 
  then 'anemia' 
  else if "BruisingResource" is not null
  then 'bruising' 
  else if "BleedingDisorderResource" is not null
  then 'bleeding disorders (conditional)' 
    else 'None'

define DiabetesResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Diabetes"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define GoiterResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Goiter (disorder)"
        and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define LipidDisordersResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Lipids abnormal"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define EndocrineConditions:
  if "DiabetesResource" is not null 
  then 'diabetes' 
  else if "GoiterResource" is not null
  then 'goiter' 
  else if "LipidDisordersResource" is not null
  then 'lipid disorders' 
    else 'None'

define HallucinationsResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Hallucinations, unspecified"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define DelusionsResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Delusional disorders"
        and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define AnxietyResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Anxiety"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define NervousBreakdownResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Other specified nonpsychotic mental disorders"
        and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define MoodChangesResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Mood disorder (disorder)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define PsychiatricConditions:
  if "HallucinationsResource" is not null
  then 'hallucinations' 
  else if "DelusionsResource" is not null 
  then 'delusions' 
  else if "AnxietyResource" is not null
  then 'anxiety' 
  else if "NervousBreakdownResource" is not null 
  then 'nervous breakdown' 
    else if "MoodChangesResource" is not null 
  then 'mood changes' 
    else 'None'

define SeizuresResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Seizure"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define PoorMemoryResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Short Term Memory Deficits"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define PoorConcentrationResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Difficulty Concentrating"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define NumbnessAndTinglingResource:
  First( [Condition] Cond
      where ("ToCode"(First(Cond.code.coding)) = "Numbness (finding)"
        or "ToCode"(First(Cond.code.coding)) = "Numbness and tingling sensation of skin (finding)")
        and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define PinsAndNeedlesSensationResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Pins and needles (finding)"
        and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define HyperpathiaResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Other disturbances of skin sensation"
        and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define DysesthesiaResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Dysesthesia (finding)"
        and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define WeaknessResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Weakness"
        and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define ParalysisResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Spinal Cord Injury or Paralysis Disorder"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define TremorsResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Essential tremor"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define InvoluntaryMovementsResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Involuntary movement symptom (finding)"
        and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define UnstableGaitResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Abnormality of Gait and Mobility"
        and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define FallResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Fall Risk"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define VertigoResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Vertigo"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define HeadacheResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Headache"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define StrokeResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Stroke"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define SpeechDisorders:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Speech disturbances, not elsewhere classified"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define NeurologicalConditions:
  if "SeizuresResource" is not null  
  then 'seizures' 
  else if "PoorMemoryResource" is not null 
  then 'poor memory' 
  else if "PoorConcentrationResource" is not null
  then 'poor concentration' 
  else if "NumbnessAndTinglingResource" is not null 
  then 'numbness / tingling' 
  else if "PinsAndNeedlesSensationResource" is not null 
  then 'pins and needles sensation' 
  else if "HyperpathiaResource" is not null 
  then 'hyperpathia' 
  else if "DysesthesiaResource" is not null
  then 'dysesthesia' 
  else if "WeaknessResource" is not null
  then 'weakness' 
  else if "ParalysisResource" is not null
  then 'paralysis' 
  else if "TremorsResource" is not null 
  then 'tremors' 
  else if "InvoluntaryMovementsResource" is not null
  then 'involuntary movements' 
  else if "UnstableGaitResource" is not null
  then 'unstable gait' 
  else if "FallResource" is not null
  then 'fall' 
  else if "VertigoResource" is not null
  then 'vertigo' 
  else if "HeadacheResource" is not null
  then 'headache' 
  else if "StrokeResource" is not null
  then 'stroke' 
  else if "SpeechDisorders" is not null
  then 'speech disorders' 
  else 'None'

define PainResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Pain"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define SwellingResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Swelling (finding)"
        and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define StiffnessResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Stiff neck (SNOMED)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define LimitationOfROMResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Functional limitation in range of motion during assessment period [CMS Assessment]"
        and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define ArthritisResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Arthritis Disorders"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define GoutResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Gout"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define CrampsResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Abdominal Cramps (SNOMED)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define MyalgiaResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Myalgia (ICD10CM)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define FasciculationResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Fasciculation"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define AtrophyResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Multiple System Atrophy (SNOMED)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define FractureResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "HEDIS Fractures Value Set ICD10CM"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define DeformityResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Osteopathies chondropathies and acquired musculoskeletal deformities"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define MuscleWeaknessResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Muscle weakness (ICD10CM)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define MusculoskeletalConditions:
  if "PainResource" is not null 
  then 'pain' 
  else if "SwellingResource" is not null
  then 'swelling' 
  else if "StiffnessResource" is not null
  then 'stiffness' 
  else if "LimitationOfROMResource" is not null
  then 'limitation of range of motion' 
  else if "ArthritisResource" is not null
  then 'arthritis' 
  else if "GoutResource" is not null
  then 'gout' 
  else if "CrampsResource" is not null
  then 'cramps' 
  else if "MyalgiaResource" is not null
  then 'myalgia' 
  else if "FasciculationResource" is not null
  then 'fasciculation' 
  else if "AtrophyResource" is not null
  then 'atrophy' 
  else if "FractureResource" is not null
  then 'fracture' 
  else if "DeformityResource" is not null
  then 'deformity' 
  else if "MuscleWeaknessResource" is not null
  then 'weakness' 
    else 'None'

define SwallowingProblemsResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Dysphagia (SNOMED)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define AbdominalPainResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Abdominal Pain (ICD10CM)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define ConstipationResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Constipation"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define DiarrheaResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Diarrhea"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define IncontinenceResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Urinary Incontinence"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define NauseaResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Nausea (ICD10CM)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define VomitingResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Vomiting"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define UlcerResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Acute Peptic Ulcer"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define MelenaResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Melena"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define RectalBleedingResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Hemorrhage of anus and rectum"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define HeartburnResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Heartburn"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )   

define JaundiceResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Jaundice"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define HematemesisResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Hematemesis [Unspecified Cause] (ICD10CM)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define GastrointestinalConditions:
  if "SwallowingProblemsResource" is not null
  then 'swallowing problems' 
  else if "AbdominalPainResource" is not null
  then 'abdominal pain' 
  else if "ConstipationResource" is not null
  then 'constipation' 
  else if "DiarrheaResource" is not null
  then 'diarrhea' 
  else if "IncontinenceResource" is not null
  then 'incontinence' 
  else if "NauseaResource" is not null
  then 'nausea' 
  else if "VomitingResource" is not null
  then 'vomiting' 
  else if "UlcerResource" is not null
  then 'ulcers' 
  else if "MelenaResource" is not null
  then 'melena' 
  else if "RectalBleedingResource" is not null
  then 'rectal bleeding' 
  else if "HeartburnResource" is not null
  then 'heartburn' 
  else if "JaundiceResource" is not null
  then 'jaundice' 
  else if "HematemesisResource" is not null
  then 'hematemesis' 
  else 'None'

define AcneResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Acne"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define AtopicDermatitisResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Atopic Dermatitis"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define CellulitisResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Cellulitis"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define VitiligoResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Vitiligo (disorder)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define IntegumentalConditions:
  if "AcneResource" is not null 
  then 'Acne' 
  else if "AtopicDermatitisResource" is not null
  then 'Atopic Dermatitis' 
  else if "CellulitisResource" is not null
  then 'Cellulitis' 
  else if "VitiligoResource" is not null
  then 'Vitiligo' 
  else 'None'

define RheumatoidArthritisResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Rheumatoid Arthritis"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define MultipleSclerosisResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Multiple Sclerosis"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  ) 

define CeliacDiseaseResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) in "Celiac disease (ICD10)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define InflammatoryBowelDiseaseResource:
  First( [Condition] Cond
      where "ToCode"(First(Cond.code.coding)) = "Inflammatory bowel disease (disorder)"
      and First(Cond.clinicalStatus.coding).code.value = 'active'
          and First(Cond.verificationStatus.coding).code.value = 'confirmed'
  )

define ImmunologicalConditions:
  if "RheumatoidArthritisResource" is not null
  then 'Rheumatoid Arthritis' 
  else if "MultipleSclerosisResource" is not null
  then 'Multiple Sclerosis' 
  else if "CeliacDiseaseResource" is not null
  then 'Celiac disease' 
  else if "InflammatoryBowelDiseaseResource" is not null
  then 'Inflammatory bowel disease' 
  else 'None'

define ConditionsOfSystems:
  { ( if ( "GeneralSymptoms" != 'None' ) then 'General' 
      else ''
  ), ( if ( "NeckConditions" != 'None' ) then 'HEENT' 
      else ''
  ), ( if ( "PulmonaryConditions" != 'None' ) then 'Pulmonary System' 
      else ''
  ), ( if ( "CardiacConditions" != 'None' ) then 'Cardio Vascular System' 
      else ''
  ), ( if ( "IntegumentalConditions" != 'None' ) then 'Integumental System' 
      else ''
  ), ( if ( "GastrointestinalConditions" != 'None' ) then 'Gastrointestinal System' 
      else ''
  ), ( if ( "MusculoskeletalConditions" != 'None' ) then 'Musculoskeletal System' 
      else ''
  ), ( if ( "NeurologicalConditions" != 'None' ) then 'Neurological System' 
      else ''
  ), ( if ( "PsychiatricConditions" != 'None' ) then 'Psychiatric Conditions' 
      else ''
  ), ( if ( "HematologyConditions" != 'None' ) then 'Hematology' 
      else ''
  ), ( if ( "ImmunologicalConditions" != 'None' ) then 'Immunology' 
      else ''
  ), ( if ( "EndocrineConditions" != 'None' ) then 'Endocrine System' 
      else ''
  ) }

// END OF CQL DEFINITIONS NEEDED FOR MEDICAL HISTORY

//--------------------------------------------------------------------------------

// START OF CQL DEFINITIONS NEEDED FOR PRESCRIBED USE

/* Unused for now
define OxygenAccessoryList:
	(H_O_DeviceRequest D 
		where exists(D.code.coding C
						where C in "Home Oxygen Therapy Accessory"))

define TargetSaturation:
	(H_O_DeviceRequest.parameter D
		where exists(D.code.coding C
			where "ToCode"(C) = "Oxygen saturation in Arterial blood by Pulse oximetry --on room air"))E
	return FHIRHelpers.ToQuantity(E.value)


define "Hematocrit_lab_test_Codes":
  { '20570-8', '31100-1', '32354-3', '41654-5', '41655-2', '4544-3', '4545-0', '71829-6', '71830-4', '71832-0', '71833-8' }

define HematocritThatIsGreaterThanThreshold:
  FHIRHelpers.ToQuantity ( singleton from ( [Observation] Obs
      where First(Obs.code.coding).code.value in "Hematocrit_lab_test_Codes"
  ).value ).value

define PatientHasHematocritThatIsGreaterThanThreshold:
  if ( "HematocritThatIsGreaterThanThreshold" > 56 ) then true 
    else false

define InhaledFlowRateResource:
  First([Observation] P
      where "ToCode"(First(P.code.coding)) = "Inhaled oxygen flow rate"
  )

define InhaledFlowRate:
  FHIRHelpers.ToQuantity ( "InhaledFlowRateResource".value )

define NocturnalOxygenFlowRateResource:
	First([Observation] P
      where "ToCode"(First(P.code.coding)) = "Inhaled oxygen flow rate"
	  	and "ToCode"(First(P.method.coding)) = "Overnight pulse oximetry (procedure)"
  )

define NocturnalOxygenFlowRate:
	FHIRHelpers.ToQuantity ( "NocturnalOxygenFlowRateResource".value )

define InhaledAverageFlowRate:
	if ("NocturnalOxygenFlowRate" is not null)
		then ("NocturnalOxygenFlowRate"+ "InhaledFlowRate")*0.5 
	else if ("NocturnalOxygenFlowRate" is null)
		then "InhaledFlowRate" 
	else null

define SteroidTreatment:
	[Procedure]P
		where ("ToCode"(First(P.code.coding)) = "Intravenous hydrocortisone therapy (procedure)"
			or "ToCode"(First(P.code.coding)) = "Inhaled steroid therapy (procedure)"
			or "ToCode"(First(P.code.coding)) = "Oral steroid therapy (procedure)")

define SteroidTreatmentOutcome:
	First(First("SteroidTreatment").outcome.coding).code.value

define SteroidEffectiveness:
	if ("SteroidTreatmentOutcome" = '385669000')
		then 'Some improvement'
	else if ("SteroidTreatmentOutcome" = '385671000')
		then 'No improvement'
	else if ("SteroidTreatmentOutcome" = '385670004')
		then 'Limited improvement'
	else  ''

define TypeOfSteroidTreatment:
	if exists([Procedure]P
				where "ToCode"(First(P.code.coding)) = "Intravenous hydrocortisone therapy (procedure)")
		then 'IV'
	else if exists([Procedure]P
				where "ToCode"(First(P.code.coding)) = "Oral steroid therapy (procedure)")
		then 'PO'
	else if exists([Procedure]P
				where "ToCode"(First(P.code.coding)) = "Inhaled steroid therapy (procedure)")
		then 'Inhaled'
	else ''

define AHIndexResource:
  First([Observation] P
      where ("ToCode"(First(P.code.coding)) = "Apnea hypopnea index 24 hour"
        or "ToCode"(First(P.code.coding)) = "Respiratory disturbance index")
        and P.status.value = 'final'
  )

define AHIndex:
  FHIRHelpers.ToQuantity ( "AHIndexResource".value )

*/


define RequestPeriod:
	"Normalize Interval"(H_O_DeviceRequest.occurrence)

define LengthOfNeed:
	duration in months of "RequestPeriod"

define FrequencyOfUse:
	{
		(if ("ArterialPO2AtRest".value <= 55) then 'At rest/Awake' else ''),
		(if ("ArterialPO2DuringExercise".value <= 55) then 'During exertion' else ''),
		(if ("NocturnalPO2AtRest".value <= 55) then 'During Sleep' else '')
	}

define DeviceRequestedIsPortable:
  First(H_O_DeviceRequest.code.coding).code.value in { 'E0433', 'E0434', 'E0444', 'EO431', 'K0738', 'E0443', 'E1392' }

define DeviceRequestedIsStationary:
  First(H_O_DeviceRequest.code.coding).code.value in { 'E0439', 'E0442', 'E0424', 'E0441', 'E1390', 'E1391' }

define CannulaType:
	exists(H_O_DeviceRequest.code.coding F
		where "ToCode"(F) = "Cannula, nasal")
	

define VentilatorType:
	exists(H_O_DeviceRequest.code.coding F
		where "ToCode"(F) = "Home ventilator, any type, used with non-invasive interface, (e.g., mask, chest shell)" 
				or "ToCode"(F) = "Home ventilator, any type, used with invasive interface, (e.g., tracheostomy tube)"
				or "ToCode"(F) = "Home ventilator, multi-function respiratory device, also performs any or all of the additional functions of oxygen concentration, drug nebulization, aspiration, and cough stimulation, includes all accessories, components and supplies for all functions")
	

define RespiratoryAssistType:
	exists(H_O_DeviceRequest.code.coding F
		where "ToCode"(F) = "Respiratory assist device, bi-level pressure capability, without backup rate feature, used with noninvasive interface, e.g., nasal or facial mask (intermittent assist device with continuous positive airway pressure device)"
				or "ToCode"(F) = "Respiratory assist device, bi-level pressure capability, with back-up rate feature, used with noninvasive interface, e.g., nasal or facial mask (intermittent assist device with continuous positive airway pressure device)")
	
define OxygenDelivery:
	if  ("CannulaType" = true)
		then 'Nasal cannula'
	else if ( "VentilatorType" = true)
		then 'Ventilator'
	else if ("RespiratoryAssistType" = true)
		then 'Mask'
	else 'Other'

define "H_O_QuestionnaireSubmissionDate": 
  ToDate(Today())

// Helper functions needed for this scope

define function "Normalize Interval"(onset Choice<FHIR.dateTime, FHIR.Age, FHIR.Period, FHIR.Range, FHIR.string>):
  if onset is FHIR.dateTime then Interval[FHIRHelpers.ToDateTime ( onset as FHIR.dateTime ), FHIRHelpers.ToDateTime ( onset as FHIR.dateTime )]
    else if onset is FHIR.Period then FHIRHelpers.ToInterval ( onset as FHIR.Period ) 
    else if onset is FHIR.Age then Interval[FHIRHelpers.ToDate ( Patient.birthDate ) + FHIRHelpers.ToQuantity ( onset as FHIR.Age ), FHIRHelpers.ToDate ( Patient.birthDate ) + FHIRHelpers.ToQuantity ( onset as FHIR.Age ) + 1 year ] 
    else null

define function "GetId"(uri String):
  Last(Split(uri, '/'))

define function "GetConditionFromEncounter"(encounter Encounter):
  encounter.diagnosis D
    return singleton from ( [Condition] C
        where C.id.value = "GetId"(D.condition.reference.value))

define function GetObservationFromDiagnosticReportInProcedure(procedureParam Procedure, codeParam Code): 
   First([Observation] O where 'Observation/' + O.id.value in 
        (singleton from ([DiagnosticReport] DR where 'DiagnosticReport/' + DR.id.value in 
        procedureParam.report.reference.value)).result.reference.value
      and  "ToCode"(First(O.code.coding)) = codeParam
      sort by start of "Normalize Interval"(effective))


define function GetObservationFromSameDayAsProcedure(procedureParam Procedure, codeParam Code): 
  First([Observation] O where "ToCode"(First(O.code.coding)) = codeParam
      and start of "Normalize Interval"(O.effective) same day as start of "Normalize Interval"(procedureParam.performed))


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
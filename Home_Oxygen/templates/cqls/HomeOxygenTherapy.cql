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
valueset "Serious or Life Threatening Illness": '2.16.840.1.113883.3.464.1003.199.11.1103'


code "inpatient encounter": 'IMP' from "ActEncounterCode" display 'inpatient encounter'
code "Outpatient": 'O' from "ActEncounterCodev2" display 'Outpatient'
code "Unintentional weight gain (finding)": '441361000124104' from "SNOMEDCT" display 'Unintentional weight gain (finding)'
code "Unintentional weight loss (finding)": '448765001' from "SNOMEDCT" display 'Unintentional weight loss (finding)'
code "Acute lymphadenitis of neck (disorder)": '10629031000119100' from "SNOMEDCT" display 'Acute lymphadenitis of neck (disorder)'
code "Orthopnea": 'R06.01' from "ICD10CM" display 'Orthopnea'
code "Cardiac murmur, unspecified": 'R01.1' from "ICD10CM" display 'Cardiac murmur, unspecified'
code "Varicose vein finding (finding)": '271652003' from "SNOMEDCT" display 'Varicose vein finding (finding)'
code "Cardiac blood pool imaging, gated equilibrium": '78472' from "CPT" display 'Cardiac blood pool imaging, gated equilibrium'
code "P pulmonale by electrocardiogram": '164914003' from "SNOMEDCT" display 'P pulmonale by electrocardiogram'
code "Hematocrit/Hemoglobin [Ratio] of Blood by Automated count": '16931-8' from "LOINC" display 'Hematocrit/Hemoglobin [Ratio] of Blood by Automated count'
code "I tossed and turned at night in past 7 days [PROMIS]": '62008-8' from "LOINC" display 'I tossed and turned at night in past 7 days [PROMIS]'
code "Restlessness and agitation": 'R45.1' from "ICD10CM" display 'Restlessness and agitation'
code "Morning headache (finding)": '162310002' from "SNOMEDCT" display 'Morning headache (finding)'
code "Breathless - mild exertion (finding)": '161940008' from "SNOMEDCT" display 'Breathless - mild exertion (finding)'
code "Breathless - moderate exertion (finding)": '161939006' from "SNOMEDCT" display 'Breathless - moderate exertion (finding)'
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
code "Oxygen saturation in Arterial blood by Pulse oximetry": '59408-5' from "LOINC" display 'Oxygen saturation in Arterial blood by Pulse oximetry'
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
code "Dysesthesia (finding)": '279079003' from "SNOMEDCT" display 'Dysesthesia (finding)'
code "Weakness": 'R53.1' from "ICD10CM" display 'Weakness'
code "Involuntary movement symptom (finding)": '162227008' from "SNOMEDCT" display 'Involuntary movement symptom (finding)'
code "Speech disturbances, not elsewhere classified": 'R47' from "ICD10CM" display 'Speech disturbances, not elsewhere classified'
code "Hallucinations, unspecified": 'R44.3' from "ICD10CM" display 'Hallucinations, unspecified'
code "Delusional disorders": 'F22' from "ICD10CM" display 'Delusional disorders'
code "Other specified nonpsychotic mental disorders": 'F48.8' from "ICD10CM" display 'Other specified nonpsychotic mental disorders'
code "Mood disorder (disorder)": '46206005' from "SNOMEDCT" display 'Mood disorder (disorder)'
code "Bruising symptom (finding)": '161885008' from "SNOMEDCT" display 'Bruising symptom (finding)'
code "Bleeding (finding)": '131148009' from "SNOMEDCT" display 'Bleeding (finding)'
code "Goiter (disorder)": '3716002' from "SNOMEDCT" display 'Goiter (disorder)'
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
code "Pulmonary hypertension, unspecified": 'I27.20' from "ICD10CM" display 'Pulmonary hypertension, unspecified'
code "Congestive heart failure (disorder)": '42343007' from "SNOMEDCT" display 'Congestive heart failure (disorder)'
code "Cor pulmonale (chronic)": 'I27.81' from "ICD10CM" display 'Cor pulmonale (chronic)'
code "Familial erythrocytosis": 'D75.0' from "ICD10CM" display 'Familial erythrocytosis'
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
code "Hemoglobin [Mass/volume] in Blood": '718-7' from "LOINC" display 'Hemoglobin [Mass/volume] in Blood'
code "High altitude residence (& accident caused by)": '271209008' from "SNOMEDCT" display 'High altitude residence (& accident caused by)'
code "Effects of high altitude (disorder)": '87284002' from "SNOMEDCT" display 'Effects of high altitude (disorder)'
code "Accidents due to residence or prolonged visit at high altitude (event)": '217615009' from "SNOMEDCT" display 'Accidents due to residence or prolonged visit at high altitude (event)'
code "Periodic breathing of sleep at high altitude (finding)": '442549008' from "SNOMEDCT" display 'Periodic breathing of sleep at high altitude (finding)'
code "Air pressure effects: &/or altitude problems (disorder)": '157730009' from "SNOMEDCT" display 'Air pressure effects: &/or altitude problems (disorder)'
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
code "Home ventilator, any type, used with invasive interface, (e.g., tracheostomy tube)": 'E0465' from "HCPCS" display 'Home ventilator, any type, used with invasive interface, (e.g., tracheostomy tube)'
code "Home ventilator, any type, used with non-invasive interface, (e.g., mask, chest shell)": 'E0466' from "HCPCS" display 'Home ventilator, any type, used with non-invasive interface, (e.g., mask, chest shell)'
code "Home ventilator, multi-function respiratory device, also performs any or all of the additional functions of oxygen concentration, drug nebulization, aspiration, and cough stimulation, includes all accessories, components and supplies for all functions" : 'E0467' from "HCPCS" display 'Home ventilator, multi-function respiratory device, also performs any or all of the additional functions of oxygen concentration, drug nebulization, aspiration, and cough stimulation, includes all accessories, components and supplies for all functions'
code "Respiratory assist device, bi-level pressure capability, without backup rate feature, used with noninvasive interface, e.g., nasal or facial mask (intermittent assist device with continuous positive airway pressure device)" : 'E0470' from "HCPCS" display 'Respiratory assist device, bi-level pressure capability, without backup rate feature, used with noninvasive interface, e.g., nasal or facial mask (intermittent assist device with continuous positive airway pressure device)'
code "Respiratory assist device, bi-level pressure capability, with back-up rate feature, used with noninvasive interface, e.g., nasal or facial mask (intermittent assist device with continuous positive airway pressure device)" : 'E0471' from "HCPCS" display 'Respiratory assist device, bi-level pressure capability, with back-up rate feature, used with noninvasive interface, e.g., nasal or facial mask (intermittent assist device with continuous positive airway pressure device)'
code "Respiratory assist device, bi-level pressure capability, with backup rate feature, used with invasive interface, e.g., tracheostomy tube (intermittent assist device with continuous positive airway pressure device)": 'E0472' from "HCPCS" display 'Respiratory assist device, bi-level pressure capability, with backup rate feature, used with invasive interface, e.g., tracheostomy tube (intermittent assist device with continuous positive airway pressure device)'
code "Cannula, nasal": 'A4615' from "HCPCS" display 'Cannula, nasal'
code "Positive airway pressure nap study (procedure)": '703476007' from "SNOMEDCT" display 'Positive airway pressure nap study (procedure)'

code "Use of supplemental oxygen": '88658-0' from "LOINC" display 'Use of supplemental oxygen'

code "Nocturnal continuous positive airway pressure (regime/therapy)": '34281000175105' from "SNOMEDCT" display 'Nocturnal continuous positive airway pressure (regime/therapy)'

code "Titration method (procedure)": '117007006' from "SNOMEDCT" display 'Titration method (procedure)'
code "Pigmentation of skin or mucosa (finding)": '373923006' from "SNOMEDCT" display 'Pigmentation of skin or mucosa (finding)'
code "Pulse oximetry (procedure)": '252465000' from "SNOMEDCT" display 'Pulse oximetry (procedure)'
code "Ambulatory Health Care Facilities; Clinic/Center, Sleep Disorder Diagnostic": '261QS1200X' from "HealthCareProviderTaxonomy" display 'Ambulatory Health Care Facilities; Clinic/Center, Sleep Disorder Diagnostic'

code "Apnea hypopnea index 24 hour": '69990-0' from "LOINC" display 'Apnea hypopnea index 24 hour'
code "Respiratory disturbance index": '90566-1' from "LOINC" display 'Respiratory disturbance index'


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
  ToDate(start of "EncounterResource".period)

define EncounterResource:
  singleton from([Encounter] E
        where 'Encounter/' + E.id.value =("DeviceRequest".encounter).reference.value
    )

define function "EncounterDiagnosis"(Encounter Encounter):
  Encounter.diagnosis D
    return singleton from ( [Condition] C
        where C.id.value = "GetId"(D.condition.reference.value)
    )

define EncounterCondition:
  "EncounterDiagnosis"("EncounterResource")


define OrderingPhysician:
  "DeviceRequest".requester PR
    return singleton from ( [Practitioner] P
        where 'Practitioner/' + P.id.value = PR.reference.value
    )

define OrderingPhysicianNPI:
  ( First("OrderingPhysician".identifier identifier
        where identifier.system.value = 'http://hl7.org/fhir/sid/us-npi'
    )
  ).value.value

define InpatientStay:
  ( "EncounterResource" F
      where F.class.code = 'IMP'
  )

define InpatientHospitalStay:
  if ( "InpatientStay" is not null ) then true 
    else false

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

define TravelToHigherElevation:
  exists ( [Observation] O
      where O.status.value = 'final'
        and ( "ToCode"(First(O.code.coding)) = "High altitude residence (& accident caused by)"
            or "ToCode"(First(O.code.coding)) = "Effects of high altitude (disorder)"
            or "ToCode"(First(O.code.coding)) = "Accidents due to residence or prolonged visit at high altitude (event)"
            or "ToCode"(First(O.code.coding)) = "Periodic breathing of sleep at high altitude (finding)"
            or "ToCode"(First(O.code.coding)) = "Air pressure effects: &/or altitude problems (disorder)"
        )
        and start of "Normalize Interval"(O.effective) less than 2 months before start of "EncounterResource".period
  )

define HbConcentration:
  ( [Observation] O
    where "ToCode"(First(O.code.coding)) = "Hemoglobin [Mass/volume] in Blood"
      and start of "Normalize Interval"(O.effective) in Interval["BloodGasStudyDate" - 2 days, "BloodGasStudyDate" + 2 days]) O
    return FHIRHelpers.ToQuantity ( O.value )

define OxygenCarryingCapacity:
  if ( First("HbConcentration".unit) = 'g/dL' ) then 1.34 * ( First("HbConcentration".value) ) 
    else null

define "O2CarryingCapacity":
  if ( "OxygenCarryingCapacity" < 20.1 ) then true 
    else if ("OxygenCarryingCapacity" > 20.1) then false
    else null

define SignsOfPigmentation:
  Last([Observation] O
      where O.status.value = 'final'
        and ("ToCode"(First(O.code.coding)) = "Pigmentation of skin or mucosa (finding)")
        and start of "Normalize Interval"(O.effective) in Interval[start of "EncounterResource".period , "DeviceRequest".authoredOn])

define SkinPigmentation:
  if ("SignsOfPigmentation".value = true)
  then true
  else if ("SignsOfPigmentation".value = false)
  then false
  else null

define PrimaryDiagnosis:
  First(([Condition]C
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
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed')

define BloodGasStudy:
    First([Procedure] P
      where P.status.value = 'completed'
        and("ToCode"(First(P.code.coding)) = "Blood gas analysis (procedure)"
            or "ToCode"(First(P.code.coding)) = "Blood gas measurement (procedure)")
        and((("Normalize Interval"(P.performed) starts before (end of "EncounterResource".period + 2days))
            and "ToCode"("EncounterResource".class) = "inpatient encounter")
        or("Normalize Interval"(P.performed) starts after "Normalize Interval"("PrimaryDiagnosis".onset)))
    )

define "ExistsBloodGasStudy":
  if exists([Procedure] P
      where P.status.value = 'completed'
        and("ToCode"(First(P.code.coding)) = "Blood gas analysis (procedure)"
            or "ToCode"(First(P.code.coding)) = "Blood gas measurement (procedure)")
        and((("Normalize Interval"(P.performed) starts before (end of "EncounterResource".period + 2days))
            and "ToCode"("EncounterResource".class) = "inpatient encounter")
        or("Normalize Interval"(P.performed) starts after "Normalize Interval"("PrimaryDiagnosis".onset)))
  )
  then true
  else if exists([Procedure] P
      where P.status.value = 'completed'
        and("ToCode"(First(P.code.coding)) = "Blood gas analysis (procedure)"
            or "ToCode"(First(P.code.coding)) = "Blood gas measurement (procedure)")
        and((("Normalize Interval"(P.performed) starts after (end of "EncounterResource".period + 2days))
            and "ToCode"("EncounterResource".class) = "inpatient encounter")
        and("Normalize Interval"(P.performed) starts before "Normalize Interval"("PrimaryDiagnosis".onset)))
  )
  then false
  else null

define BloodGasStudyDate:
  start of "Normalize Interval"("BloodGasStudy".performed)

define BloodGasStudyO2Sat:
  ( First([Observation] O
      where "ToCode"(First(O.code.coding)) = "Oxygen saturation in Arterial blood"
      and start of "Normalize Interval"(O.effective) same day as "BloodGasStudyDate"
  ) ) O
    return FHIRHelpers.ToQuantity ( O.value )

define BloodGasStudyHematocrit:
  ( First([Observation] O
      where "ToCode"(First(O.code.coding)) = "Hematocrit [Volume Fraction] of Arterial blood"
      and start of "Normalize Interval"(O.effective) same day as "BloodGasStudyDate"
  ) ) O
    return FHIRHelpers.ToQuantity ( O.value )

define BloodGasStudyPaO2:
  ( First([Observation] O
      where "ToCode"(First(O.code.coding)) = "Oxygen [Partial pressure] in Arterial blood"
      and start of "Normalize Interval"(O.effective) same day as "BloodGasStudyDate"
  ) ) O
    return FHIRHelpers.ToQuantity ( O.value )

define "Hematocrit_lab_test_Codes":
  { '20570-8', '31100-1', '32354-3', '41654-5', '41655-2', '4544-3', '4545-0', '71829-6', '71830-4', '71832-0', '71833-8' }

define HypoxemiaSymptoms:
  if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Hypoxemia")
          and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed')
  then true
  else if exists([Condition] P
      where exists ( P.code.coding P
          where P in "Hypoxemia")
          and (First(P.clinicalStatus.coding).code.value != 'active'
          or First(P.verificationStatus.coding).code.value != 'confirmed'))
  then false
  else null

// Other codes

define function "GetId"(uri String):
  Last(Split(uri, '/'))

define PulseOximetry:
  First([Procedure] P
      where "ToCode"(First(P.code.coding)) = "Pulse oximetry (procedure)"
      and P.status.value = 'completed'
      and ((("Normalize Interval"(P.performed) starts before (end of "EncounterResource".period + 2days))
            and "ToCode"("EncounterResource".class) = "inpatient encounter")
        or("ToCode"("EncounterResource".class) = "Outpatient"))
      )
  

define ExistsPulseOximetry:
  if exists([Procedure] P
      where "ToCode"(First(P.code.coding)) = "Pulse oximetry (procedure)"
      and P.status.value = 'completed'
      and ((("Normalize Interval"(P.performed) starts before (end of "EncounterResource".period + 2days))
            and "ToCode"("EncounterResource".class) = "inpatient encounter")
        or("ToCode"("EncounterResource".class) = "Outpatient")))
    then true
  else if exists([Procedure] P
      where "ToCode"(First(P.code.coding)) = "Pulse oximetry (procedure)"
      and P.status.value != 'completed'
      and ((("Normalize Interval"(P.performed) starts after (end of "EncounterResource".period + 2days))
            and "ToCode"("EncounterResource".class) = "inpatient encounter")))
    then false
    else null

define ArterialOxygenSaturation:
  ( First([Observation] P
      where ("ToCode"(First(P.code.coding)) = "Oxygen saturation in Arterial blood by Pulse oximetry --on room air"
          or "ToCode"(First(P.code.coding)) = "Oxygen saturation in Arterial blood")
      and (start of "Normalize Interval"(P.effective) same day as "TestingDate")
  )) O
    return FHIRHelpers.ToQuantity ( O.value )

define ArterialPO2:
  ( First([Observation] P
      where "ToCode"(First(P.code.coding)) = "Oxygen [Partial pressure] in Arterial blood"
          and (start of "Normalize Interval"(P.effective) same day as "TestingDate")
  ) ) O
    return FHIRHelpers.ToQuantity ( O.value )

define ArterialOxygenSaturationExercise:
  ( First([Observation] P
      where "ToCode"(First(P.code.coding)) = "Oxygen saturation in Arterial blood by Pulse oximetry --W exercise"
      and (start of "Normalize Interval"(P.effective) same day as "TestingDate")
  ) ) O
    return FHIRHelpers.ToQuantity ( O.value )

define ArterialPO2Exercise:
  ( First([Observation] P
      where "ToCode"(First(P.code.coding)) = "Oxygen [Partial pressure] adjusted to patients actual temperature in Arterial blood"
      and (start of "Normalize Interval"(P.effective) same day as "TestingDate")
  ) ) O
    return FHIRHelpers.ToQuantity ( O.value )

define ArterialOxygenSaturationExerciseWithOxygen:
  ( First([Observation] P
      where "ToCode"(First(P.code.coding)) = "Oxygen saturation in Arterial blood by Pulse oximetry --W exercise"
        and "ToCode"(First(First(P.component).code.coding)) = "Use of supplemental oxygen"
        and First(P.component).value = true
        and (start of "Normalize Interval"(P.effective) same day as "TestingDate")
  ) ) O
    return FHIRHelpers.ToQuantity ( O.value )

define ArterialPO2ExerciseWithOxygen:
  ( First([Observation] P
      where "ToCode"(First(P.code.coding)) = "Oxygen [Partial pressure] adjusted to patients actual temperature in Arterial blood"
        and "ToCode"(First(First(P.component).code.coding)) = "Use of supplemental oxygen"
        and First(P.component).value = true
        and (start of "Normalize Interval"(P.effective) same day as "TestingDate")
  ) ) O
    return FHIRHelpers.ToQuantity ( O.value )

define OvernightOximetry:
  First([Procedure]P
    where "ToCode"(First(P.code.coding)) = "Overnight pulse oximetry (procedure)"
    and P.status.value = 'completed')

define NocturnalOximetryO2SAT:
  ( First([Observation] P
      where "ToCode"(First(P.code.coding)) = "Oxygen saturation in Arterial blood by Pulse oximetry --resting"
      and First(P.partOf).reference.value = 'Procedure/' + "OvernightOximetry".id.value
  ) ) O
    return FHIRHelpers.ToQuantity ( O.value )

define NocturnalOximetryPO2:
  ( First([Observation] P
      where "ToCode"(First(P.code.coding)) = "Oxygen [Partial pressure] in Arterial blood"
      and First(P.partOf).reference.value = 'Procedure/' + "OvernightOximetry".id.value
  ) ) O
    return FHIRHelpers.ToQuantity ( O.value )

define NocturnalOximetryO2SATWithOxygen:
  ( First([Observation] P
      where "ToCode"(First(P.code.coding)) = "Oxygen saturation in Arterial blood by Pulse oximetry --resting"
      and First(P.partOf).reference.value = 'Procedure/' + "OvernightOximetry".id.value
      and "ToCode"(First(First(P.component).code.coding)) = "Use of supplemental oxygen"
        and First(P.component).value = true
  ) ) O
    return FHIRHelpers.ToQuantity ( O.value )

define NocturnalOximetryPO2WithOxygen:
  ( First([Observation] P
      where "ToCode"(First(P.code.coding)) = "Oxygen [Partial pressure] in Arterial blood"
      and First(P.partOf).reference.value = 'Procedure/' + "OvernightOximetry".id.value
      and "ToCode"(First(First(P.component).code.coding)) = "Use of supplemental oxygen"
        and First(P.component).value = true
  ) ) O
    return FHIRHelpers.ToQuantity ( O.value )

define TestingDate:
  start of "Normalize Interval"("PulseOximetry".performed)

define PatientMobile:
  if exists ( [Observation] P
      where "ToCode"(First(P.code.coding)) = "Walks indoors - usual functional ability during assessment period [CMS Assessment]"
      and P.value = true
  )
  then true
  else if exists ( [Observation] P
      where "ToCode"(First(P.code.coding)) = "Walks indoors - usual functional ability during assessment period [CMS Assessment]"
      and P.value = false
  )
  then false
  else null

define InhaledFlowRate:
  ( First([Observation] P
      where "ToCode"(First(P.code.coding)) = "Inhaled oxygen flow rate"
  ) ) O
    return FHIRHelpers.ToQuantity ( O.value )

define NocturnalOxygenFlowRate:
	( First([Observation] P
      where "ToCode"(First(P.code.coding)) = "Inhaled oxygen flow rate"
	  	and "ToCode"(First(P.method.coding)) = "Overnight pulse oximetry (procedure)"
  ) ) O
    return FHIRHelpers.ToQuantity ( O.value )

define InhaledAverageFlowRate:
	if ("NocturnalOxygenFlowRate" is not null)
		then ("NocturnalOxygenFlowRate"+ "InhaledFlowRate")*0.5 
	else if ("NocturnalOxygenFlowRate" is null)
		then "InhaledFlowRate" 
	else null

define FrequencyOfUse:
	{
		(if ("ArterialPO2".value <= 55) then 'At rest/Awake' else ''),
		(if ("ArterialPO2Exercise".value <= 55) then 'During exertion' else ''),
		(if ("NocturnalOximetryPO2".value <= 55) then 'During Sleep' else '')
	}

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

define ClusterHeadaches:
  if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Cluster Headache")
          and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
    )
  then true
  else if exists( [Condition] P
      where exists ( P.code.coding P
          where P in "Cluster Headache")
          and (First(P.clinicalStatus.coding).code.value != 'active'
          or First(P.verificationStatus.coding).code.value != 'confirmed')
    )
  then false
  else null

define PatientDiagnoses:
  if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Chronic Obstructive Lung Disease (COPD) ICD10CM")
          and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  )
   then 'COPD' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Bronchiectasis")
          and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  )
  then 'Bronchiectasis' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Hypoxemia"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'Hypoxemia' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Interstitial lung disease")
          and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'Diffuse interstitial lung disease' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Cystic Fibrosis")
          and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'Cystic Fibrosis' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Malignant Neoplasm of Respiratory and Intrathoracic Organs")
          and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'Pulmonary neoplasm' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Familial erythrocytosis"
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'Erythrocythemia' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Cor pulmonale (chronic)"
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'Pulmonary hypertension' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Congestive heart failure (disorder)"
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'Recurring CHF d/t Cor Pulmonale' 
  else ''

define DependentEdema:
  if exists ( [Condition] P
      where exists ( P.code.coding P
          where (P in "Acute or Chronic Heart Failure Disorder ICD10CM"
          and P in "Acute Pulmonary Edema"))
          and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
      )
    then true
    else if exists([Condition] P
      where exists ( P.code.coding P
          where (P in "Acute or Chronic Heart Failure Disorder ICD10CM"
          or P in "Acute Pulmonary Edema"))
          and (First(P.clinicalStatus.coding).code.value != 'active'
          or First(P.verificationStatus.coding).code.value != 'confirmed'))
    then false
    else null

define SecondaryToCORPulmonale:
  if exists ( [Observation] P
      where "ToCode"(First(P.code.coding)) = "Cardiac blood pool imaging, gated equilibrium"
      and P.status.value = 'final'
  ) then 'Gated blood pool scan' 
    else if exists ( [Observation] P
      where "ToCode"(First(P.code.coding)) = "P pulmonale by electrocardiogram"
      and P.status.value = 'final'
  ) then '“p” Pulmonale on EKG' 
    else ''

define Erythrocythemia:
  if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Secondary Erythrocytosis Disorder")
          and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed')
  then true
  else if exists([Condition] P
      where exists ( P.code.coding P
          where P in "Secondary Erythrocytosis Disorder")
          and (First(P.clinicalStatus.coding).code.value != 'active'
          or First(P.verificationStatus.coding).code.value != 'confirmed'))
  then false
  else null

define HematocritResult:
  First([Observation] P
      where "ToCode"(First(P.code.coding)) = "Hematocrit/Hemoglobin [Ratio] of Blood by Automated count"
  ).value

define NocturnalRestlessness:
  if exists ( [Observation] P
      where ("ToCode"(First(P.code.coding)) = "I tossed and turned at night in past 7 days [PROMIS]"
        or "ToCode"(First(P.code.coding)) = "Restlessness and agitation"
        or "ToCode"(First(P.code.coding)) = "Morning headache (finding)")
        and P.value = true)
  then true
  else if exists([Observation] P
      where ("ToCode"(First(P.code.coding)) = "I tossed and turned at night in past 7 days [PROMIS]"
        or "ToCode"(First(P.code.coding)) = "Restlessness and agitation"
        or "ToCode"(First(P.code.coding)) = "Morning headache (finding)")
        and P.value = false)
  then false
  else null

define NocturnalRestlessnessStudy:
{ 
   (if exists([Procedure] P 
          where "ToCode"(First(P.code.coding)) = "Overnight pulse oximetry (procedure)") 
          then 'Nocturnal oximetry'else ''),
   (if exists([Procedure] P 
          where "ToCode"(First(P.code.coding)) = "Nocturnal continuous positive airway pressure (regime/therapy)")
          then 'Titration Polysomnography' else '')
}
      

define OSA:
  exists ( [Condition] P
      where exists ( P.code.coding C
                      where C in "Obstructive Sleep Apnea (ICD10CM)")
          and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed')
  
define PresenceOfOSA:
  if ("OSA" = true)
  then 'Yes'
  else if ("OSA" is null)
  then ''
  else 'No'

define PresenceOfPAP:
    exists ( [Procedure] P
      where "ToCode"(First(P.code.coding)) = "Nocturnal continuous positive airway pressure (regime/therapy)"   
      and P.status.value = 'in-progress'   
  )      

define AHIndex:
  ( First([Observation] P
      where ("ToCode"(First(P.code.coding)) = "Apnea hypopnea index 24 hour"
        or "ToCode"(First(P.code.coding)) = "Respiratory disturbance index")
        and P.status.value = 'final'
  ) ) O
    return FHIRHelpers.ToQuantity ( O.value )

define ExertionalHypoxia:
  if exists ( [Condition] P
      where ("ToCode"(First(P.code.coding)) = "Breathless - mild exertion (finding)"
      or "ToCode"(First(P.code.coding)) = "Breathless - moderate exertion (finding)")
       and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  )
  then true
  else if exists([Condition] P
      where ("ToCode"(First(P.code.coding)) = "Breathless - mild exertion (finding)"
      or "ToCode"(First(P.code.coding)) = "Breathless - moderate exertion (finding)")
       and (First(P.clinicalStatus.coding).code.value != 'active'
          or First(P.verificationStatus.coding).code.value != 'confirmed'))
  then false
  else null

define Group4Criteria:
  if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Angina pectoris, unspecified"
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
      )
    then 'Angina pectoris' 
    else if exists ( [Condition] P
                      where exists ( P.code.coding P
                                    where P in "Dyspnea")
                  and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed')
    then 'Dyspnea' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Peripheral vascular disease (disorder)"
        and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
      )
    then 'Peripheral Vascular Disease' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Serious or Life Threatening Illness")
          and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
    )
    then 'Terminal Illness'
    else ''

define "GeneralSymptoms":
  if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Unintentional weight gain (finding)"
        and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'weight gain' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Unintentional weight loss (finding)"
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'weight loss' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Poor Sleep Hygeine or Sleep Challenges"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'sleeping problems' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Fatigue"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'fatigue' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Fever (ICD10CM)"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'fever' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Chills (ICD10CM)"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'chills' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Night Sweats (SNOMED)"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'night sweats / diaphoresi' 
    else 'None'

define NeckConditions:
  if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Spine or Neck Disorder"
      )
  ) then 'pain on movement' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Acute lymphadenitis of neck (disorder)"
  ) then 'lumps' 
    else 'None'

define PulmonaryConditions:
  if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Cough (ICD10CM)"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'cough' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Difficulty Breathing (ICD10CM)"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'shortness of breath' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Chest Pain (ICD10CM)"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'pain' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Wheezing"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'wheezing' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Hemoptysis (ICD10CM)"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'hemoptysis' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Sputum (Specimen Type) (SNOMED)"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'sputum production' 
    else 'None'

define CardiacConditions:
  if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Chest Pain"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'chest pain' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Heart Palpitations"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'palpitations' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Orthopnea"
        and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'orthopnea' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Cardiac murmur, unspecified"
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'murmur' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Syncope"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'syncope' 
    else 'None'

define VascularConditions:
  if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Edema"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'edema' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Claudication"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'claudication' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Varicose vein finding (finding)"
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'varicose veins' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Phlebitis and Thrombophlebitis of the Veins of lower extremity"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'thrombophlebitis' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Acute Peptic Ulcer"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'ulcers' 
    else 'None'

define HematologyConditions:
  if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Anemia Conditions"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'anemia' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Bruising symptom (finding)"
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'bruising' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Bleeding Disorder"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'bleeding disorders (conditional)' 
    else 'None'

define EndocrineConditions:
  if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Diabetes"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'diabetes' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Goiter (disorder)"
        and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'goiter' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Lipids abnormal (finding)"
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'lipid disorders' 
    else 'None'

define TreatmentsTried:
  if exists ( [Procedure] P
      where exists ( P.code.coding P
          where P in "Long Acting Inhaled Bronchodilators"
      )
      and P.status.value = 'completed'
  ) then 'Bronchodilators' 
    else if exists ( [Procedure] P
      where exists ( P.code.coding P
          where P in "Inhaled Steroid Combinations"
      )
      and P.status.value = 'completed'
  ) 
  then 'Steroids' 
    else if exists ( [Procedure] P
      where exists ( P.code.coding P
          where P in "COVID19 SNOMED Value Set for Non Invasive Respiratory Support"
      )
      and P.status.value = 'completed'
  ) 
  then 'diabetes' 
    else if exists ( [Procedure] P
      where exists ( P.code.coding P
          where P in "COVID19 SNOMED Value Set for Invasive Mechanical Ventilation"
      )
      and P.status.value = 'completed'
  ) 
  then 'Ventilation' 
    else if exists ( [Procedure] P
      where exists ( P.code.coding P
          where P in "Cromolyn Inhalant Preparations"
      )
      and P.status.value = 'completed'
  ) 
  then 'Anti-Inflammatory' 
    else 'None'

define PsychiatricConditions:
  if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Hallucinations, unspecified"
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'hallucinations' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Delusional disorders"
        and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'delusions' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Anxiety"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'anxiety' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Other specified nonpsychotic mental disorders"
        and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'nervous breakdown' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Mood disorder (disorder)"
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'mood changes' 
    else 'None'

define NeurologicalConditions:
  if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Seizure"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'seizures' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Short Term Memory Deficits"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'poor memory' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Difficulty Concentrating"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'poor concentration' 
    else if exists ( [Condition] P
      where ("ToCode"(First(P.code.coding)) = "Numbness (finding)"
        or "ToCode"(First(P.code.coding)) = "Numbness and tingling sensation of skin (finding)")
        and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'numbness / tingling' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Pins and needles (finding)"
        and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'pins and needles sensation' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Other disturbances of skin sensation"
        and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'hyperpathia' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Dysesthesia (finding)"
        and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'dysesthesia' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Weakness"
        and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'weakness' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Spinal Cord Injury or Paralysis Disorder"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'paralysis' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Essential tremor"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'tremors' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Involuntary movement symptom (finding)"
        and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'involuntary movements' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Abnormality of Gait and Mobility"
      )
        and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'unstable gait' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Fall Risk"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'fall' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Vertigo"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'vertigo' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Headache"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'headache' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Stroke"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'stroke' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Speech disturbances, not elsewhere classified"
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'speech disorders' 
    else 'None'

define MusculoskeletalConditions:
  if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Pain"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'pain' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Swelling (finding)"
        and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'swelling' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Stiff neck (SNOMED)"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'stiffness' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Functional limitation in range of motion [CMS Assessment]"
        and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'limitation of range of motion' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Arthritis Disorders"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'arthritis' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Gout"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'gout' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Abdominal Cramps (SNOMED)"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'cramps' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Myalgia (ICD10CM)"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'myalgia' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Fasciculation"
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'fasciculation' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Multiple System Atrophy (SNOMED)"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'atrophy' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "HEDIS Fractures Value Set ICD10CM"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'fracture' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Osteopathies chondropathies and acquired musculoskeletal deformities"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'deformity' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Muscle weakness (ICD10CM)"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'weakness' 
    else 'None'

define GastrointestinalConditions:
  if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Dysphagia (SNOMED)"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'swallowing problems' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Abdominal Pain (ICD10CM)"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'abdominal pain' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Constipation"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'constipation' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Diarrhea"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'diarrhea' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Urinary Incontinence"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'incontinence' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Nausea (ICD10CM)"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'nausea' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Vomiting"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'vomiting' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Acute Peptic Ulcer"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'ulcers' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Melena"
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'melena' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Hemorrhage of anus and rectum"
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'rectal bleeding' 
    else if exists ( [Condition] P
      where "ToCode"(First(P.code.coding)) = "Heartburn"
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'heartburn' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Jaundice"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'jaundice' 
    else if exists ( [Condition] P
      where exists ( P.code.coding P
          where P in "Hematemesis [Unspecified Cause] (ICD10CM)"
      )
      and First(P.clinicalStatus.coding).code.value = 'active'
          and First(P.verificationStatus.coding).code.value = 'confirmed'
  ) 
  then 'hematemesis' 
    else 'None'

define ConditionsOfSystems:
  { ( if ( "GeneralSymptoms" != 'None' ) then 'Conditions in General' 
      else ''
  ), ( if ( "NeckConditions" != 'None' ) then 'Conditions of Neck' 
      else ''
  ), ( if ( "PulmonaryConditions" != 'None' ) then 'Conditions of Pulmonary System' 
      else ''
  ), ( if ( "CardiacConditions" != 'None' ) then 'Conditions of Cardiac System' 
      else ''
  ), ( if ( "VascularConditions" != 'None' ) then 'Conditions of Vascular System' 
      else ''
  ), ( if ( "HematologyConditions" != 'None' ) then 'Conditions of Hematology' 
      else ''
  ), ( if ( "EndocrineConditions" != 'None' ) then 'Conditions of Endocrine System' 
      else ''
  ), ( if ( "NeurologicalConditions" != 'None' ) then 'Conditions of Neurological System' 
      else ''
  ), ( if ( "MusculoskeletalConditions" != 'None' ) then 'Conditions of Musculoskeletal System' 
      else ''
  ), ( if ( "GastrointestinalConditions" != 'None' ) then 'Conditions of Gastrointestinal System' 
      else ''
  ) }

define OxygenAccessoryList:
	("DeviceRequest" D 
		where exists(D.code.coding C
						where C in "Home Oxygen Therapy Accessory"))

define TargetSaturation:
	("DeviceRequest".parameter D
		where exists(D.code.coding C
			where "ToCode"(C) = "Oxygen saturation in Arterial blood by Pulse oximetry --on room air"))E
	return FHIRHelpers.ToQuantity(E.value)

define CannulaType:
	exists("DeviceRequest".code.coding F
		where "ToCode"(F) = "Cannula, nasal")
	

define VentilatorType:
	exists("DeviceRequest".code.coding F
		where "ToCode"(F) = "Home ventilator, any type, used with non-invasive interface, (e.g., mask, chest shell)" 
				or "ToCode"(F) = "Home ventilator, any type, used with invasive interface, (e.g., tracheostomy tube)"
				or "ToCode"(F) = "Home ventilator, multi-function respiratory device, also performs any or all of the additional functions of oxygen concentration, drug nebulization, aspiration, and cough stimulation, includes all accessories, components and supplies for all functions")
	

define RespiratoryAssistType:
	exists("DeviceRequest".code.coding F
		where "ToCode"(F) = "Respiratory assist device, bi-level pressure capability, without backup rate feature, used with noninvasive interface, e.g., nasal or facial mask (intermittent assist device with continuous positive airway pressure device)"
				or "ToCode"(F) = "Respiratory assist device, bi-level pressure capability, with back-up rate feature, used with noninvasive interface, e.g., nasal or facial mask (intermittent assist device with continuous positive airway pressure device)")
	

define OxygenDelivery:
	if  ("CannulaType" = true)
		then 'Nasal cannula'
	else if ( "VentilatorType" = true)
		then 'Ventilator'
	else if ("RespiratoryAssistType" = true)
		then 'Mask'
	else ''

define HematocritThatIsGreaterThanThreshold:
  FHIRHelpers.ToQuantity ( singleton from ( [Observation] P
      where First(P.code.coding).code.value in "Hematocrit_lab_test_Codes"
  ).value ).value

define PatientHasHematocritThatIsGreaterThanThreshold:
  if ( "HematocritThatIsGreaterThanThreshold" > 56 ) then true 
    else false

define FrequencyOfMonitoring:
	distinct{
		(if ("ArterialOxygenSaturation".value < 55) then 'At rest/Awake' else ''),
		(if ("ArterialOxygenSaturationExercise".value <55) then 'During exertion' else ''),
		(if ("NocturnalOximetryO2SAT".value < 55) then 'During Sleep' else '')
	}

define DeviceRequestDescription:
  'HCPCS ' + First("DeviceRequest".code.coding).code.value + ' - ' + First("DeviceRequest".code.coding).display.value

define DeviceRequestCode:
  First("DeviceRequest".code.coding).code.value

define RequestPeriod:
	"Normalize Interval"("DeviceRequest".occurrence)

define LengthOfNeed:
	duration in months of "RequestPeriod"

define DeviceOrderId:
  "DeviceRequest".id.value

define DeviceRequestedIsPortable:
  First("DeviceRequest".code.coding).code.value in { 'E0433', 'E0434', 'E0444', 'EO431', 'K0738', 'E0443', 'E1392' }

define DeviceRequestedIsStationary:
  First("DeviceRequest".code.coding).code.value in { 'E0439', 'E0442', 'E0424', 'E0441', 'E1390', 'E1391' }

define function "Normalize Interval"(onset Choice<FHIR.dateTime, FHIR.Age, FHIR.Period, FHIR.Range, FHIR.string>):
  if onset is FHIR.dateTime then Interval[FHIRHelpers.ToDateTime ( onset as FHIR.dateTime ), FHIRHelpers.ToDateTime ( onset as FHIR.dateTime )]
    else if onset is FHIR.Period then FHIRHelpers.ToInterval ( onset as FHIR.Period ) 
    else if onset is FHIR.Age then Interval[FHIRHelpers.ToDate ( Patient.birthDate ) + FHIRHelpers.ToQuantity ( onset as FHIR.Age ), FHIRHelpers.ToDate ( Patient.birthDate ) + FHIRHelpers.ToQuantity ( onset as FHIR.Age ) + 1 year ) 
    else null
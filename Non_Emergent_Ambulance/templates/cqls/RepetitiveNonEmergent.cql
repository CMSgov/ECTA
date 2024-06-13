library RepetitiveNonEmergent version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Unable to ambulate": '2.16.840.1.113883.3.6037.1001.23.98.84'
valueset "Unable to get out of bed without assistance": '2.16.840.1.113883.3.6037.1001.23.98.85'
valueset "Bed confinement observation": '2.16.840.1.113883.3.6037.1001.23.98.86'
valueset "Qualifier value Yes": '2.16.840.1.113883.3.6037.1001.23.98.87'
valueset "Unable to sit": '2.16.840.1.113883.3.6037.1001.23.98.88'
valueset "Unable to maintain erect position": '2.16.840.1.113883.3.6037.1001.23.98.89'
valueset "Risk of falling": '2.16.840.1.113883.3.6037.1001.23.98.90'
valueset "Muscular weakness": '2.16.840.1.113883.3.6037.1001.23.98.91'
valueset "Non-healed fractures": '2.16.840.1.113883.3.6037.1001.23.98.92'
valueset "Contractures": '2.16.840.1.113883.3.6037.1001.23.98.93'
valueset "Impaired mobility": '2.16.840.1.113883.3.6037.1001.23.98.94'
valueset "Osteoarthritis": '2.16.840.1.113883.3.6037.1001.23.98.95'
valueset "Physical deconditioning": '2.16.840.1.113883.3.6037.1001.23.98.96'
valueset "Lack of physical exercise": '2.16.840.1.113883.3.6037.1001.23.98.97'
valueset "Orthopedic device required in transit": '2.16.840.1.113883.3.6037.1001.23.98.98'
valueset "Amputations": '2.16.840.1.113883.3.6037.1001.23.98.99'
valueset "CVA with sequelae": '2.16.840.1.113883.3.6037.1001.23.98.100'
valueset "DVT requires elevation of lower extremity": '2.16.840.1.113883.3.6037.1001.23.98.101'
valueset "Spinal Cord Injury – Paralysis": '2.16.840.1.113883.3.6037.1001.23.98.102'
valueset "Progressive demyelinating disease": '2.16.840.1.113883.3.6037.1001.23.98.103'
valueset "Pain on movement": '2.16.840.1.113883.3.6037.1001.23.98.104'
valueset "Grade II or greater decubitus ulcers on buttocks": '2.16.840.1.113883.3.6037.1001.23.98.105'
valueset "Chronic wound": '2.16.840.1.113883.3.6037.1001.23.98.106'
valueset "Morbid obesity": '2.16.840.1.113883.3.6037.1001.23.98.107'
valueset "Dependence on equipments": '2.16.840.1.113883.3.6037.1001.23.98.108'
valueset "Danger to self or others": '2.16.840.1.113883.3.6037.1001.23.98.109'
valueset "Confused, combative, lethargic, comatose": '2.16.840.1.113883.3.6037.1001.23.98.110'
valueset "Dialysis Services": '2.16.840.1.113883.3.464.1003.109.11.1028'
valueset "Wound Care SM CT": '2.16.840.1.113883.3.666.5.2196'
valueset "Imaging_Lumbar": '2.16.840.1.113762.1.4.1106.4'
valueset "Radiation Therapy II": '2.16.840.1.113883.3.526.2.1409'
valueset "Chemotherapy": '2.16.840.1.113762.1.4.1047.453'

parameter "ServiceRequest" ServiceRequest

context Patient

define "AmbulationIssue":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Unable to ambulate")

define "AssistanceNeeded":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Unable to get out of bed without assistance")

define "SittingIssue":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Unable to sit")

define "BedConfinedObservation":
	[Observation]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and P.status.value in {'final', 'amended', 'corrected'}
		and exists(P.code.coding C where C in "Bed confinement observation")
		and exists(((P.value as CodeableConcept).coding) c where c in "Qualifier value Yes")

define "BedConfinement":
    if (Last("AmbulationIssue") is not null
        and Last("AssistanceNeeded") is not null
        and Last("SittingIssue") is not null
        and Last("BedConfinedObservation") is not null)
    then true
    else false

define "MuscleWeakIssue":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Muscular weakness")

define "ErectPositionIssue":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Unable to maintain erect position")


define "ErectPositionEvidence":
    "ErectPositionIssue" D
    where First(D.evidence evid
              where First(evid.code c
                          where First(c.coding co where co in "Muscular weakness") is not null
                          ) is not null
                  or First(evid.detail c
                            with ("MuscleWeakIssue") R
                            such that c.reference.value = 'Condition/'+R.id.value) is not null
              ) is not null

define "FallingRisk":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Risk of falling")

define "MobilityIssues":
    {(if "BedConfinement"= true then 'Bed confined' else null),
     (if Last("ErectPositionEvidence") is not null then 'Unable to maintain erect sitting position in a chair for time needed to transport, due to moderate muscular weakness and de-conditioning' else null),
     (if Last("FallingRisk") is not null then 'Risk of falling off wheelchair or stretcher while in motion' else null)
    }

define "MobilityBoolean":
    if ("BedConfinement"= true
        or Last("ErectPositionEvidence") is not null
        or Last("FallingRisk") is not null)
    then true
    else false

define "Fractures":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Non-healed fractures")

define "ImpairedMobilityCondition":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Impaired mobility")

define "ContracturesCondition":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Contractures")

define "ContracturesEvidence":
    "ContracturesCondition" D
    where First(D.evidence evid
              where First(evid.code c
                          where First(c.coding co where co in "Impaired mobility") is not null
                          ) is not null
                  or First(evid.detail c
                            with ("ImpairedMobilityCondition") R
                            such that c.reference.value = 'Condition/'+R.id.value) is not null
              ) is not null

define "OsteoarthritisCondition":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Osteoarthritis")

define "DeconditioningResource":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Physical deconditioning")
		and P.severity.coding[0].display.value='Severe'

define "LackOfExercise":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Lack of physical exercise")

define "LackOfExerciseEvidence":
    "LackOfExercise" D
    where First(D.evidence evid
              where First(evid.code c
                          where First(c.coding co where co in "Physical deconditioning") is not null
                          ) is not null
                  or First(evid.detail c
                            with ("DeconditioningResource") R
                            such that c.reference.value = 'Condition/'+R.id.value) is not null
              ) is not null

define "OrthopedicDeviceRequired":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Orthopedic device required in transit")

define "AmputationsCondition":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Amputations")

define "MusculoskeletalIssues":
    {(if Last("Fractures") is not null then 'Non-healed fractures requiring ambulance' else null),
     (if (Last("ContracturesEvidence") is not null and Last("BedConfinedObservation") is not null) then 'Contractures that impair mobility and result in bed confinement' else null),
     (if Last("OsteoarthritisCondition") is not null then 'Incapacitating Osteoarthritis' else null),
     (if Last("LackOfExerciseEvidence") is not null then 'Severe muscular weakness and de-conditioned state precludes any significant physical activity' else null),
     (if Last("OrthopedicDeviceRequired") is not null then 'Orthopedic device required in transit' else null),
     (if Last("AmputationsCondition") is not null then 'Amputation(s)' else null)
    }

define "MusculoskeletalBoolean":
    if (Last("Fractures") is not null
        or (Last("ContracturesEvidence") is not null and Last("BedConfinedObservation") is not null)
        or Last("OsteoarthritisCondition") is not null
        or Last("LackOfExerciseEvidence") is not null
        or Last("OrthopedicDeviceRequired") is not null
        or Last("AmputationsCondition") is not null)
    then true
    else false

define "SequelaeCondition":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "CVA with sequelae")

define "SequelaeEvidence":
    "SequelaeCondition" D
    where First(D.evidence evid
              where First(evid.code c
                          where First(c.coding co where co in "Impaired mobility") is not null
                          ) is not null
                  or First(evid.detail c
                            with ("ImpairedMobilityCondition") R
                            such that c.reference.value = 'Condition/'+R.id.value) is not null
              ) is not null

define "DVTCondition":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "DVT requires elevation of lower extremity")

define "CardiovascularIssues":
    {(if (Last("SequelaeEvidence") is not null and Last("BedConfinedObservation") is not null) then 'CVA with sequelae (late effect of CVA) that impair mobility and result in be confinement' else null),
     (if Last("DVTCondition") is not null then 'DVT requires elevation of lower extremity' else null)
    }

define "CardiovascularBoolean":
    if ((Last("SequelaeEvidence") is not null and Last("BedConfinedObservation") is not null)
        or Last("DVTCondition") is not null)
    then true
    else false

define "ParalysisCondition":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Spinal Cord Injury – Paralysis")

define "DemyelinatingCondition":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Progressive demyelinating disease")

define "MovementPainCondition":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Pain on movement")
		and P.severity.coding[0].display.value in {'Severe', 'Moderate'}

define "NeurologicalIssues":
    {(if Last("ParalysisCondition") is not null then 'Spinal Cord Injury – Paralysis' else null),
     (if Last("DemyelinatingCondition") is not null then 'Progressive demyelinating disease' else null),
     (if Last("MovementPainCondition") is not null then 'Moderate to severe pain on movement' else null)
    }

define "NeurologicalBoolean":
    if (Last("ParalysisCondition") is not null
        or Last("DemyelinatingCondition") is not null
        or Last("MovementPainCondition") is not null)
    then true
    else false

define "UlcersCondition":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Grade II or greater decubitus ulcers on buttocks")

define "ChronicWoundCondition":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Chronic wound")

define "Wounds":
    {(if (Last("UlcersCondition") is not null and Last("SittingIssue") is not null) then 'Unable to sit in chair or wheelchair due to Grade II or greater decubitus ulcers on buttocks' else null),
     (if Last("ChronicWoundCondition") is not null then 'Chronic wounds requiring immobilization' else null)
    }

define "WoundsBoolean":
    if ((Last("UlcersCondition") is not null and Last("SittingIssue") is not null)
        or Last("ChronicWoundCondition") is not null)
    then true
    else false

define "ObesityCondition":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Morbid obesity")

define "DependenceCondition":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Dependence on equipments")

define "DependenceConditionEvidence":
    "DependenceCondition" D
    where First(D.evidence evid
              where First(evid.code c
                          where First(c.coding co where co in "Morbid obesity") is not null
                          ) is not null
                  or First(evid.detail c
                            with ("ObesityCondition") R
                            such that c.reference.value = 'Condition/'+R.id.value) is not null
              ) is not null

define "AttendantReasons":
    {(if Last("DependenceConditionEvidence") is not null then 'Morbid obesity requires additional personnel/equipment to handle' else null)
    }

define "AttendantBoolean":
    if Last("DependenceConditionEvidence") is not null
    then true
    else false

define "DangerCondition":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Danger to self or others")

define "MentalConditions":
	[Condition]P
		where P.subject.reference.value = 'Patient/'+ Patient.id.value
		and First(P.clinicalStatus.coding).code.value = 'active'
		and exists(P.code.coding C where C in "Confused, combative, lethargic, comatose")

define "MentalIssues":
    {(if Last("DangerCondition") is not null then 'Danger to self or others' else null),
    (if Last("MentalConditions") is not null then 'Confused, combative, lethargic, comatose' else null)
    }

define "MentalBoolean":
    if (Last("DangerCondition") is not null
        or Last("MentalConditions") is not null)
    then true
    else false

define "ReasonOfTransport":
    {
    (if ("MobilityBoolean") then 'Mobility issues' else null),
    (if ("MusculoskeletalBoolean") then 'Musculoskeletal issues' else null),
    (if ("CardiovascularBoolean") then 'Cardiovascular issues' else null),
    (if ("NeurologicalBoolean") then 'Neurological issues' else null),
    (if ("WoundsBoolean") then 'Wounds' else null),
    (if ("AttendantBoolean") then 'Attendant required during transport' else null),
    (if ("MentalBoolean") then 'Mental issues' else null),
    (if ("MobilityBoolean"=false and "MusculoskeletalBoolean"=false and "CardiovascularBoolean"=false and "NeurologicalBoolean"=false and "WoundsBoolean"=false and "AttendantBoolean"=false and "MentalBoolean"=false) then 'Other issues' else null)
    }
    except {null}

define AmbulanceSupplier:
	First([Organization] org
        with (ServiceRequest.performer) P
        such that P.reference.value = ('Organization/' + org.id.value))


define "AmbulanceSupplierName":
	"AmbulanceSupplier".name.value

define "AmbulanceSupplierNPI":
    First("AmbulanceSupplier".identifier).value.value

define "AmbulanceSupplierAddressObject":
	First("AmbulanceSupplier".address)

define "SupplierAddressLine":
  if exists(AmbulanceSupplierAddressObject.line)
	then (if Length(AmbulanceSupplierAddressObject.line)>1
				then (AmbulanceSupplierAddressObject.line[0].value+', '+AmbulanceSupplierAddressObject.line[1].value)
				else AmbulanceSupplierAddressObject.line[0].value)
	else ''

define "SupplierAddressCity":
	AmbulanceSupplierAddressObject.city.value

define "SupplierAddressState":
	AmbulanceSupplierAddressObject.state.value

define "SupplierAddressPostalCode":
	AmbulanceSupplierAddressObject.postalCode.value

define "NumofTransports":
    (ServiceRequest.quantity as Quantity).value.value

define "StartDate":
    start of "Normalize Interval"(ServiceRequest.occurrence)

define "DialysisReason":
    ServiceRequest.reasonCode R where exists(R.coding c where c in "Dialysis Services")

define "WoundCareReason":
    ServiceRequest.reasonCode R where exists(R.coding c where c in "Wound Care SM CT")

define "RadiationTherapyReason":
    ServiceRequest.reasonCode R where exists(R.coding c where c in "Radiation Therapy II")

define "ChemotherapyReason":
    ServiceRequest.reasonCode R where exists(R.coding c where c in "Chemotherapy")

define "ImagingReason":
    ServiceRequest.reasonCode R where exists(R.coding c where c in "Imaging_Lumbar")

define "PurposeOfTransport":
    {
    (if Last("DialysisReason") is not null then 'Dialysis' else null),
    (if Last("WoundCareReason") is not null then 'Wound care' else null),
    (if Last("RadiationTherapyReason") is not null then 'Radiation therapy' else null),
    (if Last("ChemotherapyReason") is not null then 'Chemotherapy' else null),
    (if Last("ImagingReason") is not null then 'Imaging' else null),
    (if (Last("DialysisReason") is null and Last("WoundCareReason") is null and Last("RadiationTherapyReason") is null and Last("ChemotherapyReason") is null and Last("ImagingReason") is null) then 'Other' else null)
    }
    except {null}

define "OtherPurpose":
    //if (Last("DialysisReason") is null and Last("WoundCareReason") is null and Last("RadiationTherapyReason") is null and Last("ChemotherapyReason") is null and Last("ImagingReason") is null)
    ServiceRequest.reasonCode R
    return (First(R.coding).display.value)+'\n'
    //else null

define "EncounterResource":
    Last([Encounter])

define "LocationFromObject":
	First([Location] L
	where 'Location/' + L.id.value = "EncounterResource".hospitalization.origin.reference.value)

define "TransportFrom":
    "LocationFromObject".address.line[0].value +', ' +"LocationFromObject".address.city.value +', ' +"LocationFromObject".address.state.value+', ' +"LocationFromObject".address.postalCode.value

define "LocationToObject":
	First([Location] L
	with "EncounterResource".location S
	such that ('Location/' + L.id.value) = S.location.reference.value)

define "TransportTo":
    "LocationToObject".address.line[0].value +', ' +"LocationToObject".address.city.value +', ' +"LocationToObject".address.state.value+', ' +"LocationToObject".address.postalCode.value

define function "Normalize Interval"(choice Choice<FHIR.dateTime, FHIR.Period>):
    if choice is FHIR.dateTime then
        Interval[FHIRHelpers.ToDateTime(choice as FHIR.dateTime), FHIRHelpers.ToDateTime(choice as FHIR.dateTime)]
    else if choice is FHIR.Period then
        FHIRHelpers.ToInterval(choice as FHIR.Period)
    else null

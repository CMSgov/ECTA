library SupportSurfaceGroup version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Stage 3 and 4 Pressure Ulcer Injury Trunk or Pelvis": 'Stage3and4PressureUlcerInjuryTrunkOrPelvis'
valueset "Stage 3 and 4 Pressure Ulcer Injury Codes": 'Stage3and4PressureUlcerInjuryCodes'
valueset "Stage 2 Pressure Ulcer Injury Codes": 'Stage2PressureUlcerInjuryCodes'
valueset "Any Stage Pressure Ulcer Injury Codes": 'AnyStagePressureUlcerInjury'
valueset "Group 1 Codes": 'Group1Codes'
valueset "Group 2 Codes": 'Group2Codes'
valueset "Group 3 Codes": 'Group3Codes'
valueset "Complete Immobility": 'CompleteImmobility'
valueset "Impaired Mobility": 'ImpairedMobility'
valueset "Pain": 'Pain'
valueset "Paralysis": 'Paralysis'
valueset "Superficial Pressure": 'SuperficialPressure'
valueset "Deep Pressure": 'DeepPressure'
valueset "Compromised Circulatory": 'CompromisedCirculatory'
valueset "Fecal Urinary Incontinence": 'FecalUrinaryIncontinence'
valueset "Nutrition Impaired": 'NutritionImpaired'

code "15734": '15734' from "HCPCS" display 'Muscle, myocutaneous  flap; trunk'
code "Muscle, myocutaneous  flap; pelvis": 'Muscle, myocutaneous  flap; pelvis' from "HCPCS" display 'Muscle, myocutaneous  flap; pelvis'
code "1500": '1500' from "HCPCS" display 'Skin graft to trunk'
code "291162": '291162' from "HCPCS" display 'Skin graft to pelvis'
code "130985008": '130985008' from "SNOMED-CT" display 'Disturbed sensory perception'

parameter "Encounter" Encounter
parameter "DeviceRequest" DeviceRequest
parameter "Practitioner" Practitioner
parameter "PractitionerRole" PractitionerRole

context Patient

define "SupportSurfaceGroup":
    if "Group1Item" is not null
        then 'Group 1'
    else if "Group2Item" is not null
        then 'Group 2'
    else if "Group3Item" is not null
        then 'Group 3'
    else null

define "Group1Item":
    if (FHIRHelpers.ToCode(First("DeviceRequest".code.coding)) in "Group 1 Codes")
        then FHIRHelpers.ToCode(First("DeviceRequest".code.coding))
    else null

define "Group2Item":
    if (FHIRHelpers.ToCode(First("DeviceRequest".code.coding)) in "Group 2 Codes")
        then FHIRHelpers.ToCode(First("DeviceRequest".code.coding))
    else null

define "Group3Item":
    if (FHIRHelpers.ToCode(First("DeviceRequest".code.coding)) in "Group 3 Codes")
        then FHIRHelpers.ToCode(First("DeviceRequest".code.coding))
    else null

define "AnyStagePressureUlcerInjury": 
    (([Condition]C where FHIRHelpers.ToCode(First(C.code.coding)) in "Any Stage Pressure Ulcer Injury Codes")Covered
		where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed')AnyStageCondition
        return FHIRHelpers.ToCode(First(AnyStageCondition.code.coding))

define "MultipleStage2PressureUlcerInjury":
    (([Condition]C where FHIRHelpers.ToCode(First(C.code.coding)) in "Stage 2 Pressure Ulcer Injury Codes")Covered
		where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed')Stage2Condition
        return FHIRHelpers.ToCode(First(Stage2Condition.code.coding))

define "Stage34PressureUlcerInjuryTrunkOrPelvis":
    (([Condition]C where FHIRHelpers.ToCode(First(C.code.coding)) in "Stage 3 and 4 Pressure Ulcer Injury Trunk or Pelvis")Covered
		where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed')Stage3TrunkPelvisCondition
        return FHIRHelpers.ToCode(First(Stage3TrunkPelvisCondition.code.coding))

define "Stage34PressureUlcerInjury":
    (([Condition]C where FHIRHelpers.ToCode(First(C.code.coding)) in "Stage 3 and 4 Pressure Ulcer Injury Codes")Covered
		where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed')Stage3Condition
        return FHIRHelpers.ToCode(First(Stage3Condition.code.coding))

define "BeneficiaryMobility":
    if First(([Condition]C where FHIRHelpers.ToCode(First(C.code.coding)) in "Complete Immobility")Covered
			 where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed') is not null
        then System.Code{ code: 'Criteria1CompletelyImmobile', display: 'Criteria 1: Completely immobile, cannot makes changes without assistance.'}
    else if First(([Condition]C where FHIRHelpers.ToCode(First(C.code.coding)) in "Impaired Mobility")Covered
			 where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed') is not null
        then System.Code{ code: 'Criteria2LimitedMobility', display: 'Criteria 2: Limited mobility, cannot make changes significant enough to alleviate pressure without assistance.  Provider Note: The medical record must document the severity of the condition sufficiently to demonstrate the medical necessity for a PRSS.'}
    else if "AnyStagePressureUlcerInjury" is not null
        then System.Code{ code: 'Criteria3AnyStagePressureUlcer', display: 'Criteria 3: Any stage pressure ulcer/injury on the trunk or pelvis. Provider Note: The medical record must document the severity of the condition sufficiently to demonstrate the medical necessity for a PRSS.'}
    else null


define "Group2Criteria":
    if exists("MultipleStage2PressureUlcerInjury")
        then System.Code{ code: 'Criteria1MultipleStage2PressureUlcers', display: 'Criteria 1: Multiple stage 2 pressure ulcers located on the trunk or pelvis, which have failed to improve over the past month.'}
    else if exists("Stage34PressureUlcerInjuryTrunkOrPelvis")
        then System.Code{ code: 'Criteria2MultipleStage3or4PressureUlcer', display: 'Criteria 2: Has multiple stage 3 or 4 pressure ulcer(s)/injury(s) on the trunk or pelvis.'}
    else null

define "PainResource":
  First(([Condition]C
		where FHIRHelpers.ToCode(First(C.code.coding)) in "Pain") Covered
			 where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed')

define "ParalysisResource":
  First(([Condition]C
		where FHIRHelpers.ToCode(First(C.code.coding)) in "Paralysis")Covered
			 where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed')

define "SuperficialPressureResource":
  First(([Condition]C
		where FHIRHelpers.ToCode(First(C.code.coding)) in "Superficial Pressure")Covered
			 where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed')

define "DeepPressureResource":
  First(([Condition]C
		where FHIRHelpers.ToCode(First(C.code.coding)) in "Deep Pressure")Covered
			 where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed')

define "AlteredSensoryPerceptions":
{
    (if "PainResource" is not null
        then 'Pain' else ''),
    (if "ParalysisResource" is not null
        then 'Paralysis' else ''),
    (if "SuperficialPressureResource" is not null
        then 'Loss of sensitivity to superficial pressure' else ''),
    (if "DeepPressureResource" is not null
        then 'Loss of sensitivity to deep pressure' else '')
}

define "CompromisedCirculatoryStatus":
  First(([Condition]C
		where FHIRHelpers.ToCode(First(C.code.coding)) in "Compromised Circulatory")Covered
			 where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed')

define "CompromisedCirculatoryStatusNotes":
    if "CompromisedCirculatoryStatus" is not null
        then if FHIRHelpers.ToString(First(("CompromisedCirculatoryStatus").note.text)) is not null
            then FHIRHelpers.ToString(First(("CompromisedCirculatoryStatus").note.text))
        else First("CompromisedCirculatoryStatus".code.coding).display.value
    else null

define "FecalUrinaryIncontinence":
  First(([Condition]C
		where FHIRHelpers.ToCode(First(C.code.coding)) in "Fecal Urinary Incontinence")Covered
			 where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed')

define "ImpairedNutritionalStatus":
  First(([Condition]C
		where FHIRHelpers.ToCode(First(C.code.coding)) in "Nutrition Impaired")Covered
			 where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed')

define "Group1OtherConditions":
{
    if ("PainResource" is not null or "ParalysisResource" is not null or "SuperficialPressureResource" is not null or "DeepPressureResource" is not null)
        then 'Altered sensory perception' else null,
    if "CompromisedCirculatoryStatus" is not null
        then 'Compromised circulatory status' else null,
    if "FecalUrinaryIncontinence" is not null
        then 'Fecal or urinary incontinence' else null,
    if "ImpairedNutritionalStatus" is not null
        then 'Impaired nutritional status' else null
}

define "Group1TypeOfRequest":
    'Initial'

define "Group2TypeOfRequest":
    'Initial'

define "Group3TypeOfRequest":
    'Initial'

define "DeviceRequestDescription":
  'HCPCS ' + First("DeviceRequest".code.coding).code.value + ' - ' + First("DeviceRequest".code.coding).display.value

define "DeviceOrderDate":
    FHIRHelpers.ToDateTime("DeviceRequest".authoredOn)

define "DeviceQuantity":
    if First("DeviceRequest".parameter).value is FHIR.Quantity
        then FHIRHelpers.ToDecimal((First("DeviceRequest".parameter).value as FHIR.Quantity).value)
    else 1.0

define TreatingPractitioner:
	singleton from ([Practitioner])

define PractitionerName:
    First("TreatingPractitioner".name name)

define PractitionerLastName:
	"PractitionerName".family.value

define PractitionerMiddleInitial:
  	Substring(Combine(("PractitionerName".given given return Substring(given.value,0,1)),', '),3)

define "PractitionerFirstName":
	"PractitionerName".given[0].value

define "PractitionerFullName":
  	Coalesce("PractitionerFirstName" + ' ' + "PractitionerMiddleInitial" + ' ' + "PractitionerLastName", "PractitionerFirstName" + ' ' + "PractitionerLastName")

define "PractitionerNPI": (First(
  	"TreatingPractitioner".identifier identifier
    		where identifier.system.value = 'http://hl7.org/fhir/sid/us-npi')).value.value


define function "Normalize Interval"(choice Choice<FHIR.dateTime,FHIR.Period>):
 	 if choice is FHIR.dateTime then
 		  Interval[FHIRHelpers.ToDateTime(choice as FHIR.dateTime), FHIRHelpers.ToDateTime(choice as FHIR.dateTime)]
	 else if choice is FHIR.Period then
		  FHIRHelpers.ToInterval(choice as FHIR.Period)
	 else null

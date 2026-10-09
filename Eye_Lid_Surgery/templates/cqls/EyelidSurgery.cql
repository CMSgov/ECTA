library EyelidSurgery version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "PrimaryConditionsFor15820and15821" : 'PrimaryConditionsFor15820and15821'
valueset "PrimaryConditionsForOther" : 'PrimaryConditionsForOther'
valueset "ChronicDermatitisConditions": 'ChronicDermatitisConditions'
valueset "BlepharochalasisConditions": 'BlepharochalasisConditions'
valueset "ConditionSeverityConditions": 'ConditionSeverityConditions'
valueset "AllergicContactDermatitisOfEyelidConditions": 'AllergicContactDermatitisOfEyelidConditions'
valueset "ThyroidEyeDiseaseConditions": 'ThyroidEyeDiseaseConditions'
valueset "BlepharitisConditions": 'BlepharitisConditions'
valueset "InflammationOfEyelidConditions": 'InflammationOfEyelidConditions'
valueset "IrritantContactDermatitisConditions": 'IrritantContactDermatitisConditions'
valueset "AnophthalmosConditions": 'AnophthalmosConditions'
valueset "MicrophthalmosConditions": 'MicrophthalmosConditions'
valueset "EnophthalmosConditions": 'EnophthalmosConditions'
valueset "PtosisOfEyelidConditions": 'PtosisOfEyelidConditions'

valueset "SwellingOfEyelidObservations": 'SwellingOfEyelidObservations'
valueset "InterferenceWithVisionObservations": 'InterferenceWithVisionObservations'
valueset "VisualFieldDefectObservations": 'VisualFieldDefectObservations'
valueset "DifficultyPerformingActivityOfDailyLivingObservations": 'DifficultyPerformingActivityOfDailyLivingObservations'
valueset "ExcessSkinOfEyelidObservations": 'ExcessSkinOfEyelidObservations'
valueset "DifficultyUsingSpectaclesObservations": 'DifficultyUsingSpectaclesObservations'
valueset "DermatochalasisOfLeftEyelidObservations": 'DermatochalasisOfLeftEyelidObservations'
valueset "DermatochalasisOfRightEyelidObservations": 'DermatochalasisOfRightEyelidObservations'
valueset "DermatochalasisOfBilateralUpperEyelidsObservations": 'DermatochalasisOfBilateralUpperEyelidsObservations'
valueset "DermatochalasisOfBilateralLowerEyelidsObservations": 'DermatochalasisOfBilateralLowerEyelidsObservations'
valueset "PainObservations": 'PainObservations'
valueset "DifficultyReadingObservations": 'DifficultyReadingObservations'
valueset "DifficultyUsingPersonalComputerObservations": 'DifficultyUsingPersonalComputerObservations'
valueset "DifficultyWithPerformingWorkActivitiesObservations": 'DifficultyWithPerformingWorkActivitiesObservations'
valueset "HeavyFeelingInEyelidsObservations": 'HeavyFeelingInEyelidsObservations'
valueset "FindingRelatedToAbilityToPutOnProsthesisObservations": 'FindingRelatedToAbilityToPutOnProsthesisObservations'
valueset "ProlapseObservations": 'ProlapseObservations'

valueset "SteroidTherapyProcedures": 'SteroidTherapyProcedures'
valueset "TapingOfEyelidProcedures": 'TapingOfEyelidProcedures'
valueset "PrescribingFittingAndSupplyOfOcularProsthesisProcedures":  'PrescribingFittingAndSupplyOfOcularProsthesisProcedures'

valueset "ThyroidMedications": 'ThyroidMedications'

parameter "ServiceRequest" ServiceRequest
parameter "QuestionnaireResponse" QuestionnaireResponse

context Patient

define function DisplayAnswer(label String):
	FHIR.Coding {
		display: FHIR.string { value: label }
	}

define Request:
	"ServiceRequest"

define BlepharoplastyRequest:
	First([ServiceRequest])

define "ServiceRequestCode":
    FHIRHelpers.ToCode(First("BlepharoplastyRequest".code.coding))

define BlepharoplastyEncounter:
	First([Encounter]E where 'Encounter/' + E.id.value = "BlepharoplastyRequest".encounter.reference.value)

define PresentingConditionOrChiefComplaintCodes:
	{
		(
			if (
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "ChronicDermatitisConditions")) is not null and 
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "BlepharochalasisConditions")) is not null and 
				(
					First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "AllergicContactDermatitisOfEyelidConditions") and First(C.severity.coding).code = '24484000') is not null or
					First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "ThyroidEyeDiseaseConditions") and First(C.severity.coding).code = '24484000') is not null
				)
			) then 'chronic-dermatitis'
			else ''
		), 
		( 
			if (
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "BlepharitisConditions")) is not null or 
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "InflammationOfEyelidConditions")) is not null or 
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "SwellingOfEyelidObservations")) is not null or 
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "IrritantContactDermatitisConditions") and First(C.severity.coding).code = '24484000') is not null
			) then 'eyelid-irritation'
			else ''
		), 
		(
			if ( 
				First([Procedure]P where (FHIRHelpers.ToCode(First(P.code.coding)) in "PrescribingFittingAndSupplyOfOcularProsthesisProcedures")) is not null and 
				(
					First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "AnophthalmosConditions")) is not null or
					First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "MicrophthalmosConditions")) is not null or
					First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "EnophthalmosConditions")) is not null
				)
			 ) then 'difficulty-fitting-prosthesis'
			else ''
		), 
		( 	
			if ( 
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "InterferenceWithVisionObservations")) is not null or 
				(
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "InterferenceWithVisionObservations")) is not null and
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyPerformingActivityOfDailyLivingObservations")) is not null
				) or 
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "ExcessSkinOfEyelidObservations")) is not null or 
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "ProlapseObservations")) is not null or 
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "PtosisOfEyelidConditions")) is not null 
			 ) then 'interference-with-vision'
			else ''
		), 
		( 
			if ( 
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyUsingSpectaclesObservations")) is not null and 
				(
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DermatochalasisOfLeftEyelidObservations")) is not null or
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DermatochalasisOfRightEyelidObservations")) is not null or
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DermatochalasisOfBilateralUpperEyelidsObservations")) is not null or
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DermatochalasisOfBilateralLowerEyelidsObservations")) is not null
				)
			)	then 'difficulty-fitting-spectacles'
			else ''
		) 
  	}

define PresentingConditionOrChiefComplaint:
	({
		if 'chronic-dermatitis' in PresentingConditionOrChiefComplaintCodes
			then DisplayAnswer('Chronic dermatitis due to blepharochalasis from severe allergies or thyroid disease')
			else null,
		if 'eyelid-irritation' in PresentingConditionOrChiefComplaintCodes
			then DisplayAnswer('Debilitating eyelid irritation')
			else null,
		if 'difficulty-fitting-prosthesis' in PresentingConditionOrChiefComplaintCodes
			then DisplayAnswer('Difficulty fitting or wearing a prosthesis when associated with an anophthalmic, microphthalmic, or enophthalmic socket')
			else null,
		if 'interference-with-vision' in PresentingConditionOrChiefComplaintCodes
			then DisplayAnswer('Interference with vision or visual field that impacts an activity of daily living (such as difficulty reading or driving), looking through the eyelashes, seeing the upper eyelid skin, or brow fatigue')
			else null,
		if 'difficulty-fitting-spectacles' in PresentingConditionOrChiefComplaintCodes
			then DisplayAnswer('Significant/extreme difficulty fitting spectacles due to excessive eyelid tissue')
			else null
	}) Answer
		where Answer is not null

define PrimaryDiagnosisFor15820and15821:
	if (ServiceRequestCode.code = '15820' or ServiceRequestCode.code = '15821') then FHIRHelpers.ToCode(First(First([Condition]C
		 where FHIRHelpers.ToCode(First(C.code.coding)) in "PrimaryConditionsFor15820and15821").code.coding))
	else null

define PrimaryDiagnosisForOther:
	if (ServiceRequestCode.code != '15820'and ServiceRequestCode.code != '15821') then FHIRHelpers.ToCode(First(First([Condition]C
		 where FHIRHelpers.ToCode(First(C.code.coding)) in "PrimaryConditionsForOther").code.coding))
	else null

define AdditionalDiagnosisForOther:
	if (ServiceRequestCode.code != '15820'and ServiceRequestCode.code != '15821' and (PrimaryDiagnosisForOther.code = 'H02.32​'or PrimaryDiagnosisForOther.code != 'H02.35​' or PrimaryDiagnosisForOther.code = 'H02.32​'or PrimaryDiagnosisForOther.code != 'H02.35​')) then FHIRHelpers.ToCode(First(First([Condition]C
		 where FHIRHelpers.ToCode(First(C.code.coding)) in "PrimaryConditionsFor15820and15821").code.coding))
	else null

define ProviderObjectiveSymptomsCodes:
	{
		(
			if (
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "ChronicDermatitisConditions")) is not null and 
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "BlepharochalasisConditions")) is not null 
			) then 'CHRONIC_DERMATITIS_BLEPHAROCHALASIS'
			else ''
		), 
		( 
			if (
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "BlepharitisConditions")) is not null or 
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "InflammationOfEyelidConditions")) is not null or 
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "SwellingOfEyelidObservations")) is not null or 
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "IrritantContactDermatitisConditions") and First(C.severity.coding).code = '24484000') is not null
			) then 'DEBILITATING_EYELID_IRRITATION_PAIN'
			else ''
		), 
		(
			if ( 
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyReadingObservations")) is not null and
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "InterferenceWithVisionObservations")) is not null
			 ) then 'DIFFICULTY_READING'
			else ''
		), 
		(
			if First([Observation]O where FHIRHelpers.ToCode(First(O.code.coding)) in "VisualFieldDefectObservations") is not null
				then 'DIFFICULTY_SEEING_OVERHEAD_SIGNS'
			else ''
		),
		( 	
			if ( 
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "ExcessSkinOfEyelidObservations")) is not null and 
				First([Procedure]P where (FHIRHelpers.ToCode(First(P.code.coding)) in "PrescribingFittingAndSupplyOfOcularProsthesisProcedures")) is not null and  
				(
					First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "AnophthalmosConditions")) is not null or
					First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "MicrophthalmosConditions")) is not null or
					First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "EnophthalmosConditions")) is not null
				)
			 ) then 'INTERFERES_WITH_OCULAR_PROSTHESIS'
			else ''
		), 
		( 
			if ( 
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyUsingSpectaclesObservations")) is not null and 
				(
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DermatochalasisOfLeftEyelidObservations")) is not null or
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DermatochalasisOfRightEyelidObservations")) is not null or
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DermatochalasisOfBilateralUpperEyelidsObservations")) is not null or
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DermatochalasisOfBilateralLowerEyelidsObservations")) is not null
				)
			)	then 'INTERFERES_WITH_SPECTACLES'
			else ''
		) , 
		( 
			if ( 
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "InterferenceWithVisionObservations")) is not null and 
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyPerformingActivityOfDailyLivingObservations")) is not null and
				(
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "ExcessSkinOfEyelidObservations")) is not null or 
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "ProlapseObservations")) is not null or 
					First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "PtosisOfEyelidConditions")) is not null 
				)
			)	then 'INTERFERES_WITH_ADL'
			else ''
		) 
	  	}

define ProviderObjectiveSymptoms:
	({
		if 'CHRONIC_DERMATITIS_BLEPHAROCHALASIS' in ProviderObjectiveSymptomsCodes
			then DisplayAnswer('Chronic dermatitis due to blepharochalasis')
			else null,
		if 'DEBILITATING_EYELID_IRRITATION_PAIN' in ProviderObjectiveSymptomsCodes
			then DisplayAnswer('Debilitating eyelid irritation/pain')
			else null,
		if 'DIFFICULTY_READING' in ProviderObjectiveSymptomsCodes
			then DisplayAnswer('Difficulty reading')
			else null,
		if 'DIFFICULTY_SEEING_OVERHEAD_SIGNS' in ProviderObjectiveSymptomsCodes
			then DisplayAnswer('Difficulty seeing top lines, overhead signs')
			else null,
		if 'INTERFERES_WITH_OCULAR_PROSTHESIS' in ProviderObjectiveSymptomsCodes
			then DisplayAnswer('Excessive tissue interferes with ocular prosthesis')
			else null,
		if 'INTERFERES_WITH_SPECTACLES' in ProviderObjectiveSymptomsCodes
			then DisplayAnswer('Excessive tissue interferes with spectacles fitting')
			else null,
		if 'INTERFERES_WITH_ADL' in ProviderObjectiveSymptomsCodes
			then DisplayAnswer('Interferes with activities of daily living')
			else null
	}) Answer
		where Answer is not null

define FailedConservativeTreatments:
	({
		if First([Procedure]P where FHIRHelpers.ToCode(First(P.code.coding)) in "SteroidTherapyProcedures"
			and First(P.complication.coding).code = '6064005'
			and First(P.bodySite.coding).code = '80243003') is not null
			then DisplayAnswer('Topical medications')
			else null,
		if 'chronic-dermatitis' in PresentingConditionOrChiefComplaintCodes
			then DisplayAnswer('Allergy control')
			else null,
		if 'chronic-dermatitis' in PresentingConditionOrChiefComplaintCodes
			or First([Medication]M where FHIRHelpers.ToCode(First(M.code.coding)) in ThyroidMedications) is not null
			then DisplayAnswer('Thyroid treatment')
			else null
	}) Answer
		where Answer is not null

define BeneficiaryReportedSymptomsCodes:
	{
		(
			if (
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "HeavyFeelingInEyelidsObservations")) is not null
			) then 'UPPER_EYELID_HEAVINESS'
			else ''
		), 
		( 
			if ( 
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "InterferenceWithVisionObservations")) is not null and 
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyPerformingActivityOfDailyLivingObservations")) is not null and
				(
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "ExcessSkinOfEyelidObservations")) is not null or 
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "ProlapseObservations")) is not null or 
					First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "PtosisOfEyelidConditions")) is not null 
				)
			)	then 'INTERFERES_WITH_ADL'
			else ''
		), 
		(
			if ( 
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "InterferenceWithVisionObservations")) is not null and
					(
						First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyReadingObservations")) is not null or 
						First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyUsingPersonalComputerObservations")) is not null
					)
			 ) then 'DIFFICULTY_READING_OR_COMPUTER_WORK'
			else ''
		),
		(
			if ( 
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyWithPerformingWorkActivitiesObservations")) is not null and
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "InterferenceWithVisionObservations")) is not null
			 ) then 'DIFFICULTIES_AT_WORK_VISUAL_LIMITATIONS'
			else ''
		), 
		( 
			if (
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "BlepharitisConditions")) is not null or 
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "InflammationOfEyelidConditions")) is not null or 
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "SwellingOfEyelidObservations")) is not null or 
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "IrritantContactDermatitisConditions") and First(C.severity.coding).code = '24484000') is not null
			) then 'DEBILITATING_EYELID_IRRITATION_PAIN'
			else ''
		)
	}

define BeneficiaryReportedSymptoms:
	({
		if 'UPPER_EYELID_HEAVINESS' in BeneficiaryReportedSymptomsCodes
			then DisplayAnswer('Heaviness in upper eyelids')
			else null,
		if 'INTERFERES_WITH_ADL' in BeneficiaryReportedSymptomsCodes
			then DisplayAnswer('Condition interferes with activities of daily living')
			else null,
		if 'DIFFICULTY_READING_OR_COMPUTER_WORK' in BeneficiaryReportedSymptomsCodes
			then DisplayAnswer('Difficulties reading (can’t see top lines of text) or Difficulties performing computer work')
			else null,
		if 'DIFFICULTIES_AT_WORK_VISUAL_LIMITATIONS' in BeneficiaryReportedSymptomsCodes
			then DisplayAnswer('Difficulties at work due to visual limitations')
			else null,
		if 'DEBILITATING_EYELID_IRRITATION_PAIN' in BeneficiaryReportedSymptomsCodes
			then DisplayAnswer('Debilitating eyelid irritation/pain')
			else null
	}) Answer
		where Answer is not null

define BeneficiaryReportedSymptomsCCodes:
	{
		(
			if (
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "HeavyFeelingInEyelidsObservations")) is not null
			) then 'UPPER_EYELID_HEAVINESS'
			else ''
		), 
		( 
			if ( 
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "InterferenceWithVisionObservations")) is not null and 
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyPerformingActivityOfDailyLivingObservations")) is not null and
				(
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "ExcessSkinOfEyelidObservations")) is not null or 
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "ProlapseObservations")) is not null or 
					First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "PtosisOfEyelidConditions")) is not null 
				)
			)	then 'INTERFERES_WITH_ADL'
			else ''
		), 
		(
			if ( 
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "InterferenceWithVisionObservations")) is not null and
					(
						First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyReadingObservations")) is not null or 
						First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyUsingPersonalComputerObservations")) is not null
					)
			 ) then 'DIFFICULTY_READING_OR_COMPUTER_WORK'
			else ''
		),
		(
			if ( 
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyWithPerformingWorkActivitiesObservations")) is not null and
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "InterferenceWithVisionObservations")) is not null
			 ) then 'DIFFICULTIES_AT_WORK_VISUAL_LIMITATIONS'
			else ''
		), 
		( 
			if (
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "BlepharitisConditions")) is not null or 
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "InflammationOfEyelidConditions")) is not null or 
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "SwellingOfEyelidObservations")) is not null or 
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "IrritantContactDermatitisConditions") and First(C.severity.coding).code = '24484000') is not null
			) then 'DEBILITATING_EYELID_IRRITATION_PAIN'
			else ''
		), 
		(
			if ( 
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "FindingRelatedToAbilityToPutOnProsthesisObservations")) is not null and
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "ExcessSkinOfEyelidObservations")) is not null
			 ) then 'PROSTHESIS_WONT_STAY_IN_PLACE'
			else ''
		), 
		(
			if ( 
				First([Procedure]P where (FHIRHelpers.ToCode(First(P.code.coding)) in "PrescribingFittingAndSupplyOfOcularProsthesisProcedures")) is not null and 
				(
					First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "AnophthalmosConditions")) is not null or
					First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "MicrophthalmosConditions")) is not null or
					First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "EnophthalmosConditions")) is not null
				)
			 ) then 'CANNOT_FIT_PROSTHESIS_DUE_TO_EYELID_ANATOMY'
			else ''
		),
		(
			if ( 
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "FindingRelatedToAbilityToPutOnProsthesisObservations")) is not null and
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "ExcessSkinOfEyelidObservations")) is not null
			 ) then 'PROSTHESIS_IRRITATION_OR_DISPLACEMENT'
			else ''
		)
		
		,
		(
			if ( 
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyUsingSpectaclesObservations")) is not null and
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "ExcessSkinOfEyelidObservations")) is not null
			 ) then 'FUNCTIONAL_IMPAIRMENT_DUE_TO_INABILITY_TO_WEAR_GLASSES'
			else ''
		),
		(
			if ( 
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyUsingSpectaclesObservations")) is not null and
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "ExcessSkinOfEyelidObservations")) is not null
			 ) then 'FUNCTIONAL_IMPAIRMENT_DUE_TO_INABILITY_TO_WEAR_GLASSES'
			else ''
		),
		(
			if ( 
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyUsingSpectaclesObservations")) is not null and
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "ExcessSkinOfEyelidObservations")) is not null
			 ) then 'FUNCTIONAL_IMPAIRMENT_DUE_TO_INABILITY_TO_WEAR_GLASSES'
			else ''
		),
		( 
			if ( 'chronic-dermatitis' in PresentingConditionOrChiefComplaintCodes) then 'ALLERGY_CONTROL'
			else ''
		), 
		(
			if ( 
				'chronic-dermatitis' in PresentingConditionOrChiefComplaintCodes or
				First([Medication]M where FHIRHelpers.ToCode(First(M.code.coding)) in "ThyroidMedications") is not null
			 ) then 'THYROID_TREATMENT'
			else ''
		)
	}

	define BeneficiaryReportedSymptomsC:
	({
		if 'UPPER_EYELID_HEAVINESS' in BeneficiaryReportedSymptomsCCodes
			then DisplayAnswer('Heaviness in upper eyelids')
			else null,
		if 'INTERFERES_WITH_ADL' in BeneficiaryReportedSymptomsCCodes
			then DisplayAnswer('Condition interferes with activities of daily living')
			else null,
		if 'DIFFICULTY_READING_OR_COMPUTER_WORK' in BeneficiaryReportedSymptomsCCodes
			then DisplayAnswer('Difficulties reading (can’t see top lines of text) or Difficulties performing computer work')
			else null,
		if 'DIFFICULTIES_AT_WORK_VISUAL_LIMITATIONS' in BeneficiaryReportedSymptomsCCodes
			then DisplayAnswer('Difficulties at work due to visual limitations')
			else null,
		if 'DEBILITATING_EYELID_IRRITATION_PAIN' in BeneficiaryReportedSymptomsCCodes
			then DisplayAnswer('Debilitating eyelid irritation/pain')
			else null,
		if 'PROSTHESIS_WONT_STAY_IN_PLACE' in BeneficiaryReportedSymptomsCCodes
			then DisplayAnswer('Prosthesis won''t stay in place due to eyelid tissue')
			else null,
		if 'CANNOT_FIT_PROSTHESIS_DUE_TO_EYELID_ANATOMY' in BeneficiaryReportedSymptomsCCodes
			then DisplayAnswer('Cannot properly fit the prosthesis because eyelid anatomy is preventing proper insertion')
			else null,
		if 'PROSTHESIS_IRRITATION_OR_DISPLACEMENT' in BeneficiaryReportedSymptomsCCodes
			then DisplayAnswer('Eyelid tissue is causing irritation or displacement of the prosthesis')
			else null
	}) Answer
		where Answer is not null

	define BeneficiaryReportedSymptomsECodes:
		{
		(
			if (
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "HeavyFeelingInEyelidsObservations")) is not null
			) then 'UPPER_EYELID_HEAVINESS'
			else ''
		), 
		( 
			if ( 
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "InterferenceWithVisionObservations")) is not null and 
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyPerformingActivityOfDailyLivingObservations")) is not null and
				(
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "ExcessSkinOfEyelidObservations")) is not null or 
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "ProlapseObservations")) is not null or 
					First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "PtosisOfEyelidConditions")) is not null 
				)
			)	then 'INTERFERES_WITH_ADL'
			else ''
		), 
		(
			if ( 
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "InterferenceWithVisionObservations")) is not null and
					(
						First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyReadingObservations")) is not null or 
						First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyUsingPersonalComputerObservations")) is not null
					)
			 ) then 'DIFFICULTY_READING_OR_COMPUTER_WORK'
			else ''
		),
		(
			if ( 
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyWithPerformingWorkActivitiesObservations")) is not null and
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "InterferenceWithVisionObservations")) is not null
			 ) then 'DIFFICULTIES_AT_WORK_VISUAL_LIMITATIONS'
			else ''
		), 
		( 
			if (
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "BlepharitisConditions")) is not null or 
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "InflammationOfEyelidConditions")) is not null or 
				First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "SwellingOfEyelidObservations")) is not null or 
				First([Condition]C where (FHIRHelpers.ToCode(First(C.code.coding)) in "IrritantContactDermatitisConditions") and First(C.severity.coding).code = '24484000') is not null
			) then 'DEBILITATING_EYELID_IRRITATION_PAIN'
			else ''
		),
		(
			if ( 
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyUsingSpectaclesObservations")) is not null and
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "ExcessSkinOfEyelidObservations")) is not null
			 ) then 'SPECTACLES_WONT_STAY_IN_PLACE'
			else ''
		),
		(
			if ( 
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyUsingSpectaclesObservations")) is not null and
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "ExcessSkinOfEyelidObservations")) is not null
			 ) then 'SPECTACLES_IRRITATION_OR_DISPLACEMENT'
			else ''
		),
		(
			if ( 
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "DifficultyUsingSpectaclesObservations")) is not null and
					First([Observation]O where (FHIRHelpers.ToCode(First(O.code.coding)) in "ExcessSkinOfEyelidObservations")) is not null
			 ) then 'FUNCTIONAL_IMPAIRMENT_DUE_TO_INABILITY_TO_WEAR_GLASSES'
			else ''
		),
		( 
			if ( 'chronic-dermatitis' in PresentingConditionOrChiefComplaintCodes) then 'ALLERGY_CONTROL'
			else ''
		), 
		(
			if ( 
				'chronic-dermatitis' in PresentingConditionOrChiefComplaintCodes or
				First([Medication]M where FHIRHelpers.ToCode(First(M.code.coding)) in "ThyroidMedications") is not null
			 ) then 'THYROID_TREATMENT'
			else ''
		)
	}

	define BeneficiaryReportedSymptomsE:
	({
		if 'UPPER_EYELID_HEAVINESS' in BeneficiaryReportedSymptomsECodes
			then DisplayAnswer('Heaviness in upper eyelids')
			else null,
		if 'INTERFERES_WITH_ADL' in BeneficiaryReportedSymptomsECodes
			then DisplayAnswer('Condition interferes with activities of daily living')
			else null,
		if 'DIFFICULTY_READING_OR_COMPUTER_WORK' in BeneficiaryReportedSymptomsECodes
			then DisplayAnswer('Difficulties reading (can’t see top lines of text) or Difficulties performing computer work')
			else null,
		if 'DIFFICULTIES_AT_WORK_VISUAL_LIMITATIONS' in BeneficiaryReportedSymptomsECodes
			then DisplayAnswer('Difficulties at work due to visual limitations')
			else null,
		if 'DEBILITATING_EYELID_IRRITATION_PAIN' in BeneficiaryReportedSymptomsECodes
			then DisplayAnswer('Debilitating eyelid irritation/pain')
			else null,
		if 'SPECTACLES_WONT_STAY_IN_PLACE' in BeneficiaryReportedSymptomsECodes
			then DisplayAnswer('Spectacles won''t stay in place due to eyelid tissue')
			else null,
		if 'SPECTACLES_IRRITATION_OR_DISPLACEMENT' in BeneficiaryReportedSymptomsECodes
			then DisplayAnswer('Eyelid tissue is causing irritation or displacement of the spectacles')
			else null,
		if 'FUNCTIONAL_IMPAIRMENT_DUE_TO_INABILITY_TO_WEAR_GLASSES' in BeneficiaryReportedSymptomsECodes
			then DisplayAnswer('Evidence that the inability to wear glasses is causing functional impairment (can''t read, can''t drive safely, can''t perform job duties, etc.)')
			else null
	}) Answer
		where Answer is not null
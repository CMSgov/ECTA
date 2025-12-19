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

define Request:
	"ServiceRequest"

define BlepharoplastyRequest:
	First([ServiceRequest])

define "ServiceRequestCode":
    FHIRHelpers.ToCode(First("BlepharoplastyRequest".code.coding))

define BlepharoplastyEncounter:
	First([Encounter]E where 'Encounter/' + E.id.value = "BlepharoplastyRequest".encounter.reference.value)

define PresentingConditionOrChiefComplaint:
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

define ProviderObjectiveSymptoms:
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

define FailedConservativeTreatments:
	{
		(
			if (
				First([Procedure]P where (FHIRHelpers.ToCode(First(P.code.coding)) in "SteroidTherapyProcedures" and 
					First(P.complication.coding).code = '6064005' and 
					First(P.bodySite.coding).code = '80243003'
				)) is not null
			) then 'TOPICAL_MEDICATIONS'
			else ''
		), 
		( 
			if ( 'chronic-dermatitis' in PresentingConditionOrChiefComplaint) then 'ALLERGY_CONTROL'
			else ''
		), 
		(
			if ( 
				'chronic-dermatitis' in PresentingConditionOrChiefComplaint or
				First([Medication]M where FHIRHelpers.ToCode(First(M.code.coding)) in ThyroidMedications) is not null
			 ) then 'THYROID_TREATMENT'
			else ''
		)
	}

define BeneficiaryReportedSymptoms:
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

define BeneficiaryReportedSymptomsC:
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
			if ( 'chronic-dermatitis' in PresentingConditionOrChiefComplaint) then 'ALLERGY_CONTROL'
			else ''
		), 
		(
			if ( 
				'chronic-dermatitis' in PresentingConditionOrChiefComplaint or
				First([Medication]M where FHIRHelpers.ToCode(First(M.code.coding)) in "ThyroidMedications") is not null
			 ) then 'THYROID_TREATMENT'
			else ''
		)
	}

	define BeneficiaryReportedSymptomsE:
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
			if ( 'chronic-dermatitis' in PresentingConditionOrChiefComplaint) then 'ALLERGY_CONTROL'
			else ''
		), 
		(
			if ( 
				'chronic-dermatitis' in PresentingConditionOrChiefComplaint or
				First([Medication]M where FHIRHelpers.ToCode(First(M.code.coding)) in "ThyroidMedications") is not null
			 ) then 'THYROID_TREATMENT'
			else ''
		)
	}
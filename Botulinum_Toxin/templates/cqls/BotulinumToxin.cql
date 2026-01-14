library BotulinumToxin version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'


//Valuesets for Botox 
valueset "Contraindication Conditions": 'contraindication-conditions'
valueset "BotoxCodes": 'botulinum-toxin-codes'
valueset "Botox Covered Conditions": 'botolinumtoxin-covered-conditions'
valueset "Previous Medications Attempted": 'previous-medications-attempted'
valueset "Conventional Treatment Procedures": 'conventional-treatment-procedures'
valueset "Migrane Covered Diagnosis": 'migrane-conditions'

parameter "ServiceRequest" ServiceRequest

context Patient

define "BoToxinContraindication":
	if(First([Condition]S
		where exists(S.code.coding C where C in "Contraindication Conditions")
		  and First(S.clinicalStatus.coding).code.value = 'active'
			  and First(S.verificationStatus.coding).code.value = 'confirmed') is not null)
			  then First(First([Condition]S
				where exists(S.code.coding C where C in "Contraindication Conditions")
				and First(S.clinicalStatus.coding).code.value = 'active'
				and First(S.verificationStatus.coding).code.value = 'confirmed').code.coding).code 
	else 'NoContraindications'

define "BoToxinContraindicationCopy":
	if (First([Condition]C
		 where FHIRHelpers.ToCode(First(C.code.coding)) in "Contraindication Conditions") is not null ) then 
		 First((First([Condition]C
		 where FHIRHelpers.ToCode(First(C.code.coding)) in "Contraindication Conditions")).code.coding).code
	else 'NoContraindications'

define "OrderDate":
    "ServiceRequest".authoredOn

define "RequestedDate": 
	ToDate(start of "Normalize Interval"("ServiceRequest".occurrence))

define "ServiceRequestCode":
	if (FHIRHelpers.ToCode(First("ServiceRequest".code.coding)) in "BotoxCodes") then 
		 FHIRHelpers.ToCode(First("ServiceRequest".code.coding)).code
	else null

define "RequestedInjectionOccurence":
	if (First([Procedure]P
		 where FHIRHelpers.ToCode(First(P.code.coding)) in "BotoxCodes") is null ) then  'Initial injection'
	else null

define "CoveredDiagnosis": 
	if (First([Condition]C
		 where FHIRHelpers.ToCode(First(C.code.coding)) in "Botox Covered Conditions") is not null ) then 
		 First((First([Condition]C
		 where FHIRHelpers.ToCode(First(C.code.coding)) in "Botox Covered Conditions")).code.coding).code
	else null

define "MedicationsAttempted":
	if (First([Medication]M
		 where FHIRHelpers.ToCode(First(M.code.coding)) in "Previous Medications Attempted") is not null ) then 
		 First((First([Medication]M
		 where FHIRHelpers.ToCode(First(M.code.coding)) in "Previous Medications Attempted")).code.coding).code
	else null

define "ConventionalTreatmentProcedures":
	if (First([Procedure]P
		 where FHIRHelpers.ToCode(First(P.code.coding)) in "Conventional Treatment Procedures") is not null ) then 
		 First((First([Procedure]P
		 where FHIRHelpers.ToCode(First(P.code.coding)) in "Conventional Treatment Procedures")).code.coding).code
	else null


define "MigraneCoveredDiagnosis": 
	if (First([Condition]C
		 where FHIRHelpers.ToCode(First(C.code.coding)) in "Migrane Covered Diagnosis") is not null ) then 
		 First((First([Condition]C
		 where FHIRHelpers.ToCode(First(C.code.coding)) in "Migrane Covered Diagnosis")).code.coding).code
	else null


// Helper functions needed for this scope

define function "Normalize Interval"(onset Choice<FHIR.dateTime, FHIR.Age, FHIR.Period, FHIR.Range, FHIR.string>):
  if onset is FHIR.dateTime then Interval[FHIRHelpers.ToDateTime ( onset as FHIR.dateTime ), FHIRHelpers.ToDateTime ( onset as FHIR.dateTime )]
    else if onset is FHIR.Period then FHIRHelpers.ToInterval ( onset as FHIR.Period ) 
    else if onset is FHIR.Age then Interval[FHIRHelpers.ToDate ( Patient.birthDate ) + FHIRHelpers.ToQuantity ( onset as FHIR.Age ), FHIRHelpers.ToDate ( Patient.birthDate ) + FHIRHelpers.ToQuantity ( onset as FHIR.Age ) + 1 year ] 
    else null

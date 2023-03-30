library EyelidSurgery version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

valueset "Vision Interference": '2.16.840.1.113883.3.6037.1001.23.93.189'
valueset "Impairment Daily Activities": '2.16.840.1.113883.3.6037.1001.23.93.190'
valueset "Difficulty Wearing Spectacles": '2.16.840.1.113883.3.6037.1001.23.93.191'
valueset "Disorder of Eye": '2.16.840.1.113883.3.6037.1001.23.93.59'
valueset "Sockets": '2.16.840.1.113883.3.6037.1001.23.99.25'
valueset "Difficulty Wearing Prosthesis": '2.16.840.1.113883.3.6037.1001.23.93.192'
valueset "Lower Eyelid Blepharoplasty Codes": '2.16.840.1.113883.3.6037.1001.23.93.193'
valueset "Upper Eyelid Blepharoplasty Codes": '2.16.840.1.113883.3.6037.1001.23.93.194'
valueset "Dermatochalasis": '2.16.840.1.113883.3.6037.1001.23.93.195'
valueset "Thyroid Eye Diseases": '2.16.840.1.113883.3.6037.1001.23.93.196'
valueset "Chronic Dermatitis": '2.16.840.1.113883.3.6037.1001.23.93.197'
valueset "Blepharochalasis": '2.16.840.1.113883.3.6037.1001.23.93.198'
valueset "Blepharospasm Condition Codes": '2.16.840.1.113883.3.6037.1001.23.93.79'
valueset "Ptosis": '2.16.840.1.113883.3.6037.1001.23.93.199'
valueset "Brow Ptosis": '2.16.840.1.113883.3.6037.1001.23.93.200'
valueset "Blepharoptosis": '2.16.840.1.113883.3.6037.1001.23.93.201'
valueset "Left Eye Conditions for Eyelid Surgery": '2.16.840.1.113883.3.6037.1001.23.93.202'
valueset "Right Eye Conditions for Eyelid Surgery": '2.16.840.1.113883.3.6037.1001.23.93.203'
valueset "Bilateral Eye Conditions for Eyelid Surgery": '2.16.840.1.113883.3.6037.1001.23.93.204'
valueset "Margin reflex distance": '2.16.840.1.113883.3.6037.1001.23.99.24'
valueset "Edema of eyelids": '2.16.840.1.113883.3.6037.1001.23.93.205'
valueset "Thyroid Orbitopathy": '2.16.840.1.113883.3.6037.1001.23.93.206'
valueset "Proptosis": '2.16.840.1.113883.3.6037.1001.23.93.207'


parameter "ServiceRequest" ServiceRequest
parameter "QuestionnaireResponse" QuestionnaireResponse

context Patient

define Request:
	"ServiceRequest"

define VisionInterferenceCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Vision Interference")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define ImpairmentInDailyActivitiesCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Impairment Daily Activities")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define DifficultyFittingSpectaclesCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Difficulty Wearing Spectacles")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define EyeIrritationCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Disorder of Eye")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define SocketCondition:
  [Condition]C
    where exists(C.code.coding C where C in "Sockets")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define DifficultyFittingProsthesisCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Difficulty Wearing Prosthesis")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define LowerEyelidBlepharoplastySurgery:
  "Request".code.coding C where C in "Lower Eyelid Blepharoplasty Codes"

define SurgeryPurpose:
	if (exists("VisionInterferenceCondition")
				or exists("DifficultyFittingSpectaclesCondition")
				or exists("EyeIrritationCondition")
				or exists("SocketCondition"))
					then 'Reconstructive'
						else if exists("LowerEyelidBlepharoplastySurgery")
							then 'Cosmetic'
								else null

define UpperEyelidBlepharoplastySurgery:
  "Request".code.coding C where C in "Upper Eyelid Blepharoplasty Codes"

define AnatomicalLocationOfSurgery:
	if exists("UpperEyelidBlepharoplastySurgery")
			then 'Upper Eye Lid'
				else if exists("LowerEyelidBlepharoplastySurgery")
					then 'Lower Eye Lid'
						else null

define VisionInterference:
	if exists("VisionInterferenceCondition")
		then true
			else false

define ImpairmentInDailyActivities:
	if exists("ImpairmentInDailyActivitiesCondition")
		then true
			else null

define DifficultyFittingSpectacles:
	if exists("DifficultyFittingSpectaclesCondition")
		then true
			else false

define EyelidIrritation:
	if exists("EyeIrritationCondition")
		then true
			else false

define Socket:
	if exists("SocketCondition")
			then true
				else false

define DifficultyFittingProsthesis:
	if exists("DifficultyFittingProsthesisCondition")
		then true
			else false

define DermatochalasisCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Dermatochalasis")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define CheckDermatochalasis:
	if exists("DermatochalasisCondition")
		then true
			else false

define DifficultySpectaclesDermatochalasis:
		if (exists("DermatochalasisCondition")
			and exists("DifficultyFittingSpectaclesCondition"))
				then true
					else null

define ThyroidEyeCondition:
	exists([Condition]C
    where exists(C.code.coding C where C in "Thyroid Eye Diseases")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed')

define ChronicDermatitis:
	[Condition]C
    where exists(C.code.coding C where C in "Chronic Dermatitis")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define ThyroidChronicDermatitis:
	if (("ThyroidEyeCondition" = true)
				and exists("ChronicDermatitis"))
						then true
							else null

define BlepharochalasisCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Blepharochalasis")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define CheckBlepharochalasis:
 if exists("BlepharochalasisCondition")
			then true
				else false

define ChronicDermatitisOrEyeIrritation:
	if (exists("ChronicDermatitis") or exists("EyeIrritationCondition"))
				and ("CheckBlepharochalasis" = true)
					then true
						else null

define IdiopathicBlepharospasmCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Blepharospasm Condition Codes")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define IdiopathicBlepharospasm:
	if exists("IdiopathicBlepharospasmCondition")
		then true
			else false

define AnophthalmicSocket:
		if exists("SocketCondition")
			then true
				else false

define PtosisCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Ptosis")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define CheckPtosis:
	if (exists("PtosisCondition")
				and exists("SocketCondition"))
					then true
						else null

define PtosisDifficultyProsthesis:
 if (exists("PtosisCondition")
			and exists("DifficultyFittingProsthesisCondition"))
				then true
					else null

define BrowPtosisCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Brow Ptosis")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define BrowPtosis:
	if exists("BrowPtosisCondition")
		then true
			else false

define BlepharoptosisCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Blepharoptosis")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define CheckBlepharoptosis:
	if exists("BlepharoptosisCondition")
		then true
			else false

define BlepharoptosisFunctionalDeficit:
	if (exists("BlepharoptosisCondition")
				and exists("VisionInterferenceCondition"))
					then true
						else null

define LeftEyeCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Left Eye Conditions for Eyelid Surgery")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define RightEyeCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Right Eye Conditions for Eyelid Surgery")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define BilateralEyeCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Bilateral Eye Conditions for Eyelid Surgery")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define Laterality:
	if (exists("LeftEyeCondition") or exists("RightEyeCondition"))
		then 'Unilateral'
			else if exists("BilateralEyeCondition")
				then 'Bilateral'
					else null

define AnatomicalLocationCondition:
	if exists("LeftEyeCondition")
		then 'Left'
			else if exists("RightEyeCondition")
				then 'Right'
					else null

define MRD:
	(First([Observation]O
		where First(O.code.coding) in "Margin reflex distance"
			and O.status.value = 'final'
			and FHIRHelpers.ToQuantity(O.value) <= 2))M
		 return FHIRHelpers.ToQuantity(M.value).value

define PseudoMRD:
	if ("MRD" is not null
		and "MRD" < 2)
			then true
				else null

define EdemaRedundantTissueCondition:
  [Condition]C
    where exists(C.code.coding C where C in "Edema of eyelids")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define EdemaRedundantTissue:
	if exists("EdemaRedundantTissueCondition")
		then true
			else null

define ThyroidOrbitopathyCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Thyroid Orbitopathy")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define ThyroidOrbitopathy:
	if exists("ThyroidOrbitopathyCondition")
		then true
			else false

define ProptosisCondition:
	[Condition]C
    where exists(C.code.coding C where C in "Proptosis")
      and First(C.clinicalStatus.coding).code.value = 'active'
        and First(C.verificationStatus.coding).code.value = 'confirmed'

define CheckProptosis:
	if exists("ProptosisCondition")
			then true
				else null
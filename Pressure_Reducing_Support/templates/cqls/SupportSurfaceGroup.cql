library SupportSurfaceGroup version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'
codesystem "LOINC": 'http://loinc.org'
codesystem "HCPCS": 'https://hcpcs.codes/'
codesystem "SNOMED-CT": 'http://snomed.info/sct'
codesystem "CPT": 'https://www.aapc.com/resources/medical-coding/cpt.aspx'

code "E0181": 'E0181' from "HCPCS" display 'Powered pressure reducing mattress overlay/pad, alternating, with pump, includes heavy duty'
code "E0182": 'E0182' from "HCPCS" display 'Pump for alternating pressure pad, for replacement only'
code "E0184": 'E0184' from "HCPCS" display 'Dry pressure mattress'
code "E0185": 'E0185' from "HCPCS" display 'Gel or gel-like pressure pad for mattress, standard mattress length and width'
code "E0186": 'E0186' from "HCPCS" display 'Air pressure mattress'
code "E0187": 'E0187' from "HCPCS" display 'Water pressure mattress'
code "E0188": 'E0188' from "HCPCS" display 'Synthetic sheepskin pad'
code "E0189": 'E0189' from "HCPCS" display 'Lambswool sheepskin pad, any size'
code "E0196": 'E0196' from "HCPCS" display 'Gel pressure mattress'
code "E0197": 'E0197' from "HCPCS" display 'Air pressure pad for mattress, standard mattress length and width'
code "E0198": 'E0198' from "HCPCS" display 'Water pressure pad for mattress, standard mattress length and width'
code "E0199": 'E0199' from "HCPCS" display 'Dry pressure pad for mattress, standard mattress length and width'
code "E1399": 'E1399' from "HCPCS" display 'Durable medical equipment, miscellaneous'
code "A4640": 'A4640' from "HCPCS" display 'Replacement pad for use with medically necessary alternating pressure pad owned by patient'
code "A9270": 'A9270' from "HCPCS" display 'Non-covered Item or service'

code "E0193": 'E0193' from "HCPCS" display 'Powered air flotation bed (low air loss therapy)'
code "E0277": 'E0277' from "HCPCS" display 'Powered pressure-reducing air mattress'
code "E0371": 'E0371' from "HCPCS" display 'Nonpowered advanced pressure reducing overlay for mattess, standard mattress length and width'
code "E0372": 'E0372' from "HCPCS" display 'Powered air overlay for mattress, standard mattress length and width'
code "E0373": 'E0373' from "HCPCS" display 'Nonpowered advanced pressure reducing mattress'

code "E0194": 'E0194' from "HCPCS" display 'Group 3 - Air fluidized bed'

code "L89.101": 'L89.101' from "ICD-10-CM" display 'Pressure ulcer of unspecified part of back, stage 1'
code "L89.111": 'L89.111' from "ICD-10-CM" display 'Pressure ulcer of right upper back, stage 1'
code "L89.121": 'L89.121' from "ICD-10-CM" display 'Pressure ulcer of left upper back, stage 1'
code "L89.131": 'L89.131' from "ICD-10-CM" display 'Pressure ulcer of right lower back, stage 1'
code "L89.141": 'L89.141' from "ICD-10-CM" display 'Pressure ulcer of left lower back, stage 1'
code "L89.151": 'L89.151' from "ICD-10-CM" display 'Pressure ulcer of sacral region, stage 1'
code "L89.201": 'L89.201' from "ICD-10-CM" display 'Pressure ulcer of unspecified hip, stage 1'
code "L89.211": 'L89.211' from "ICD-10-CM" display 'Pressure ulcer of right hip, stage 1'
code "L89.221": 'L89.221' from "ICD-10-CM" display 'Pressure ulcer of left hip, stage 1'
code "L89.301": 'L89.301' from "ICD-10-CM" display 'Pressure ulcer of unspecified buttock, stage 1'
code "L89.311": 'L89.311' from "ICD-10-CM" display 'Pressure ulcer of right buttock, stage 1'
code "L89.321": 'L89.321' from "ICD-10-CM" display 'Pressure ulcer of left buttock, stage 1'
code "L89.421": 'L89.421' from "ICD-10-CM" display 'Pressure ulcer of contiguous site of back, buttock and hip, stage 1'

code "L89.102": 'L89.102' from "ICD-10-CM" display 'Pressure ulcer of unspecified part of back, stage 2'
code "L89.112": 'L89.112' from "ICD-10-CM" display 'Pressure ulcer of right upper back, stage 2'
code "L89.122": 'L89.122' from "ICD-10-CM" display 'Pressure ulcer of left upper back, stage 2'
code "L89.132": 'L89.132' from "ICD-10-CM" display 'Pressure ulcer of right lower back, stage 2'
code "L89.142": 'L89.142' from "ICD-10-CM" display 'Pressure ulcer of left lower back, stage 2'
code "L89.152": 'L89.152' from "ICD-10-CM" display 'Pressure ulcer of sacral region, stage 2'
code "L89.202": 'L89.202' from "ICD-10-CM" display 'Pressure ulcer of unspecified hip, stage 2'
code "L89.212": 'L89.212' from "ICD-10-CM" display 'Pressure ulcer of right hip, stage 2'
code "L89.222": 'L89.222' from "ICD-10-CM" display 'Pressure ulcer of left hip, stage 2'
code "L89.302": 'L89.302' from "ICD-10-CM" display 'Pressure ulcer of unspecified buttock, stage 2'
code "L89.312": 'L89.312' from "ICD-10-CM" display 'Pressure ulcer of right buttock, stage 2'
code "L89.322": 'L89.322' from "ICD-10-CM" display 'Pressure ulcer of left buttock, stage 2'
code "L89.42": 'L89.42' from "ICD-10-CM" display 'Pressure ulcer of contiguous site of back, buttock and hip, stage 2'

code "L89.103": 'L89.103' from "ICD-10-CM" display 'Pressure ulcer of unspecified part of back, stage 3'
code "L89.113": 'L89.113' from "ICD-10-CM" display 'Pressure ulcer of right upper back, stage 3'
code "L89.123": 'L89.123' from "ICD-10-CM" display 'Pressure ulcer of left upper back, stage 3'
code "L89.133": 'L89.133' from "ICD-10-CM" display 'Pressure ulcer of right lower back, stage 3'
code "L89.143": 'L89.143' from "ICD-10-CM" display 'Pressure ulcer of left lower back, stage 3'
code "L89.153": 'L89.153' from "ICD-10-CM" display 'Pressure ulcer of sacral region, stage 3'
code "L89.203": 'L89.203' from "ICD-10-CM" display 'Pressure ulcer of unspecified hip, stage 3'
code "L89.213": 'L89.213' from "ICD-10-CM" display 'Pressure ulcer of right hip, stage 3'
code "L89.223": 'L89.223' from "ICD-10-CM" display 'Pressure ulcer of left hip, stage 3'
code "L89.303": 'L89.303' from "ICD-10-CM" display 'Pressure ulcer of unspecified buttock, stage 3'
code "L89.313": 'L89.313' from "ICD-10-CM" display 'Pressure ulcer of right buttock, stage 3'
code "L89.323": 'L89.323' from "ICD-10-CM" display 'Pressure ulcer of left buttock, stage 3'
code "L89.43": 'L89.43' from "ICD-10-CM" display 'Pressure ulcer of contiguous site of back, buttock and hip, stage 3'

code "L89.104": 'L89.104' from "ICD-10-CM" display 'Pressure ulcer of unspecified part of back, stage 4'
code "L89.114": 'L89.114' from "ICD-10-CM" display 'Pressure ulcer of right upper back, stage 4'
code "L89.124": 'L89.124' from "ICD-10-CM" display 'Pressure ulcer of left upper back, stage 4'
code "L89.134": 'L89.134' from "ICD-10-CM" display 'Pressure ulcer of right lower back, stage 4'
code "L89.144": 'L89.144' from "ICD-10-CM" display 'Pressure ulcer of left lower back, stage 4'
code "L89.154": 'L89.154' from "ICD-10-CM" display 'Pressure ulcer of sacral region, stage 4'
code "L89.204": 'L89.204' from "ICD-10-CM" display 'Pressure ulcer of unspecified hip, stage 4'
code "L89.214": 'L89.214' from "ICD-10-CM" display 'Pressure ulcer of right hip, stage 4'
code "L89.224": 'L89.224' from "ICD-10-CM" display 'Pressure ulcer of left hip, stage 4'
code "L89.304": 'L89.304' from "ICD-10-CM" display 'Pressure ulcer of unspecified buttock, stage 4'
code "L89.314": 'L89.314' from "ICD-10-CM" display 'Pressure ulcer of right buttock, stage 4'
code "L89.324": 'L89.324' from "ICD-10-CM" display 'Pressure ulcer of left buttock, stage 4'
code "L89.44": 'L89.44' from "ICD-10-CM" display 'Pressure ulcer of contiguous site of back, buttock and hip, stage 4'

code "L89.100": 'L89.100' from "ICD-10-CM" display 'Pressure ulcer of unspecified part of back, unstageable'
code "L89.110": 'L89.110' from "ICD-10-CM" display 'Pressure ulcer of right upper back, unstageable'
code "L89.120": 'L89.120' from "ICD-10-CM" display 'Pressure ulcer of left upper back, unstageable'
code "L89.130": 'L89.130' from "ICD-10-CM" display 'Pressure ulcer of right lower back, unstageable'
code "L89.140": 'L89.140' from "ICD-10-CM" display 'Pressure ulcer of left lower back, unstageable'
code "L89.150": 'L89.150' from "ICD-10-CM" display 'Pressure ulcer of sacral region, unstageable'
code "L89.200": 'L89.200' from "ICD-10-CM" display 'Pressure ulcer of unspecified hip, unstageable'
code "L89.210": 'L89.210' from "ICD-10-CM" display 'Pressure ulcer of right hip, unstageable'
code "L89.220": 'L89.220' from "ICD-10-CM" display 'Pressure ulcer of left hip, unstageable'
code "L89.300": 'L89.300' from "ICD-10-CM" display 'Pressure ulcer of unspecified buttock, unstageable'
code "L89.310": 'L89.310' from "ICD-10-CM" display 'Pressure ulcer of right buttock, unstageable'
code "L89.320": 'L89.320' from "ICD-10-CM" display 'Pressure ulcer of left buttock, unstageable'
code "L89.45": 'L89.45' from "ICD-10-CM" display 'Pressure ulcer of contiguous site of back, buttock and hip, unstageable'

code "15734": '15734' from "HCPCS" display 'Muscle, myocutaneous  flap; trunk'
code "Muscle, myocutaneous  flap; pelvis": 'Muscle, myocutaneous  flap; pelvis' from "HCPCS" display 'Muscle, myocutaneous  flap; pelvis'
code "1500": '1500' from "HCPCS" display 'Skin graft to trunk'
code "291162": '291162' from "HCPCS" display 'Skin graft to pelvis'

code "302045007": '302045007' from "SNOMED-CT" display 'Does not mobilize'
code "82971005": '82971005' from "SNOMED-CT" display 'Impaired mobility'

code "130985008": '130985008' from "SNOMED-CT" display 'Disturbed sensory perception'
code "409055009": '409055009' from "SNOMED-CT" display 'Ineffective tissue perfusion'
code "72042002": '72042002' from "SNOMED-CT" display 'Incontinence of feces'
code "165232002": '165232002' from "SNOMED-CT" display 'Urinary incontinence'
code "445261000124106": '445261000124106' from "SNOMED-CT" display 'Nutrition impaired'

code "397704003": '397704003' from "SNOMED-CT" display 'Pain sensation, function'
code "44695005": '44695005' from "SNOMED-CT" display 'Paralysis'
code "397623002": '397623002' from "SNOMED-CT" display 'Ability to sense pressure'
code "397643008": '397643008' from "SNOMED-CT" display 'Ability to sense sharp point'

code "L89.003": 'L89.003' from "ICD-10-CM" display 'Pressure ulcer of unspecified elbow, stage 3'
code "L89.004": 'L89.004' from "ICD-10-CM" display 'Pressure ulcer of unspecified elbow, stage 4'
code "L89.013": 'L89.013' from "ICD-10-CM" display 'Pressure ulcer of right elbow, stage 3'
code "L89.014": 'L89.014' from "ICD-10-CM" display 'Pressure ulcer of right elbow, stage 4'
code "L89.023": 'L89.023' from "ICD-10-CM" display 'Pressure ulcer of left elbow, stage 3'
code "L89.024": 'L89.024' from "ICD-10-CM" display 'Pressure ulcer of left elbow, stage 4'

code "L89.503": 'L89.503' from "ICD-10-CM" display 'Pressure ulcer of unspecified ankle, stage 3'
code "L89.504": 'L89.504' from "ICD-10-CM" display 'Pressure ulcer of unspecified ankle, stage 4'
code "L89.513": 'L89.513' from "ICD-10-CM" display 'Pressure ulcer of right ankle, stage 3'
code "L89.514": 'L89.514' from "ICD-10-CM" display 'Pressure ulcer of right ankle, stage 4'
code "L89.523": 'L89.523' from "ICD-10-CM" display 'Pressure ulcer of left ankle, stage 3'
code "L89.524": 'L89.524' from "ICD-10-CM" display 'Pressure ulcer of left ankle, stage 4'
code "L89.603": 'L89.603' from "ICD-10-CM" display 'Pressure ulcer of unspecified heel, stage 3'
code "L89.604": 'L89.604' from "ICD-10-CM" display 'Pressure ulcer of unspecified heel, stage 4'
code "L89.613": 'L89.613' from "ICD-10-CM" display 'Pressure ulcer of right heel, stage 3'
code "L89.614": 'L89.614' from "ICD-10-CM" display 'Pressure ulcer of right heel, stage 4'
code "L89.623": 'L89.623' from "ICD-10-CM" display 'Pressure ulcer of left heel, stage 3'
code "L89.624": 'L89.624' from "ICD-10-CM" display 'Pressure ulcer of left heel, stage 4'
code "L89.813": 'L89.813' from "ICD-10-CM" display 'Pressure ulcer of head, stage 3'
code "L89.814": 'L89.814' from "ICD-10-CM" display 'Pressure ulcer of head, stage 4'
code "L89.893": 'L89.893' from "ICD-10-CM" display 'Pressure ulcer of other site, stage 3'
code "L89.894": 'L89.894' from "ICD-10-CM" display 'Pressure ulcer of other site, stage 4'
code "L89.93": 'L89.93' from "ICD-10-CM" display 'Pressure ulcer of unspecified site, stage 3'
code "L89.94": 'L89.94' from "ICD-10-CM" display 'Pressure ulcer of unspecified site, stage 4'

concept "Group1": {
    "E0181",
    "E0182",
    "E0184",
    "E0185",
    "E0186",
    "E0187",
    "E0188",
    "E0189",
    "E0196",
    "E0197",
    "E0198",
    "E0199",
    "E1399",
    "A4640",
    "A9270"
}

concept "Group2": {
    "E0193",
    "E0277",
    "E0371",
    "E0372",
    "E0373",
    "E1399"
}
concept "Group3": {
    "E0194"
}

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
    if (FHIRHelpers.ToCode(First("DeviceRequest".code.coding)) ~ "Group1")
        then FHIRHelpers.ToCode(First("DeviceRequest".code.coding))
    else null

define "Group2Item":
    if (FHIRHelpers.ToCode(First("DeviceRequest".code.coding)) ~ "Group2")
        then FHIRHelpers.ToCode(First("DeviceRequest".code.coding))
    else null

define "Group3Item":
    if (FHIRHelpers.ToCode(First("DeviceRequest".code.coding)) ~ "Group3")
        then FHIRHelpers.ToCode(First("DeviceRequest".code.coding))
    else null

define "AnyStagePressureUlcerInjuryCondition":
  First(([Condition]C
		where FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.111"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.121"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.131"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.141"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.151"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.201"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.211"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.221"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.301"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.311"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.321"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.421"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.102"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.112"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.122"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.132"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.142"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.152"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.202"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.212"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.222"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.302"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.312"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.322"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.42"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.103"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.113"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.123"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.133"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.143"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.153"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.203"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.213"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.223"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.303"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.313"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.323"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.43"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.104"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.114"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.124"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.134"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.144"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.154"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.204"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.214"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.224"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.304"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.314"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.324"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.44"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.100"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.110"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.120"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.130"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.140"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.150"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.200"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.210"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.220"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.300"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.310"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.320"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.45")Covered
			 where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed')

define "AnyStagePressureUlcerInjury":
{
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.101")
        then 'L89.101' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.111")
        then 'L89.111' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.121")
        then 'L89.121' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.131")
        then 'L89.131' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.141")
        then 'L89.141' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.151")
        then 'L89.151' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.201")
        then 'L89.201' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.211")
        then 'L89.211' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.221")
        then 'L89.221' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.301")
        then 'L89.301' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.311")
        then 'L89.311' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.321")
        then 'L89.321' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.421")
        then 'L89.421' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.102")
        then 'L89.102' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.112")
        then 'L89.112' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.122")
        then 'L89.122' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.132")
        then 'L89.132' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.142")
        then 'L89.142' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.152")
        then 'L89.152' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.202")
        then 'L89.202' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.212")
        then 'L89.212' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.222")
        then 'L89.222' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.302")
        then 'L89.302' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.312")
        then 'L89.312' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.322")
        then 'L89.322' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.42")
        then 'L89.42' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.103")
        then 'L89.103' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.113")
        then 'L89.113' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.123")
        then 'L89.123' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.133")
        then 'L89.133' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.143")
        then 'L89.143' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.153")
        then 'L89.153' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.203")
        then 'L89.203' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.213")
        then 'L89.213' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.223")
        then 'L89.223' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.303")
        then 'L89.303' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.313")
        then 'L89.313' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.323")
        then 'L89.323' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.43")
        then 'L89.43' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.104")
        then 'L89.104' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.114")
        then 'L89.114' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.124")
        then 'L89.124' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.134")
        then 'L89.134' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.144")
        then 'L89.144' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.154")
        then 'L89.154' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.204")
        then 'L89.204' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.214")
        then 'L89.214' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.224")
        then 'L89.224' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.304")
        then 'L89.304' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.314")
        then 'L89.314' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.324")
        then 'L89.324' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.44")
        then 'L89.44' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.100")
        then 'L89.100' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.110")
        then 'L89.110' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.120")
        then 'L89.120' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.130")
        then 'L89.130' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.140")
        then 'L89.140' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.150")
        then 'L89.150' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.200")
        then 'L89.200' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.210")
        then 'L89.210' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.220")
        then 'L89.220' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.300")
        then 'L89.300' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.310")
        then 'L89.310' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.320")
        then 'L89.320' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.45")
        then 'L89.45' else null
}


define "MultipleStage2PressureUlcerInjuryCondition":
  First(([Condition]C
		where FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.102"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.112"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.122"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.132"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.142"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.152"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.202"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.212"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.222"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.302"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.312"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.322"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.42")Covered
			 where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed')

define "MultipleStage2PressureUlcerInjury":
{
    if (FHIRHelpers.ToCode(First("MultipleStage2PressureUlcerInjuryCondition".code.coding)) ~ "L89.102")
        then 'L89.102' else null,
    if (FHIRHelpers.ToCode(First("MultipleStage2PressureUlcerInjuryCondition".code.coding)) ~ "L89.112")
        then 'L89.112' else null,
    if (FHIRHelpers.ToCode(First("MultipleStage2PressureUlcerInjuryCondition".code.coding)) ~ "L89.122")
        then 'L89.122' else null,
    if (FHIRHelpers.ToCode(First("MultipleStage2PressureUlcerInjuryCondition".code.coding)) ~ "L89.132")
        then 'L89.132' else null,
    if (FHIRHelpers.ToCode(First("MultipleStage2PressureUlcerInjuryCondition".code.coding)) ~ "L89.142")
        then 'L89.142' else null,
    if (FHIRHelpers.ToCode(First("MultipleStage2PressureUlcerInjuryCondition".code.coding)) ~ "L89.152")
        then 'L89.152' else null,
    if (FHIRHelpers.ToCode(First("MultipleStage2PressureUlcerInjuryCondition".code.coding)) ~ "L89.202")
        then 'L89.202' else null,
    if (FHIRHelpers.ToCode(First("MultipleStage2PressureUlcerInjuryCondition".code.coding)) ~ "L89.212")
        then 'L89.212' else null,
    if (FHIRHelpers.ToCode(First("MultipleStage2PressureUlcerInjuryCondition".code.coding)) ~ "L89.222")
        then 'L89.222' else null,
    if (FHIRHelpers.ToCode(First("MultipleStage2PressureUlcerInjuryCondition".code.coding)) ~ "L89.302")
        then 'L89.302' else null,
    if (FHIRHelpers.ToCode(First("MultipleStage2PressureUlcerInjuryCondition".code.coding)) ~ "L89.312")
        then 'L89.312' else null,
    if (FHIRHelpers.ToCode(First("MultipleStage2PressureUlcerInjuryCondition".code.coding)) ~ "L89.322")
        then 'L89.322' else null,
    if (FHIRHelpers.ToCode(First("MultipleStage2PressureUlcerInjuryCondition".code.coding)) ~ "L89.42")
        then 'L89.42' else null
}

define "Stage34PressureUlcerInjuryCondition":
  First(([Condition]C
		where FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.103"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.113"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.123"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.133"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.143"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.153"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.203"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.213"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.223"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.303"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.313"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.323"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.43"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.104"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.114"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.124"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.134"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.144"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.154"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.204"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.214"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.224"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.304"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.314"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.324"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "L89.44")Covered
			 where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed')

define "Stage34PressureUlcerInjury":
{
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.103")
        then 'L89.103' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.113")
        then 'L89.113' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.123")
        then 'L89.123' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.133")
        then 'L89.133' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.143")
        then 'L89.143' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.153")
        then 'L89.153' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.203")
        then 'L89.203' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.213")
        then 'L89.213' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.223")
        then 'L89.223' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.303")
        then 'L89.303' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.313")
        then 'L89.313' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.323")
        then 'L89.323' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.43")
        then 'L89.43' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.104")
        then 'L89.104' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.114")
        then 'L89.114' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.124")
        then 'L89.124' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.134")
        then 'L89.134' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.144")
        then 'L89.144' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.154")
        then 'L89.154' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.204")
        then 'L89.204' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.214")
        then 'L89.214' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.224")
        then 'L89.224' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.304")
        then 'L89.304' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.314")
        then 'L89.314' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.324")
        then 'L89.324' else null,
    if (FHIRHelpers.ToCode(First("AnyStagePressureUlcerInjuryCondition".code.coding)) ~ "L89.44")
        then 'L89.44' else null
}

define "BeneficiaryMobility":
    if First(([Condition]C where FHIRHelpers.ToCode(First(C.code.coding)) ~ "302045007")Covered
			 where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed') is not null
        then 'Criteria 1: Completely immobile, cannot makes changes without assistance.'
    else if First(([Condition]C where FHIRHelpers.ToCode(First(C.code.coding)) ~ "82971005")Covered
			 where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed') is not null
        then 'Criteria 2: Limited mobility, cannot make changes significant enough to alleviate pressure without assistance.  Provider Note: The medical record must document the severity of the condition sufficiently to demonstrate the medical necessity for a PRSS.'
    else if "AnyStagePressureUlcerInjuryCondition" is not null
        then 'Criteria 3: Any stage pressure ulcer/injury on the trunk or pelvis. Provider Note: The medical record must document the severity of the condition sufficiently to demonstrate the medical necessity for a PRSS.'
    else null

define "Stage34PressureUlcerInjuryStatus":
    if "Stage34PressureUlcerInjuryCondition"  is not null
        then FHIRHelpers.ToString(First(("Stage34PressureUlcerInjuryCondition").note.text))
    else null


define "Group2Criteria":
    if exists("MultipleStage2PressureUlcerInjury")
        then 'Criteria 1: Multiple stage 2 pressure ulcers located on the trunk or pelvis, which have failed to improve over the past month.'
    else if exists("Stage34PressureUlcerInjury")
        then 'Criteria 2: Has multiple stage 3 or 4 pressure ulcer(s)/injury(s) on the trunk or pelvis.'
    else ''

define "PainResource":
  First(([Condition]C
		where FHIRHelpers.ToCode(First(C.code.coding)) ~ "397704003") Covered
			 where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed')

define "ParalysisResource":
  First(([Condition]C
		where FHIRHelpers.ToCode(First(C.code.coding)) ~ "44695005")Covered
			 where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed')

define "SuperficialPressureResource":
  First(([Condition]C
		where FHIRHelpers.ToCode(First(C.code.coding)) ~ "397623002")Covered
			 where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed')

define "DeepPressureResource":
  First(([Condition]C
		where FHIRHelpers.ToCode(First(C.code.coding)) ~ "397643008")Covered
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
		where FHIRHelpers.ToCode(First(C.code.coding)) ~ "409055009")Covered
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
		where FHIRHelpers.ToCode(First(C.code.coding)) ~ "72042002"
            or FHIRHelpers.ToCode(First(C.code.coding)) ~ "165232002")Covered
			 where First(Covered.clinicalStatus.coding).code.value = 'active'
			 	and First(Covered.verificationStatus.coding).code.value = 'confirmed')

define "ImpairedNutritionalStatus":
  First(([Condition]C
		where FHIRHelpers.ToCode(First(C.code.coding)) ~ "445261000124106")Covered
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

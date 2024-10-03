library SupportSurfaceGroup2Decision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include SupportSurfaceGroup2 version '1.0.0' called SupportSurfaceGroup2

parameter "DeviceRequest" DeviceRequest
parameter "QuestionnaireResponse" QuestionnaireResponse

context Patient
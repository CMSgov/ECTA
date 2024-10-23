library SupportSurfaceGroupDecision version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include SupportSurfaceGroup version '1.0.0' called SupportSurfaceGroup

parameter "DeviceRequest" DeviceRequest
parameter "QuestionnaireResponse" QuestionnaireResponse

context Patient
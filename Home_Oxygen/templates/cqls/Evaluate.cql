library HomeOxygenAdaptive version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

parameter "questionnaireInput" Questionnaire
parameter "questionnaireResponseInput" QuestionnaireResponse

context Patient

define "LastResponseItem":
    questionnaireResponseInput.item[Length(questionnaireResponseInput.item)-1]

define "LastResponseItemLinkID":
    "LastResponseItem".linkId

define "QuestionnaireItem":
    IndexOf(questionnaireInput.item, Last(questionnaireInput.item QI where QI.linkId = "LastResponseItemLinkID"))

define "ResponseSubItem":
    "LastResponseItem".item subItem where subItem.linkId = 'PayerRecomendations'

define "ResponseAnswer":
    FHIRHelpers.ToCode("ResponseSubItem".answer[0].value).code

define "NextQuestionLinkId":
    questionnaireInput.item["QuestionnaireItem"+1].linkId

define "next-question":
    if "NextQuestionLinkId" is not null 
        then "NextQuestionLinkId" else ''
library HomeOxygenAdaptive version '1.0.0'

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers

parameter "questionnaireInput" Questionnaire
parameter "QuestionnaireResponse" QuestionnaireResponse

context Patient

define First:
    "QuestionnaireResponse".item I
        where I.linkId.value = '1'

define FirstResponseItem:
    ("First".item I
		   where I.linkId.value = '1.1')QR
		      return ToString(First(QR.answer).value as Reference)

define function "GetId"(uri String):
	Last(Split(uri, '/'))

define function ToString(value FHIR.Reference): value.reference.value

define EncounterResponse:
    First([Encounter]E
        where 'Encounter/' + E.id.value = First("FirstResponseItem"))

define "LastResponseItem":
    "QuestionnaireResponse".item[Length("QuestionnaireResponse".item)-1]

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
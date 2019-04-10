// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_questions_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentQuestionsDetailDto _$StudentQuestionsDetailDtoFromJson(
    Map<String, dynamic> json) {
  return StudentQuestionsDetailDto(
      json['answer'] as String,
      json['answerContent'] as String,
      json['answerContentXml'] as String,
      json['answerFileSmallUrl'] as String,
      json['answerFileUrl'] as String,
      json['answered'] as int,
      json['content'] as String,
      json['contentXml'] as String,
      json['difficultyLevel'] as int,
      json['explainContent'] as String,
      json['explainContentXml'] as String,
      json['failReason'] as int,
      json['hasMarkFeedback'] as int,
      json['marked'] as int,
      json['markedResult'] as int,
      json['markingStudentName'] as String,
      json['materialContent'] as String,
      json['materialContentXml'] as String,
      json['needRevise'] as bool,
      (json['otherStudentAnswer'] as List)
          ?.map((e) => e == null
              ? null
              : OtherStudentAnswer.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['questionId'] as int,
      json['reviseAnswer'] as String,
      json['reviseAnswerFileSmallUrl'] as String,
      json['reviseAnswerFileUrl'] as String,
      json['reviseIsRight'] as int,
      json['reviseScore'] as int,
      json['revised'] as bool,
      json['score'] as int,
      json['source'] as int,
      json['status'] as int,
      json['studentAnswer'] as String,
      json['studentMarked'] as int,
      json['subType'] as int,
      json['teacherMarked'] as int,
      json['teacherRemark'] as String,
      json['type'] as int);
}

Map<String, dynamic> _$StudentQuestionsDetailDtoToJson(
        StudentQuestionsDetailDto instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'answerContent': instance.answerContent,
      'answerContentXml': instance.answerContentXml,
      'answerFileSmallUrl': instance.answerFileSmallUrl,
      'answerFileUrl': instance.answerFileUrl,
      'answered': instance.answered,
      'content': instance.content,
      'contentXml': instance.contentXml,
      'difficultyLevel': instance.difficultyLevel,
      'explainContent': instance.explainContent,
      'explainContentXml': instance.explainContentXml,
      'failReason': instance.failReason,
      'hasMarkFeedback': instance.hasMarkFeedback,
      'marked': instance.marked,
      'markedResult': instance.markedResult,
      'markingStudentName': instance.markingStudentName,
      'materialContent': instance.materialContent,
      'materialContentXml': instance.materialContentXml,
      'needRevise': instance.needRevise,
      'otherStudentAnswer': instance.otherStudentAnswer,
      'questionId': instance.questionId,
      'reviseAnswer': instance.reviseAnswer,
      'reviseAnswerFileSmallUrl': instance.reviseAnswerFileSmallUrl,
      'reviseAnswerFileUrl': instance.reviseAnswerFileUrl,
      'reviseIsRight': instance.reviseIsRight,
      'reviseScore': instance.reviseScore,
      'revised': instance.revised,
      'score': instance.score,
      'source': instance.source,
      'status': instance.status,
      'studentAnswer': instance.studentAnswer,
      'studentMarked': instance.studentMarked,
      'subType': instance.subType,
      'teacherMarked': instance.teacherMarked,
      'teacherRemark': instance.teacherRemark,
      'type': instance.type
    };

OtherStudentAnswer _$OtherStudentAnswerFromJson(Map<String, dynamic> json) {
  return OtherStudentAnswer(
      json['explainImageId'] as int,
      json['explainImageSmallUrl'] as String,
      json['explainImageUrl'] as String,
      json['originalExplainImageId'] as int,
      json['studentId'] as int,
      json['studentName'] as String);
}

Map<String, dynamic> _$OtherStudentAnswerToJson(OtherStudentAnswer instance) =>
    <String, dynamic>{
      'explainImageId': instance.explainImageId,
      'explainImageSmallUrl': instance.explainImageSmallUrl,
      'explainImageUrl': instance.explainImageUrl,
      'originalExplainImageId': instance.originalExplainImageId,
      'studentId': instance.studentId,
      'studentName': instance.studentName
    };

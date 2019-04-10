// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_mark_question_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentMarkQuestionDto _$StudentMarkQuestionDtoFromJson(
    Map<String, dynamic> json) {
  return StudentMarkQuestionDto(
      (json['studentMarkQuestionDtos'] as List)
          ?.map((e) => e == null
              ? null
              : StudentMarkQuestionDtos.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['studentNum'] as int);
}

Map<String, dynamic> _$StudentMarkQuestionDtoToJson(
        StudentMarkQuestionDto instance) =>
    <String, dynamic>{
      'studentMarkQuestionDtos': instance.studentMarkQuestionDtos,
      'studentNum': instance.studentNum
    };

StudentMarkQuestionDtos _$StudentMarkQuestionDtosFromJson(
    Map<String, dynamic> json) {
  return StudentMarkQuestionDtos(
      json['answerContent'] as String,
      json['answerContentXml'] as String,
      json['answerFileId'] as int,
      json['answerFileUrl'] as String,
      json['content'] as String,
      json['contentXml'] as String,
      json['explainContent'] as String,
      json['explainContentXml'] as String,
      json['homeworkId'] as int,
      json['id'] as int,
      json['marked'] as int,
      json['materialContent'] as String,
      json['materialContentXml'] as String,
      json['pQuestionNum'] as int,
      json['pTitle'] as String,
      json['pType'] as int,
      json['parentId'] as int,
      json['questionId'] as int,
      json['questionNum'] as int,
      json['source'] as int,
      json['studentId'] as int,
      json['studentMarkScore'] as int,
      json['studentMarked'] as int,
      json['studentMarkedResult'] as int,
      json['type'] as int);
}

Map<String, dynamic> _$StudentMarkQuestionDtosToJson(
        StudentMarkQuestionDtos instance) =>
    <String, dynamic>{
      'answerContent': instance.answerContent,
      'answerContentXml': instance.answerContentXml,
      'answerFileId': instance.answerFileId,
      'answerFileUrl': instance.answerFileUrl,
      'content': instance.content,
      'contentXml': instance.contentXml,
      'explainContent': instance.explainContent,
      'explainContentXml': instance.explainContentXml,
      'homeworkId': instance.homeworkId,
      'id': instance.id,
      'marked': instance.marked,
      'materialContent': instance.materialContent,
      'materialContentXml': instance.materialContentXml,
      'pQuestionNum': instance.pQuestionNum,
      'pTitle': instance.pTitle,
      'pType': instance.pType,
      'parentId': instance.parentId,
      'questionId': instance.questionId,
      'questionNum': instance.questionNum,
      'source': instance.source,
      'studentId': instance.studentId,
      'studentMarkScore': instance.studentMarkScore,
      'studentMarked': instance.studentMarked,
      'studentMarkedResult': instance.studentMarkedResult,
      'type': instance.type
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_homework_overview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentHomeworkOverview _$StudentHomeworkOverviewFromJson(
    Map<String, dynamic> json) {
  return StudentHomeworkOverview(
      json['homeworkId'] as String,
      json['noDoes'] as int,
      json['status'] as int,
      json['title'] as String,
      (json['questionList'] as List)
          ?.map((e) => e == null
              ? null
              : QuestionList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['needRevise'] as int,
      json['revised'] as int,
      json['needStartReviseTask'] as bool);
}

Map<String, dynamic> _$StudentHomeworkOverviewToJson(
        StudentHomeworkOverview instance) =>
    <String, dynamic>{
      'homeworkId': instance.homeworkId,
      'noDoes': instance.noDoes,
      'status': instance.status,
      'title': instance.title,
      'questionList': instance.questionList,
      'needRevise': instance.needRevise,
      'revised': instance.revised,
      'needStartReviseTask': instance.needStartReviseTask
    };

QuestionList _$QuestionListFromJson(Map<String, dynamic> json) {
  return QuestionList(
      json['questionId'] as String,
      json['isRight'] as int,
      json['status'] as int,
      json['number'] as int,
      json['type'] as int,
      json['pQuestionId'] as String,
      json['pType'] as int,
      json['pNumber'] as int,
      json['pTitle'] as String);
}

Map<String, dynamic> _$QuestionListToJson(QuestionList instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'isRight': instance.isRight,
      'status': instance.status,
      'number': instance.number,
      'type': instance.type,
      'pQuestionId': instance.pQuestionId,
      'pType': instance.pType,
      'pNumber': instance.pNumber,
      'pTitle': instance.pTitle
    };

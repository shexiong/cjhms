// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_homework_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentHomeworkDetailDto _$StudentHomeworkDetailDtoFromJson(
    Map<String, dynamic> json) {
  return StudentHomeworkDetailDto(
      json['homeworkId'] as String,
      json['title'] as String,
      json['cost'] as int,
      json['userTime'] as int,
      json['lastQuestionId'] as String,
      json['previewed'] as int,
      json['checkStatus'] as int,
      json['checkTime'] as int,
      json['reviseTime'] as int,
      (json['questionList'] as List)
          ?.map((e) => e == null
              ? null
              : QuestionList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['type'] as int);
}

Map<String, dynamic> _$StudentHomeworkDetailDtoToJson(
        StudentHomeworkDetailDto instance) =>
    <String, dynamic>{
      'homeworkId': instance.homeworkId,
      'title': instance.title,
      'cost': instance.cost,
      'userTime': instance.userTime,
      'lastQuestionId': instance.lastQuestionId,
      'previewed': instance.previewed,
      'checkStatus': instance.checkStatus,
      'checkTime': instance.checkTime,
      'reviseTime': instance.reviseTime,
      'questionList': instance.questionList,
      'type': instance.type
    };

QuestionList _$QuestionListFromJson(Map<String, dynamic> json) {
  return QuestionList(
      json['id'] as String,
      json['type'] as int,
      json['subType'] as int,
      json['content'] as String,
      json['contentXml'] as String,
      json['optionCount'] as int,
      json['number'] as int,
      json['studentAnswer'] as String,
      json['status'] as int,
      json['answered'] as int,
      json['marked'] as int,
      json['answerFileId'] as String,
      json['answerFileUrl'] as String,
      json['needsExplain'] as int,
      json['parentId'] as String,
      json['level'] as int,
      json['title'] as String,
      json['difficultyLevel'] as int,
      (json['childrenList'] as List)
          ?.map((e) => e == null
              ? null
              : ChildrenList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['revised'] as int,
      json['reviseAnswer'] as String,
      json['reviseAnswerFileId'] as String,
      json['originalAnswerFileId'] as String,
      json['reviseAnswerFileUrl'] as String,
      json['read'] as bool);
}

Map<String, dynamic> _$QuestionListToJson(QuestionList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'subType': instance.subType,
      'content': instance.content,
      'contentXml': instance.contentXml,
      'optionCount': instance.optionCount,
      'number': instance.number,
      'studentAnswer': instance.studentAnswer,
      'status': instance.status,
      'answered': instance.answered,
      'marked': instance.marked,
      'answerFileId': instance.answerFileId,
      'answerFileUrl': instance.answerFileUrl,
      'needsExplain': instance.needsExplain,
      'parentId': instance.parentId,
      'level': instance.level,
      'title': instance.title,
      'difficultyLevel': instance.difficultyLevel,
      'childrenList': instance.childrenList,
      'revised': instance.revised,
      'reviseAnswer': instance.reviseAnswer,
      'reviseAnswerFileId': instance.reviseAnswerFileId,
      'originalAnswerFileId': instance.originalAnswerFileId,
      'reviseAnswerFileUrl': instance.reviseAnswerFileUrl,
      'read': instance.read
    };

ChildrenList _$ChildrenListFromJson(Map<String, dynamic> json) {
  return ChildrenList(
      json['id'] as String,
      json['type'] as int,
      json['subType'] as int,
      json['content'] as String,
      json['contentXml'] as String,
      json['optionCount'] as int,
      json['number'] as int,
      json['studentAnswer'] as String,
      json['status'] as int,
      json['answered'] as int,
      json['marked'] as int,
      json['answerFileId'] as String,
      json['answerFileUrl'] as String,
      json['needsExplain'] as int,
      json['parentId'] as String,
      json['level'] as int,
      json['title'] as String,
      json['difficultyLevel'] as int,
      json['childrenList'] == null
          ? null
          : ChildrenList.fromJson(json['childrenList'] as Map<String, dynamic>),
      json['revised'] as int,
      json['reviseAnswer'] as String,
      json['reviseAnswerFileId'] as String,
      json['originalAnswerFileId'] as String,
      json['reviseAnswerFileUrl'] as String,
      json['read'] as bool);
}

Map<String, dynamic> _$ChildrenListToJson(ChildrenList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'subType': instance.subType,
      'content': instance.content,
      'contentXml': instance.contentXml,
      'optionCount': instance.optionCount,
      'number': instance.number,
      'studentAnswer': instance.studentAnswer,
      'status': instance.status,
      'answered': instance.answered,
      'marked': instance.marked,
      'answerFileId': instance.answerFileId,
      'answerFileUrl': instance.answerFileUrl,
      'needsExplain': instance.needsExplain,
      'parentId': instance.parentId,
      'level': instance.level,
      'title': instance.title,
      'difficultyLevel': instance.difficultyLevel,
      'childrenList': instance.childrenList,
      'revised': instance.revised,
      'reviseAnswer': instance.reviseAnswer,
      'reviseAnswerFileId': instance.reviseAnswerFileId,
      'originalAnswerFileId': instance.originalAnswerFileId,
      'reviseAnswerFileUrl': instance.reviseAnswerFileUrl,
      'read': instance.read
    };

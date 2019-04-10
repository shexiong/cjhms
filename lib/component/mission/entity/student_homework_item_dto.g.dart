// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_homework_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentHomeworkItemDto _$StudentHomeworkItemDtoFromJson(
    Map<String, dynamic> json) {
  return StudentHomeworkItemDto(
      json['id'] as String,
      json['homeworkId'] as String,
      json['title'] as String,
      json['endTime'] as String,
      json['subjectName'] as String,
      json['status'] as int,
      json['accuracy'] as int,
      json['started'] as int,
      json['lastQuestionId'] as String,
      json['scheduled'] as int,
      json['submitted'] as int,
      json['marked'] as int,
      json['overdue'] as int,
      json['submittedBy'] as int,
      json['resultRead'] as int,
      json['studentMarkEnabled'] as int,
      json['estimatedCost'] as int,
      json['publishTime'] as String,
      json['previewed'] as int,
      json['markEndTime'] as String,
      json['allowMakeUp'] as int,
      json['game'] as bool,
      json['noGroup'] as bool,
      json['gameResult'] as int,
      json['revise'] as bool,
      json['reviseOverdue'] as bool,
      json['reviseScheduled'] as bool,
      json['taskStarted'] as bool);
}

Map<String, dynamic> _$StudentHomeworkItemDtoToJson(
        StudentHomeworkItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeworkId': instance.homeworkId,
      'title': instance.title,
      'endTime': instance.endTime,
      'subjectName': instance.subjectName,
      'status': instance.status,
      'accuracy': instance.accuracy,
      'started': instance.started,
      'lastQuestionId': instance.lastQuestionId,
      'scheduled': instance.scheduled,
      'submitted': instance.submitted,
      'marked': instance.marked,
      'overdue': instance.overdue,
      'submittedBy': instance.submittedBy,
      'resultRead': instance.resultRead,
      'studentMarkEnabled': instance.studentMarkEnabled,
      'estimatedCost': instance.estimatedCost,
      'publishTime': instance.publishTime,
      'previewed': instance.previewed,
      'markEndTime': instance.markEndTime,
      'allowMakeUp': instance.allowMakeUp,
      'game': instance.game,
      'noGroup': instance.noGroup,
      'gameResult': instance.gameResult,
      'revise': instance.revise,
      'reviseOverdue': instance.reviseOverdue,
      'reviseScheduled': instance.reviseScheduled,
      'taskStarted': instance.taskStarted
    };

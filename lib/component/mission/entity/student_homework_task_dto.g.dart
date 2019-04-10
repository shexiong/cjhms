// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_homework_task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentHomeworkTaskDto _$StudentHomeworkTaskDtoFromJson(
    Map<String, dynamic> json) {
  return StudentHomeworkTaskDto(
      (json['plan'] as List)
          ?.map((e) =>
              e == null ? null : Plan.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['todo'] as List)
          ?.map((e) =>
              e == null ? null : Todo.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$StudentHomeworkTaskDtoToJson(
        StudentHomeworkTaskDto instance) =>
    <String, dynamic>{'plan': instance.plan, 'todo': instance.todo};

Plan _$PlanFromJson(Map<String, dynamic> json) {
  return Plan(
      json['accuracy'] as int,
      json['endTime'] as String,
      json['estimatedCost'] as int,
      json['executed'] as bool,
      json['homeworkId'] as int,
      json['makeUpEndTime'] as String,
      json['resultRead'] as int,
      json['reviseEndTime'] as String,
      json['reviseNum'] as int,
      json['scheduledEnd'] as String,
      json['scheduledNode'] as int,
      json['scheduledStart'] as String,
      json['started'] as bool,
      json['subjectId'] as int,
      json['subjectName'] as String,
      json['taskId'] as int,
      json['taskType'] as int,
      json['title'] as String);
}

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'accuracy': instance.accuracy,
      'endTime': instance.endTime,
      'estimatedCost': instance.estimatedCost,
      'executed': instance.executed,
      'homeworkId': instance.homeworkId,
      'makeUpEndTime': instance.makeUpEndTime,
      'resultRead': instance.resultRead,
      'reviseEndTime': instance.reviseEndTime,
      'reviseNum': instance.reviseNum,
      'scheduledEnd': instance.scheduledEnd,
      'scheduledNode': instance.scheduledNode,
      'scheduledStart': instance.scheduledStart,
      'started': instance.started,
      'subjectId': instance.subjectId,
      'subjectName': instance.subjectName,
      'taskId': instance.taskId,
      'taskType': instance.taskType,
      'title': instance.title
    };

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return Todo(
      json['accuracy'] as int,
      json['endTime'] as String,
      json['estimatedCost'] as int,
      json['executed'] as bool,
      json['homeworkId'] as int,
      json['makeUpEndTime'] as String,
      json['resultRead'] as int,
      json['reviseEndTime'] as String,
      json['reviseNum'] as int,
      json['scheduledEnd'] as String,
      json['scheduledNode'] as int,
      json['scheduledStart'] as String,
      json['started'] as bool,
      json['subjectId'] as int,
      json['subjectName'] as String,
      json['taskId'] as int,
      json['taskType'] as int,
      json['title'] as String);
}

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'accuracy': instance.accuracy,
      'endTime': instance.endTime,
      'estimatedCost': instance.estimatedCost,
      'executed': instance.executed,
      'homeworkId': instance.homeworkId,
      'makeUpEndTime': instance.makeUpEndTime,
      'resultRead': instance.resultRead,
      'reviseEndTime': instance.reviseEndTime,
      'reviseNum': instance.reviseNum,
      'scheduledEnd': instance.scheduledEnd,
      'scheduledNode': instance.scheduledNode,
      'scheduledStart': instance.scheduledStart,
      'started': instance.started,
      'subjectId': instance.subjectId,
      'subjectName': instance.subjectName,
      'taskId': instance.taskId,
      'taskType': instance.taskType,
      'title': instance.title
    };

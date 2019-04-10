// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_homework_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartHomeworkInfo _$StartHomeworkInfoFromJson(Map<String, dynamic> json) {
  return StartHomeworkInfo(
      json['endTime'] as String,
      json['estimatedCost'] as int,
      json['game'] as bool,
      json['gameType'] as int,
      json['homeworkId'] as int,
      json['makeUpEndTime'] as String,
      json['previewed'] as int,
      json['reviseEndTime'] as String,
      json['reviseNum'] as int,
      json['rival'] as String,
      (json['rivals'] as List)?.map((e) => e as String)?.toList(),
      json['scheduledEnd'] as String,
      json['scheduledStart'] as String,
      json['started'] as bool,
      json['subjectId'] as int,
      json['subjectName'] as String,
      json['taskType'] as int,
      (json['teammates'] as List)?.map((e) => e as String)?.toList(),
      json['title'] as String);
}

Map<String, dynamic> _$StartHomeworkInfoToJson(StartHomeworkInfo instance) =>
    <String, dynamic>{
      'endTime': instance.endTime,
      'estimatedCost': instance.estimatedCost,
      'game': instance.game,
      'gameType': instance.gameType,
      'homeworkId': instance.homeworkId,
      'makeUpEndTime': instance.makeUpEndTime,
      'previewed': instance.previewed,
      'reviseEndTime': instance.reviseEndTime,
      'reviseNum': instance.reviseNum,
      'rival': instance.rival,
      'rivals': instance.rivals,
      'scheduledEnd': instance.scheduledEnd,
      'scheduledStart': instance.scheduledStart,
      'started': instance.started,
      'subjectId': instance.subjectId,
      'subjectName': instance.subjectName,
      'taskType': instance.taskType,
      'teammates': instance.teammates,
      'title': instance.title
    };

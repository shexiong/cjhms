// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homework_or_exam_statistic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeworkOrExamStatistic _$HomeworkOrExamStatisticFromJson(
    Map<String, dynamic> json) {
  return HomeworkOrExamStatistic(
      json['accuracy'] as int,
      json['correctingCount'] as int,
      json['errorCount'] as int,
      json['noAnswerCount'] as int,
      json['partRightCount'] as int,
      json['revisePercent'] as int,
      json['rightCount'] as int,
      json['submitPercent'] as int,
      json['totalCount'] as int);
}

Map<String, dynamic> _$HomeworkOrExamStatisticToJson(
        HomeworkOrExamStatistic instance) =>
    <String, dynamic>{
      'accuracy': instance.accuracy,
      'correctingCount': instance.correctingCount,
      'errorCount': instance.errorCount,
      'noAnswerCount': instance.noAnswerCount,
      'partRightCount': instance.partRightCount,
      'revisePercent': instance.revisePercent,
      'rightCount': instance.rightCount,
      'submitPercent': instance.submitPercent,
      'totalCount': instance.totalCount
    };

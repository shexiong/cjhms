// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commit_homework_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommitHomeworkResult _$CommitHomeworkResultFromJson(Map<String, dynamic> json) {
  return CommitHomeworkResult(
      json['game'] as bool,
      json['gameResultSnapshot'] == null
          ? null
          : GameResultSnapshot.fromJson(
              json['gameResultSnapshot'] as Map<String, dynamic>),
      json['homeworkId'] as int,
      json['needMark'] as int);
}

Map<String, dynamic> _$CommitHomeworkResultToJson(
        CommitHomeworkResult instance) =>
    <String, dynamic>{
      'game': instance.game,
      'gameResultSnapshot': instance.gameResultSnapshot,
      'homeworkId': instance.homeworkId,
      'needMark': instance.needMark
    };

GameResultSnapshot _$GameResultSnapshotFromJson(Map<String, dynamic> json) {
  return GameResultSnapshot(
      json['accuracy'] as int,
      json['gameName'] as String,
      json['gameType'] as int,
      json['groupResult'] as int,
      json['personResult'] as int,
      json['rivalAccuracy'] as int,
      json['rivalTimeSpent'] as int,
      json['timeSpent'] as int);
}

Map<String, dynamic> _$GameResultSnapshotToJson(GameResultSnapshot instance) =>
    <String, dynamic>{
      'accuracy': instance.accuracy,
      'gameName': instance.gameName,
      'gameType': instance.gameType,
      'groupResult': instance.groupResult,
      'personResult': instance.personResult,
      'rivalAccuracy': instance.rivalAccuracy,
      'rivalTimeSpent': instance.rivalTimeSpent,
      'timeSpent': instance.timeSpent
    };

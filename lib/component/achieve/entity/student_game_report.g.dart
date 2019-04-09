// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_game_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentGameReport _$StudentGameReportFromJson(Map<String, dynamic> json) {
  return StudentGameReport(
      json['classGameId'] as String,
      json['gameName'] as String,
      json['gameType'] as int,
      json['groupResult'] as int,
      json['ranking'] as num);
}

Map<String, dynamic> _$StudentGameReportToJson(StudentGameReport instance) =>
    <String, dynamic>{
      'classGameId': instance.classGameId,
      'gameName': instance.gameName,
      'gameType': instance.gameType,
      'groupResult': instance.groupResult,
      'ranking': instance.ranking
    };

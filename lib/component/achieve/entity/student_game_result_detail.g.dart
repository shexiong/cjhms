// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_game_result_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentGameResultDetail _$StudentGameResultDetailFromJson(
    Map<String, dynamic> json) {
  return StudentGameResultDetail(
      json['classGameId'] as String,
      json['gameName'] as String,
      json['groupResult'] as int,
      (json['playerInfo'] as List)
          ?.map((e) =>
              e == null ? null : PlayerInfo.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['gameScore'] as int,
      json['contributionScore'] as int,
      json['ranking'] as double,
      json['noGroup'] as bool);
}

Map<String, dynamic> _$StudentGameResultDetailToJson(
        StudentGameResultDetail instance) =>
    <String, dynamic>{
      'classGameId': instance.classGameId,
      'gameName': instance.gameName,
      'groupResult': instance.groupResult,
      'playerInfo': instance.playerInfo,
      'gameScore': instance.gameScore,
      'contributionScore': instance.contributionScore,
      'ranking': instance.ranking,
      'noGroup': instance.noGroup
    };

PlayerInfo _$PlayerInfoFromJson(Map<String, dynamic> json) {
  return PlayerInfo(
      json['userId'] as String,
      json['userName'] as String,
      json['accuracy'] as double,
      json['personResult'] as int,
      json['isOverdue'] as bool,
      json['rival'] == null
          ? null
          : Rival.fromJson(json['rival'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PlayerInfoToJson(PlayerInfo instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'accuracy': instance.accuracy,
      'personResult': instance.personResult,
      'isOverdue': instance.isOverdue,
      'rival': instance.rival
    };

Rival _$RivalFromJson(Map<String, dynamic> json) {
  return Rival(
      json['userId'] as String,
      json['userName'] as String,
      json['accuracy'] as double,
      json['personResult'] as int,
      json['isOverdue'] as bool);
}

Map<String, dynamic> _$RivalToJson(Rival instance) => <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'accuracy': instance.accuracy,
      'personResult': instance.personResult,
      'isOverdue': instance.isOverdue
    };

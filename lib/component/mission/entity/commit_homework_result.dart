import 'package:json_annotation/json_annotation.dart';

part 'commit_homework_result.g.dart';

///  提交作业
@JsonSerializable()
class CommitHomeworkResult extends Object {

  @JsonKey(name: 'game')
  bool game;

  @JsonKey(name: 'gameResultSnapshot')
  GameResultSnapshot gameResultSnapshot;

  @JsonKey(name: 'homeworkId')
  int homeworkId;

  @JsonKey(name: 'needMark')
  int needMark;

  CommitHomeworkResult(this.game,this.gameResultSnapshot,this.homeworkId,this.needMark,);

  factory CommitHomeworkResult.fromJson(Map<String, dynamic> srcJson) => _$CommitHomeworkResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CommitHomeworkResultToJson(this);

}


@JsonSerializable()
class GameResultSnapshot extends Object {

  @JsonKey(name: 'accuracy')
  int accuracy;

  @JsonKey(name: 'gameName')
  String gameName;

  @JsonKey(name: 'gameType')
  int gameType;

  @JsonKey(name: 'groupResult')
  int groupResult;

  @JsonKey(name: 'personResult')
  int personResult;

  @JsonKey(name: 'rivalAccuracy')
  int rivalAccuracy;

  @JsonKey(name: 'rivalTimeSpent')
  int rivalTimeSpent;

  @JsonKey(name: 'timeSpent')
  int timeSpent;

  GameResultSnapshot(this.accuracy,this.gameName,this.gameType,this.groupResult,this.personResult,
      this.rivalAccuracy,this.rivalTimeSpent,this.timeSpent,);

  factory GameResultSnapshot.fromJson(Map<String, dynamic> srcJson) => _$GameResultSnapshotFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GameResultSnapshotToJson(this);

}
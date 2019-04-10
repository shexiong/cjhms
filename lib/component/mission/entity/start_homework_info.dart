import 'package:json_annotation/json_annotation.dart';

part 'start_homework_info.g.dart';


///  获取学生开始做作业页面数据
@JsonSerializable()
class StartHomeworkInfo extends Object {

  @JsonKey(name: 'endTime')
  String endTime;

  @JsonKey(name: 'estimatedCost')
  int estimatedCost;

  @JsonKey(name: 'game')
  bool game;

  @JsonKey(name: 'gameType')
  int gameType;

  @JsonKey(name: 'homeworkId')
  int homeworkId;

  @JsonKey(name: 'makeUpEndTime')
  String makeUpEndTime;

  @JsonKey(name: 'previewed')
  int previewed;

  @JsonKey(name: 'reviseEndTime')
  String reviseEndTime;

  @JsonKey(name: 'reviseNum')
  int reviseNum;

  @JsonKey(name: 'rival')
  String rival;

  @JsonKey(name: 'rivals')
  List<String> rivals;

  @JsonKey(name: 'scheduledEnd')
  String scheduledEnd;

  @JsonKey(name: 'scheduledStart')
  String scheduledStart;

  @JsonKey(name: 'started')
  bool started;

  @JsonKey(name: 'subjectId')
  int subjectId;

  @JsonKey(name: 'subjectName')
  String subjectName;

  @JsonKey(name: 'taskType')
  int taskType;

  @JsonKey(name: 'teammates')
  List<String> teammates;

  @JsonKey(name: 'title')
  String title;

  StartHomeworkInfo(this.endTime,this.estimatedCost,this.game,this.gameType,this.homeworkId,
      this.makeUpEndTime,this.previewed,this.reviseEndTime,this.reviseNum,this.rival,this.rivals,
      this.scheduledEnd,this.scheduledStart,this.started,this.subjectId,this.subjectName,this.taskType,
      this.teammates,this.title,);

  factory StartHomeworkInfo.fromJson(Map<String, dynamic> srcJson) => _$StartHomeworkInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StartHomeworkInfoToJson(this);

}
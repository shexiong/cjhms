import 'package:json_annotation/json_annotation.dart';

part 'student_homework_item_dto.g.dart';

///  作业任务实体类
@JsonSerializable()
class StudentHomeworkItemDto extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'homeworkId')
  String homeworkId;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'endTime')
  String endTime;

  @JsonKey(name: 'subjectName')
  String subjectName;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'accuracy')
  int accuracy;

  @JsonKey(name: 'started')
  int started;

  @JsonKey(name: 'lastQuestionId')
  String lastQuestionId;

  @JsonKey(name: 'scheduled')
  int scheduled;

  @JsonKey(name: 'submitted')
  int submitted;

  @JsonKey(name: 'marked')
  int marked;

  @JsonKey(name: 'overdue')
  int overdue;

  @JsonKey(name: 'submittedBy')
  int submittedBy;

  @JsonKey(name: 'resultRead')
  int resultRead;

  @JsonKey(name: 'studentMarkEnabled')
  int studentMarkEnabled;

  @JsonKey(name: 'estimatedCost')
  int estimatedCost;

  @JsonKey(name: 'publishTime')
  String publishTime;

  @JsonKey(name: 'previewed')
  int previewed;

  @JsonKey(name: 'markEndTime')
  String markEndTime;

  @JsonKey(name: 'allowMakeUp')
  int allowMakeUp;

  @JsonKey(name: 'game')
  bool game;

  @JsonKey(name: 'noGroup')
  bool noGroup;

  @JsonKey(name: 'gameResult')
  int gameResult;

  @JsonKey(name: 'revise')
  bool revise;

  @JsonKey(name: 'reviseOverdue')
  bool reviseOverdue;

  @JsonKey(name: 'reviseScheduled')
  bool reviseScheduled;

  @JsonKey(name: 'taskStarted')
  bool taskStarted;

  StudentHomeworkItemDto(this.id,this.homeworkId,this.title,this.endTime,this.subjectName,this.status,
      this.accuracy,this.started,this.lastQuestionId,this.scheduled,this.submitted,this.marked,this.overdue,
      this.submittedBy,this.resultRead,this.studentMarkEnabled,this.estimatedCost,this.publishTime,
      this.previewed,this.markEndTime,this.allowMakeUp,this.game,this.noGroup,this.gameResult,this.revise,
      this.reviseOverdue,this.reviseScheduled,this.taskStarted,);

  factory StudentHomeworkItemDto.fromJson(Map<String, dynamic> srcJson) => _$StudentHomeworkItemDtoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StudentHomeworkItemDtoToJson(this);

}
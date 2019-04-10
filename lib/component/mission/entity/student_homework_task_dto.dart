import 'package:json_annotation/json_annotation.dart';

part 'student_homework_task_dto.g.dart';

@JsonSerializable()
class StudentHomeworkTaskDto extends Object {

  @JsonKey(name: 'plan')
  List<Plan> plan;

  @JsonKey(name: 'todo')
  List<Todo> todo;

  StudentHomeworkTaskDto(this.plan,this.todo,);

  factory StudentHomeworkTaskDto.fromJson(Map<String, dynamic> srcJson) => _$StudentHomeworkTaskDtoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StudentHomeworkTaskDtoToJson(this);

}


@JsonSerializable()
class Plan extends Object {

  @JsonKey(name: 'accuracy')
  int accuracy;

  @JsonKey(name: 'endTime')
  String endTime;

  @JsonKey(name: 'estimatedCost')
  int estimatedCost;

  @JsonKey(name: 'executed')
  bool executed;

  @JsonKey(name: 'homeworkId')
  int homeworkId;

  @JsonKey(name: 'makeUpEndTime')
  String makeUpEndTime;

  @JsonKey(name: 'resultRead')
  int resultRead;

  @JsonKey(name: 'reviseEndTime')
  String reviseEndTime;

  @JsonKey(name: 'reviseNum')
  int reviseNum;

  @JsonKey(name: 'scheduledEnd')
  String scheduledEnd;

  @JsonKey(name: 'scheduledNode')
  int scheduledNode;

  @JsonKey(name: 'scheduledStart')
  String scheduledStart;

  @JsonKey(name: 'started')
  bool started;

  @JsonKey(name: 'subjectId')
  int subjectId;

  @JsonKey(name: 'subjectName')
  String subjectName;

  @JsonKey(name: 'taskId')
  int taskId;

  @JsonKey(name: 'taskType')
  int taskType;

  @JsonKey(name: 'title')
  String title;

  Plan(this.accuracy,this.endTime,this.estimatedCost,this.executed,this.homeworkId,this.makeUpEndTime,
      this.resultRead,this.reviseEndTime,this.reviseNum,this.scheduledEnd,this.scheduledNode,
      this.scheduledStart,this.started,this.subjectId,this.subjectName,this.taskId,this.taskType,this.title,);

  factory Plan.fromJson(Map<String, dynamic> srcJson) => _$PlanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PlanToJson(this);

}


@JsonSerializable()
class Todo extends Object {

  @JsonKey(name: 'accuracy')
  int accuracy;

  @JsonKey(name: 'endTime')
  String endTime;

  @JsonKey(name: 'estimatedCost')
  int estimatedCost;

  @JsonKey(name: 'executed')
  bool executed;

  @JsonKey(name: 'homeworkId')
  int homeworkId;

  @JsonKey(name: 'makeUpEndTime')
  String makeUpEndTime;

  @JsonKey(name: 'resultRead')
  int resultRead;

  @JsonKey(name: 'reviseEndTime')
  String reviseEndTime;

  @JsonKey(name: 'reviseNum')
  int reviseNum;

  @JsonKey(name: 'scheduledEnd')
  String scheduledEnd;

  @JsonKey(name: 'scheduledNode')
  int scheduledNode;

  @JsonKey(name: 'scheduledStart')
  String scheduledStart;

  @JsonKey(name: 'started')
  bool started;

  @JsonKey(name: 'subjectId')
  int subjectId;

  @JsonKey(name: 'subjectName')
  String subjectName;

  @JsonKey(name: 'taskId')
  int taskId;

  @JsonKey(name: 'taskType')
  int taskType;

  @JsonKey(name: 'title')
  String title;

  Todo(this.accuracy,this.endTime,this.estimatedCost,this.executed,this.homeworkId,this.makeUpEndTime,
      this.resultRead,this.reviseEndTime,this.reviseNum,this.scheduledEnd,this.scheduledNode,this.scheduledStart,
      this.started,this.subjectId,this.subjectName,this.taskId,this.taskType,this.title,);

  factory Todo.fromJson(Map<String, dynamic> srcJson) => _$TodoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TodoToJson(this);

}
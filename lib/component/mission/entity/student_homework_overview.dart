import 'package:json_annotation/json_annotation.dart';

part 'student_homework_overview.g.dart';

///  获取某份作业概况
@JsonSerializable()
class StudentHomeworkOverview extends Object {

  @JsonKey(name: 'homeworkId')
  String homeworkId;

  @JsonKey(name: 'noDoes')
  int noDoes;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'questionList')
  List<QuestionList> questionList;

  @JsonKey(name: 'needRevise')
  int needRevise;

  @JsonKey(name: 'revised')
  int revised;

  @JsonKey(name: 'needStartReviseTask')
  bool needStartReviseTask;

  StudentHomeworkOverview(this.homeworkId,this.noDoes,this.status,this.title,this.questionList,this.needRevise,this.revised,this.needStartReviseTask,);

  factory StudentHomeworkOverview.fromJson(Map<String, dynamic> srcJson) => _$StudentHomeworkOverviewFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StudentHomeworkOverviewToJson(this);

}


@JsonSerializable()
class QuestionList extends Object {

  @JsonKey(name: 'questionId')
  String questionId;

  @JsonKey(name: 'isRight')
  int isRight;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'number')
  int number;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'pQuestionId')
  String pQuestionId;

  @JsonKey(name: 'pType')
  int pType;

  @JsonKey(name: 'pNumber')
  int pNumber;

  @JsonKey(name: 'pTitle')
  String pTitle;

  QuestionList(this.questionId,this.isRight,this.status,this.number,this.type,this.pQuestionId,
      this.pType,this.pNumber,this.pTitle,);

  factory QuestionList.fromJson(Map<String, dynamic> srcJson) => _$QuestionListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$QuestionListToJson(this);

}
import 'package:json_annotation/json_annotation.dart';

part 'student_homework_detail_dto.g.dart';

///  作业详情, 1、作业预览,以及做答时调用；2、作业订正时调用
@JsonSerializable()
class StudentHomeworkDetailDto extends Object {

  @JsonKey(name: 'homeworkId')
  String homeworkId;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'cost')
  int cost;

  @JsonKey(name: 'userTime')
  int userTime;

  @JsonKey(name: 'lastQuestionId')
  String lastQuestionId;

  @JsonKey(name: 'previewed')
  int previewed;

  @JsonKey(name: 'checkStatus')
  int checkStatus;

  @JsonKey(name: 'checkTime')
  int checkTime;

  @JsonKey(name: 'reviseTime')
  int reviseTime;

  @JsonKey(name: 'questionList')
  List<QuestionList> questionList;

  @JsonKey(name: 'type')
  int type;

  StudentHomeworkDetailDto(this.homeworkId,this.title,this.cost,this.userTime,this.lastQuestionId,
      this.previewed,this.checkStatus,this.checkTime,this.reviseTime,this.questionList,this.type,);

  factory StudentHomeworkDetailDto.fromJson(Map<String, dynamic> srcJson) => _$StudentHomeworkDetailDtoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StudentHomeworkDetailDtoToJson(this);

}


@JsonSerializable()
class QuestionList extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'subType')
  int subType;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'contentXml')
  String contentXml;

  @JsonKey(name: 'optionCount')
  int optionCount;

  @JsonKey(name: 'number')
  int number;

  @JsonKey(name: 'studentAnswer')
  String studentAnswer;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'answered')
  int answered;

  @JsonKey(name: 'marked')
  int marked;

  @JsonKey(name: 'answerFileId')
  String answerFileId;

  @JsonKey(name: 'answerFileUrl')
  String answerFileUrl;

  @JsonKey(name: 'needsExplain')
  int needsExplain;

  @JsonKey(name: 'parentId')
  String parentId;

  @JsonKey(name: 'level')
  int level;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'difficultyLevel')
  int difficultyLevel;

  @JsonKey(name: 'childrenList')
  List<ChildrenList> childrenList;

  @JsonKey(name: 'revised')
  int revised;

  @JsonKey(name: 'reviseAnswer')
  String reviseAnswer;

  @JsonKey(name: 'reviseAnswerFileId')
  String reviseAnswerFileId;

  @JsonKey(name: 'originalAnswerFileId')
  String originalAnswerFileId;

  @JsonKey(name: 'reviseAnswerFileUrl')
  String reviseAnswerFileUrl;

  @JsonKey(name: 'read')
  bool read;

  QuestionList(this.id,this.type,this.subType,this.content,this.contentXml,this.optionCount,this.number,
      this.studentAnswer,this.status,this.answered,this.marked,this.answerFileId,this.answerFileUrl,
      this.needsExplain,this.parentId,this.level,this.title,this.difficultyLevel,this.childrenList,
      this.revised,this.reviseAnswer,this.reviseAnswerFileId,this.originalAnswerFileId,
      this.reviseAnswerFileUrl,this.read,);

  factory QuestionList.fromJson(Map<String, dynamic> srcJson) => _$QuestionListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$QuestionListToJson(this);

}


@JsonSerializable()
class ChildrenList extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'subType')
  int subType;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'contentXml')
  String contentXml;

  @JsonKey(name: 'optionCount')
  int optionCount;

  @JsonKey(name: 'number')
  int number;

  @JsonKey(name: 'studentAnswer')
  String studentAnswer;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'answered')
  int answered;

  @JsonKey(name: 'marked')
  int marked;

  @JsonKey(name: 'answerFileId')
  String answerFileId;

  @JsonKey(name: 'answerFileUrl')
  String answerFileUrl;

  @JsonKey(name: 'needsExplain')
  int needsExplain;

  @JsonKey(name: 'parentId')
  String parentId;

  @JsonKey(name: 'level')
  int level;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'difficultyLevel')
  int difficultyLevel;

  @JsonKey(name: 'childrenList')
  ChildrenList childrenList;

  @JsonKey(name: 'revised')
  int revised;

  @JsonKey(name: 'reviseAnswer')
  String reviseAnswer;

  @JsonKey(name: 'reviseAnswerFileId')
  String reviseAnswerFileId;

  @JsonKey(name: 'originalAnswerFileId')
  String originalAnswerFileId;

  @JsonKey(name: 'reviseAnswerFileUrl')
  String reviseAnswerFileUrl;

  @JsonKey(name: 'read')
  bool read;

  ChildrenList(this.id,this.type,this.subType,this.content,this.contentXml,this.optionCount,
      this.number,this.studentAnswer,this.status,this.answered,this.marked,this.answerFileId,
      this.answerFileUrl,this.needsExplain,this.parentId,this.level,this.title,this.difficultyLevel,
      this.childrenList,this.revised,this.reviseAnswer,this.reviseAnswerFileId,this.originalAnswerFileId,
      this.reviseAnswerFileUrl,this.read,);

  factory ChildrenList.fromJson(Map<String, dynamic> srcJson) => _$ChildrenListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ChildrenListToJson(this);

}

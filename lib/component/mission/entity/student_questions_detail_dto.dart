import 'package:json_annotation/json_annotation.dart';

part 'student_questions_detail_dto.g.dart';

///  学生作业每道题的详情
@JsonSerializable()
class StudentQuestionsDetailDto extends Object {

  @JsonKey(name: 'answer')
  String answer;

  @JsonKey(name: 'answerContent')
  String answerContent;

  @JsonKey(name: 'answerContentXml')
  String answerContentXml;

  @JsonKey(name: 'answerFileSmallUrl')
  String answerFileSmallUrl;

  @JsonKey(name: 'answerFileUrl')
  String answerFileUrl;

  @JsonKey(name: 'answered')
  int answered;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'contentXml')
  String contentXml;

  @JsonKey(name: 'difficultyLevel')
  int difficultyLevel;

  @JsonKey(name: 'explainContent')
  String explainContent;

  @JsonKey(name: 'explainContentXml')
  String explainContentXml;

  @JsonKey(name: 'failReason')
  int failReason;

  @JsonKey(name: 'hasMarkFeedback')
  int hasMarkFeedback;

  @JsonKey(name: 'marked')
  int marked;

  @JsonKey(name: 'markedResult')
  int markedResult;

  @JsonKey(name: 'markingStudentName')
  String markingStudentName;

  @JsonKey(name: 'materialContent')
  String materialContent;

  @JsonKey(name: 'materialContentXml')
  String materialContentXml;

  @JsonKey(name: 'needRevise')
  bool needRevise;

  @JsonKey(name: 'otherStudentAnswer')
  List<OtherStudentAnswer> otherStudentAnswer;

  @JsonKey(name: 'questionId')
  int questionId;

  @JsonKey(name: 'reviseAnswer')
  String reviseAnswer;

  @JsonKey(name: 'reviseAnswerFileSmallUrl')
  String reviseAnswerFileSmallUrl;

  @JsonKey(name: 'reviseAnswerFileUrl')
  String reviseAnswerFileUrl;

  @JsonKey(name: 'reviseIsRight')
  int reviseIsRight;

  @JsonKey(name: 'reviseScore')
  int reviseScore;

  @JsonKey(name: 'revised')
  bool revised;

  @JsonKey(name: 'score')
  int score;

  @JsonKey(name: 'source')
  int source;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'studentAnswer')
  String studentAnswer;

  @JsonKey(name: 'studentMarked')
  int studentMarked;

  @JsonKey(name: 'subType')
  int subType;

  @JsonKey(name: 'teacherMarked')
  int teacherMarked;

  @JsonKey(name: 'teacherRemark')
  String teacherRemark;

  @JsonKey(name: 'type')
  int type;

  StudentQuestionsDetailDto(this.answer,this.answerContent,this.answerContentXml,this.answerFileSmallUrl,
      this.answerFileUrl,this.answered,this.content,this.contentXml,this.difficultyLevel,this.explainContent,
      this.explainContentXml,this.failReason,this.hasMarkFeedback,this.marked,this.markedResult,
      this.markingStudentName,this.materialContent,this.materialContentXml,this.needRevise,this.otherStudentAnswer,
      this.questionId,this.reviseAnswer,this.reviseAnswerFileSmallUrl,this.reviseAnswerFileUrl,this.reviseIsRight,
      this.reviseScore,this.revised,this.score,this.source,this.status,this.studentAnswer,this.studentMarked,
      this.subType,this.teacherMarked,this.teacherRemark,this.type,);

  factory StudentQuestionsDetailDto.fromJson(Map<String, dynamic> srcJson) => _$StudentQuestionsDetailDtoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StudentQuestionsDetailDtoToJson(this);

}


@JsonSerializable()
class OtherStudentAnswer extends Object {

  @JsonKey(name: 'explainImageId')
  int explainImageId;

  @JsonKey(name: 'explainImageSmallUrl')
  String explainImageSmallUrl;

  @JsonKey(name: 'explainImageUrl')
  String explainImageUrl;

  @JsonKey(name: 'originalExplainImageId')
  int originalExplainImageId;

  @JsonKey(name: 'studentId')
  int studentId;

  @JsonKey(name: 'studentName')
  String studentName;

  OtherStudentAnswer(this.explainImageId,this.explainImageSmallUrl,this.explainImageUrl,this.originalExplainImageId,
      this.studentId,this.studentName,);

  factory OtherStudentAnswer.fromJson(Map<String, dynamic> srcJson) => _$OtherStudentAnswerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OtherStudentAnswerToJson(this);

}
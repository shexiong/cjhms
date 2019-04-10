import 'package:json_annotation/json_annotation.dart';

part 'student_mark_question_dto.g.dart';

///  学生待批改作业的问题列表数据
@JsonSerializable()
class StudentMarkQuestionDto extends Object {

  @JsonKey(name: 'studentMarkQuestionDtos')
  List<StudentMarkQuestionDtos> studentMarkQuestionDtos;

  @JsonKey(name: 'studentNum')
  int studentNum;

  StudentMarkQuestionDto(this.studentMarkQuestionDtos,this.studentNum,);

  factory StudentMarkQuestionDto.fromJson(Map<String, dynamic> srcJson) => _$StudentMarkQuestionDtoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StudentMarkQuestionDtoToJson(this);

}


@JsonSerializable()
class StudentMarkQuestionDtos extends Object {

  @JsonKey(name: 'answerContent')
  String answerContent;

  @JsonKey(name: 'answerContentXml')
  String answerContentXml;

  @JsonKey(name: 'answerFileId')
  int answerFileId;

  @JsonKey(name: 'answerFileUrl')
  String answerFileUrl;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'contentXml')
  String contentXml;

  @JsonKey(name: 'explainContent')
  String explainContent;

  @JsonKey(name: 'explainContentXml')
  String explainContentXml;

  @JsonKey(name: 'homeworkId')
  int homeworkId;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'marked')
  int marked;

  @JsonKey(name: 'materialContent')
  String materialContent;

  @JsonKey(name: 'materialContentXml')
  String materialContentXml;

  @JsonKey(name: 'pQuestionNum')
  int pQuestionNum;

  @JsonKey(name: 'pTitle')
  String pTitle;

  @JsonKey(name: 'pType')
  int pType;

  @JsonKey(name: 'parentId')
  int parentId;

  @JsonKey(name: 'questionId')
  int questionId;

  @JsonKey(name: 'questionNum')
  int questionNum;

  @JsonKey(name: 'source')
  int source;

  @JsonKey(name: 'studentId')
  int studentId;

  @JsonKey(name: 'studentMarkScore')
  int studentMarkScore;

  @JsonKey(name: 'studentMarked')
  int studentMarked;

  @JsonKey(name: 'studentMarkedResult')
  int studentMarkedResult;

  @JsonKey(name: 'type')
  int type;

  StudentMarkQuestionDtos(this.answerContent,this.answerContentXml,this.answerFileId,this.answerFileUrl,
      this.content,this.contentXml,this.explainContent,this.explainContentXml,this.homeworkId,this.id,
      this.marked,this.materialContent,this.materialContentXml,this.pQuestionNum,this.pTitle,this.pType,
      this.parentId,this.questionId,this.questionNum,this.source,this.studentId,this.studentMarkScore,
      this.studentMarked,this.studentMarkedResult,this.type,);

  factory StudentMarkQuestionDtos.fromJson(Map<String, dynamic> srcJson) => _$StudentMarkQuestionDtosFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StudentMarkQuestionDtosToJson(this);

}
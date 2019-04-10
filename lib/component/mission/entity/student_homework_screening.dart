import 'package:json_annotation/json_annotation.dart';

part 'student_homework_screening.g.dart';

///  获取筛选条件(科目、年级)
@JsonSerializable()
class HomeworkScreening extends Object {

  @JsonKey(name: 'grades')
  List<Grades> grades;

  @JsonKey(name: 'subjects')
  List<Subjects> subjects;

  HomeworkScreening(this.grades,this.subjects,);

  factory HomeworkScreening.fromJson(Map<String, dynamic> srcJson) => _$HomeworkScreeningFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeworkScreeningToJson(this);

}


@JsonSerializable()
class Grades extends Object {

  @JsonKey(name: 'gradeName')
  String gradeName;

  @JsonKey(name: 'uniGradeId')
  int uniGradeId;

  Grades(this.gradeName,this.uniGradeId,);

  factory Grades.fromJson(Map<String, dynamic> srcJson) => _$GradesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GradesToJson(this);

}


@JsonSerializable()
class Subjects extends Object {

  @JsonKey(name: 'subjectId')
  int subjectId;

  @JsonKey(name: 'subjectName')
  String subjectName;

  Subjects(this.subjectId,this.subjectName,);

  factory Subjects.fromJson(Map<String, dynamic> srcJson) => _$SubjectsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SubjectsToJson(this);

}
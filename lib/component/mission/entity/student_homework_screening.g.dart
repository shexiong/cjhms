// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_homework_screening.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeworkScreening _$HomeworkScreeningFromJson(Map<String, dynamic> json) {
  return HomeworkScreening(
      (json['grades'] as List)
          ?.map((e) =>
              e == null ? null : Grades.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['subjects'] as List)
          ?.map((e) =>
              e == null ? null : Subjects.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HomeworkScreeningToJson(HomeworkScreening instance) =>
    <String, dynamic>{'grades': instance.grades, 'subjects': instance.subjects};

Grades _$GradesFromJson(Map<String, dynamic> json) {
  return Grades(json['gradeName'] as String, json['uniGradeId'] as int);
}

Map<String, dynamic> _$GradesToJson(Grades instance) => <String, dynamic>{
      'gradeName': instance.gradeName,
      'uniGradeId': instance.uniGradeId
    };

Subjects _$SubjectsFromJson(Map<String, dynamic> json) {
  return Subjects(json['subjectId'] as int, json['subjectName'] as String);
}

Map<String, dynamic> _$SubjectsToJson(Subjects instance) => <String, dynamic>{
      'subjectId': instance.subjectId,
      'subjectName': instance.subjectName
    };

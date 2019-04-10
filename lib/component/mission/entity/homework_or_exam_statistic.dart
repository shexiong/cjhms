import 'package:json_annotation/json_annotation.dart';

part 'homework_or_exam_statistic.g.dart';

///  作业或考试统计详情
@JsonSerializable()
class HomeworkOrExamStatistic extends Object {

  @JsonKey(name: 'accuracy')
  int accuracy;

  @JsonKey(name: 'correctingCount')
  int correctingCount;

  @JsonKey(name: 'errorCount')
  int errorCount;

  @JsonKey(name: 'noAnswerCount')
  int noAnswerCount;

  @JsonKey(name: 'partRightCount')
  int partRightCount;

  @JsonKey(name: 'revisePercent')
  int revisePercent;

  @JsonKey(name: 'rightCount')
  int rightCount;

  @JsonKey(name: 'submitPercent')
  int submitPercent;

  @JsonKey(name: 'totalCount')
  int totalCount;

  HomeworkOrExamStatistic(this.accuracy,this.correctingCount,this.errorCount,this.noAnswerCount,
      this.partRightCount,this.revisePercent,this.rightCount,this.submitPercent,this.totalCount,);

  factory HomeworkOrExamStatistic.fromJson(Map<String, dynamic> srcJson) => _$HomeworkOrExamStatisticFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeworkOrExamStatisticToJson(this);

}



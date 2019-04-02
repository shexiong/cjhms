import 'package:json_annotation/json_annotation.dart';

part 'response_achieve_report.g.dart';

///  战绩播报实体类
@JsonSerializable()
class StudentGameReport extends Object {

  @JsonKey(name: 'classGameId')
  int classGameId;

  @JsonKey(name: 'gameName')
  String gameName;

  @JsonKey(name: 'gameType')
  int gameType;

  @JsonKey(name: 'groupResult')
  int groupResult;

  @JsonKey(name: 'ranking')
  int ranking;

  StudentGameReport(this.classGameId,this.gameName,this.gameType,this.groupResult,this.ranking,);

  factory StudentGameReport.fromJson(Map<String, dynamic> srcJson) => _$StudentGameReportFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StudentGameReportToJson(this);



}

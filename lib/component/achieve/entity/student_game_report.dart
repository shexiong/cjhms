import 'package:json_annotation/json_annotation.dart';

part 'student_game_report.g.dart';

///  战绩播报实体类
@JsonSerializable()
class StudentGameReport extends Object {

  @JsonKey(name: 'classGameId')
  String classGameId;

  @JsonKey(name: 'gameName')
  String gameName;

  @JsonKey(name: 'gameType')
  int gameType;

  @JsonKey(name: 'groupResult')
  int groupResult;

  @JsonKey(name: 'ranking')
  num ranking;

  StudentGameReport(this.classGameId,this.gameName,this.gameType,this.groupResult,this.ranking,);

  factory StudentGameReport.fromJson(Map<String, dynamic> srcJson) => _$StudentGameReportFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StudentGameReportToJson(this);

  ///  战绩文字拼接
  static String getReport(StudentGameReport report){
    String gameName = report.gameName;
    String head = report.groupResult == 1 ? "恭喜" : report.groupResult == 2 ? "" : "很遗憾";
    String end = report.groupResult == 1 ? "赢得胜利！" : report.groupResult == 2 ? "双方实力均衡！" : "挑战失败！";
    String name = report.gameType == 1 ? "你" : report.gameType == 10 ? "" : "你们";
    String content;
    if (report.gameType == 10) {
      num rank = report.ranking == null ? 0 : report.ranking;
      String ranking = (rank * 100).toStringAsFixed(0);
      content = "你在《$gameName》PK中战胜了$ranking%的人哦";
    } else {
      content = "$head$name在《$gameName》PK中$end";
    }
    return content;
  }

}

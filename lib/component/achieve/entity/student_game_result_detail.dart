
import 'package:common_utils/common_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student_game_result_detail.g.dart';

///  战绩播报详情
@JsonSerializable()
class StudentGameResultDetail extends Object {

  @JsonKey(name: 'classGameId')
  String classGameId;

  @JsonKey(name: 'gameName')
  String gameName;

  @JsonKey(name: 'groupResult')
  int groupResult;

  @JsonKey(name: 'playerInfo')
  List<PlayerInfo> playerInfo;

  @JsonKey(name: 'gameScore')
  int gameScore;

  @JsonKey(name: 'contributionScore')
  int contributionScore;

  @JsonKey(name: 'noGroup')
  bool noGroup;

  @JsonKey(name: 'ranking')
  double ranking;

  StudentGameResultDetail(this.classGameId,this.gameName,this.groupResult,this.playerInfo,this.gameScore,this.contributionScore,this.ranking,this.noGroup,);

  factory StudentGameResultDetail.fromJson(Map<String, dynamic> srcJson) => _$StudentGameResultDetailFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StudentGameResultDetailToJson(this);

  ///  战绩详情标题文字拼接
  static String getReportTitle(StudentGameResultDetail report){
    if(ObjectUtil.isEmpty(report?.classGameId)){
      return "";
    }
    String gameName = report.gameName;
    String head = report.groupResult == 1 ? "恭喜" : report.groupResult == 2 ? "" : "很遗憾";
    String end = report.groupResult == 1 ? "赢得胜利！" : report.groupResult == 2 ? "双方实力均衡！" : "挑战失败！";
    String content;
    if (report.noGroup) {
      num rank = report.ranking == null ? 0 : report.ranking;
      String ranking = (rank * 100).toStringAsFixed(0);
      content = "你在《$gameName》PK中战胜了$ranking%的人哦";
    } else {
      String name = report.playerInfo.length > 1 ? "你们":"你";
      content = "$head$name在《$gameName》PK中$end";
    }
    return content;
  }

  ///  战绩详情奖励和贡献值文字拼接
  static String getReportScoreText(StudentGameResultDetail report){
    if(ObjectUtil.isEmpty(report?.classGameId)){
      return "";
    }
    int score = report.gameScore;
    String scoreText = score > 0 ? "奖励：积分 +$score" : "";
    int contributionScore = report.contributionScore;
    String contributionScoreText = contributionScore > 0 ? "团队贡献值 +$contributionScore" : "";

    return scoreText + "    " + contributionScoreText;
  }

}


@JsonSerializable()
class PlayerInfo extends Object {

  @JsonKey(name: 'userId')
  String userId;

  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'accuracy')
  double accuracy;

  @JsonKey(name: 'personResult')
  int personResult;

  @JsonKey(name: 'isOverdue')
  bool isOverdue;

  @JsonKey(name: 'rival')
  Rival rival;

  PlayerInfo(this.userId,this.userName,this.accuracy,this.personResult,this.isOverdue,this.rival,);

  factory PlayerInfo.fromJson(Map<String, dynamic> srcJson) => _$PlayerInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PlayerInfoToJson(this);

}


@JsonSerializable()
class Rival extends Object {

  @JsonKey(name: 'userId')
  String userId;

  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'accuracy')
  double accuracy;

  @JsonKey(name: 'personResult')
  int personResult;

  @JsonKey(name: 'isOverdue')
  bool isOverdue;

  Rival(this.userId,this.userName,this.accuracy,this.personResult,this.isOverdue,);

  factory Rival.fromJson(Map<String, dynamic> srcJson) => _$RivalFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RivalToJson(this);




}




import 'package:cjhms/api/api.dart';
import 'package:cjhms/common/constant.dart';
import 'package:cjhms/component/achieve/entity/student_game_report.dart';
import 'package:cjhms/component/achieve/entity/student_game_result_detail.dart';
import 'package:cjhms/utils/dio_util.dart';
import 'package:common_utils/common_utils.dart';

///
/// @author She xiong
/// 创建日期：2019/3/31
/// 描述： 战绩播报数据获取类
///
///
class AchieveRepository{

  ///  获取战绩播报数据
  Future<List<StudentGameReport>> getAchieveReportData() async{
//    BaseResp<List> baseResp = await DioUtil.getInstance().request<List>(
//        Method.get, Api.ACHIEVE_REPORT,
//        options: DioUtil.changeBaseUrlOptions(false));
//    List<StudentGameReport> reportList;
//    if (baseResp.code == Constant.STATUS_SUCCESS && baseResp.data != null
//    && baseResp.data.length > 0) {
      //  data反序列化为对象
//      reportList = baseResp.data.map((value){
//        return StudentGameReport.fromJson(value);
//      }).toList();
//    }


    //  TODO   测试数据
    return [
      StudentGameReport.fromJson({"classGameId": "561547948270288896",
        "gameName": "2019-03-30语文作业", "groupResult": 2, "gameType": 1, "ranking": null}),
      StudentGameReport.fromJson({"classGameId": "561547948270288896",
        "gameName": "03-28语文作业", "groupResult": 1, "gameType": 2, "ranking": null}),
      StudentGameReport.fromJson({"classGameId": "561547948270288896",
        "gameName": "01-01语文作业", "groupResult": 1, "gameType": 10, "ranking": 0.56}),
    ];


//    return new List<StudentGameReport>();
  }

  ///  获取战绩播报详情
  Future<StudentGameResultDetail> getAchieveReportDetail(String classGameId) async{
    //  拼接id
    String path = Api.ACHIEVE_REPORT_DETAIL + classGameId;
    BaseResp<Map<String,dynamic>> baseResp = await DioUtil.getInstance().request<Map<String,dynamic>>(
        Method.get, path,
        options: DioUtil.changeBaseUrlOptions(false));
    if (baseResp.code == Constant.STATUS_SUCCESS && !ObjectUtil.isEmptyMap(baseResp.data)) {
      //  data反序列化为对象
      return StudentGameResultDetail.fromJson(baseResp.data);
    }
    return StudentGameResultDetail.fromJson(new Map());
  }




}
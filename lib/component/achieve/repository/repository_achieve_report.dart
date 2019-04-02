
import 'package:cjhms/api/api.dart';
import 'package:cjhms/common/constant.dart';
import 'package:cjhms/component/achieve/entity/response_achieve_report.dart';
import 'package:cjhms/utils/dio_util.dart';

///
/// @author She xiong
/// 创建日期：2019/3/31
/// 描述： 战绩播报数据获取类
///
///
class AchieveRepository{

  ///  获取战绩播报数据
  Future<StudentGameReport> getAchieveReportData() async{
    BaseResp<Map<String, dynamic>> baseResp = await DioUtil.getInstance().request<Map<String, dynamic>>(
        Method.get, Api.ACHIEVE_REPORT,
        options: DioUtil.changeBaseUrlOptions(true));

    if (baseResp.code == Constant.STATUS_SUCCESS && baseResp.data.isNotEmpty) {
      //  将得到的map反序列化为对象
      return StudentGameReport.fromJson(baseResp.data);
    }
    return new StudentGameReport(-1,"",-1,-1,-1);
  }






}
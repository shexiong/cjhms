

import 'package:cjhms/api/api.dart';
import 'package:cjhms/common/constant.dart';
import 'package:cjhms/component/mission/entity/student_homework_item_dto.dart';
import 'package:cjhms/utils/dio_util.dart';

class HomeworkRepository{

  ///  获取学生作业列表
  ///
  ///  页次，每页数量，
  /// needRevise：是否需要订正，[0:不需要,1:需要]
  /// status：作业状态[3:未批改,4:已批改,5:逾期未提交]
  /// subjectId：科目id
  /// uniGradeId：固定年纪id
  Future<List<StudentHomeworkItemDto>> getHomeworkListData(int page, int pageSize, int needRevise,
      List<int> status,int subjectId, int uniGradeId) async{
    BaseResp<List> baseResp = await DioUtil.getInstance().request<List>(
        Method.get, Api.HOMEWORK_LIST_DATA, data: {'page':page,'pageSize':pageSize,'needRevise':needRevise,'status':status,
      'subjectId':subjectId,'uniGradeId':uniGradeId}, options: DioUtil.changeBaseUrlOptions(false));
    List<StudentHomeworkItemDto> list = [];
    if (baseResp.code == Constant.STATUS_SUCCESS && baseResp.data != null ) {
      //  data反序列化为对象
      list = baseResp.data.map((value){
        return StudentHomeworkItemDto.fromJson(value);
      }).toList();
    }
    if(list.isNotEmpty){
      return list;
    }
    return new List();
  }
}
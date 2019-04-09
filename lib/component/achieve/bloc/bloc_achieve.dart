
import 'dart:collection';

import 'package:cjhms/component/achieve/entity/student_game_report.dart';
import 'package:cjhms/component/achieve/entity/student_game_result_detail.dart';
import 'package:cjhms/component/achieve/repository/repository_achieve_report.dart';
import 'package:cjhms/component/base/bloc_provider.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

///
/// @author She xiong
/// 创建日期：2019/3/31
/// 描述：  战绩播报bloc
///
///
class AchieveBloc implements BlocBase{

  ///------------------------------   home    ------------------------------- ///
  BehaviorSubject<List<StudentGameReport>> studentReportSubject = BehaviorSubject<List<StudentGameReport>>();
  Stream<List<StudentGameReport>> get studentReportStream => studentReportSubject.stream;
  BehaviorSubject<int> homeEvent = BehaviorSubject<int>();
  Stream<int> get homeStream => homeEvent.stream;

  ///------------------------------   detail    ------------------------------- ///
  BehaviorSubject<Map<int,StudentGameResultDetail>> studentReportDetailSubject = BehaviorSubject<Map<int,StudentGameResultDetail>>();
  Stream<Map<int,StudentGameResultDetail>> get studentReportDetailStream => studentReportDetailSubject.stream;
  Map<int,StudentGameResultDetail> detailMap = new Map();


  AchieveRepository repository = new AchieveRepository();

  @override
  void dispose() {
    studentReportSubject.close();
    homeEvent.close();
    studentReportDetailSubject.close();
  }

  ///  获取战绩播报数据
  Future getAchieveReportData() async{
    List<StudentGameReport> reportList =  await repository.getAchieveReportData();
    if(reportList != null){
      homeEvent.sink.add(RefreshStatus.idle);
      studentReportSubject.sink.add(UnmodifiableListView<StudentGameReport>(reportList));
    }else{
      homeEvent.sink.add(RefreshStatus.failed);
      studentReportSubject.sink.add(UnmodifiableListView<StudentGameReport>(List()));
    }
  }

  ///  获取战绩播报详情
  Future getAchieveReportDetail(int index, String classGameId) async{
//    if(detailMap.containsKey(index)){
//      studentReportDetailSubject.sink.add(detailMap);
//    }else{
//      StudentGameResultDetail detail = await repository.getAchieveReportDetail(classGameId);
//      if(detail != null && ObjectUtil.isEmpty(detail?.classGameId)){
//        detailMap.addAll({index:detail});
//        studentReportDetailSubject.sink.add(detailMap);
//      }else{
//        detailMap.addAll({index:StudentGameResultDetail.fromJson({})});
//        studentReportDetailSubject.sink.add(detailMap);
//      }
//    }



    //  TODO  测试数据
    StudentGameResultDetail detail;
    if(index == 0){
      detail = StudentGameResultDetail.fromJson(
          {"classGameId": "561547948270288896", "gameName": "2019-03-30语文作业", "groupResult": 3,
            "playerInfo": [{"userId": "371", "userName": "刘标", "accuracy": 0.70, "personResult": 1, "isOverdue": true,
          "rival": {"userId": "379", "userName": "曾文杰", "accuracy": 0.30, "personResult": 2, "isOverdue": true, "rival": null}}],
            "gameScore": 0, "contributionScore": 0, "noGroup": false, "ranking": null}
      );
    }else if(index == 1){
      detail = StudentGameResultDetail.fromJson(
          {"classGameId": "561547948270288896", "gameName": "2019-03-28语文作业", "groupResult": 1,
            "playerInfo": [{"userId": "371", "userName": "啊哈哈", "accuracy": 0.40, "personResult": 2, "isOverdue": true,
              "rival": {"userId": "379", "userName": "特如果", "accuracy": 0.60, "personResult": 2, "isOverdue": true, "rival": null}}],
            "gameScore": 2, "contributionScore": 3, "noGroup": false, "ranking": null}
      );
    }else{
      detail = StudentGameResultDetail.fromJson(
          {"classGameId": "561547948270288896", "gameName": "01-01语文作业", "groupResult": 2,
            "playerInfo": [{"userId": "371", "userName": "功率表", "accuracy": 0.0, "personResult": 2, "isOverdue": true,
              "rival": {"userId": "379", "userName": "凤斯蒂芬", "accuracy": 0.0, "personResult": 2, "isOverdue": true, "rival": null}}],
            "gameScore": 1, "contributionScore": 5, "noGroup": true, "ranking": 0.56}
      );
    }
    if(detail != null && ObjectUtil.isNotEmpty(detail?.classGameId)){
      detailMap.addAll({index:detail});
      studentReportDetailSubject.sink.add(detailMap);
    }else{
      detailMap.addAll({index:StudentGameResultDetail.fromJson({})});
      studentReportDetailSubject.sink.add(detailMap);
    }
  }



}
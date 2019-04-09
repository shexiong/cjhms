
import 'package:cjhms/component/achieve/bloc/bloc_achieve.dart';
import 'package:cjhms/component/achieve/entity/student_game_report.dart';
import 'package:cjhms/component/achieve/ui/router_achieve_detail_page.dart';
import 'package:cjhms/component/base/bloc_provider.dart';
import 'package:cjhms/resources/res_index.dart';
import 'package:cjhms/utils/navigator_util.dart';
import 'package:flutter/material.dart';

class AchieveReportItem extends StatelessWidget {

  const AchieveReportItem(this.index, this.reportList, {Key key,}) : super(key: key);

  final int index;
  final List<StudentGameReport> reportList;

  @override
  Widget build(BuildContext context) {
    StudentGameReport report = reportList[index];
    Color textColor = report.groupResult == 3 ? ColorT.gray_99 : report.gameType == 10
        ? ColorT.gray_99 : ColorT.app_common;

    return new Center(
      child: new ListTile(
        onTap: () {},
        enabled: false,
        title: new Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
                left: Dimens.ratio_width_8, right: Dimens.ratio_width_8),
            height: Dimens.ratio_height_6,
            decoration: new BoxDecoration(
              border: Border.all(color: ColorT.app_common, width: 1.0),
              borderRadius: BorderRadius.circular(Dimens.ratio_height_3),
              color: ColorT.transparent_gray_aa,
            ),
            child: new FlatButton(
                onPressed: () {
                  NavigatorUtil.pushPage(context, new BlocProvider<AchieveBloc>(
                    child: AchieveDetailPage(index, reportList),bloc: new AchieveBloc(),));
                },
                padding: EdgeInsets.zero,
                shape: new RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(
                      Dimens.ratio_height_3)),
                ),
                child: new Center(
                  child: new Text(StudentGameReport.getReport(report),
                    style: new TextStyle(fontSize: Dimens.font_space_20, color: textColor),),
                )
            )
        ),
      ),
    );
  }

}
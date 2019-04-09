
import 'package:cjhms/common/constant.dart';
import 'package:cjhms/component/achieve/entity/student_game_result_detail.dart';
import 'package:cjhms/component/achieve/ui/widget/custom_pk_painter.dart';
import 'package:cjhms/resources/res_index.dart';
import 'package:flutter/material.dart';

class AchieveReportDetailItem extends StatelessWidget {

  const AchieveReportDetailItem(this.info, {Key key,}) : super(key: key);

  final PlayerInfo info;

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      height: Dimens.ratio_height_30,
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Icon(IconData(0xe671, fontFamily: Constant.IconFontFamily,), size: Dimens.ratio_width_8,
                    color: ColorT.app_common,),
                  Gaps.verticalGapPercent4,
                  new Text("王莉莉", style: new TextStyle(
                      fontSize: Dimens.font_space_16, color: Colors.black87),
                  ),
                  Gaps.verticalGap8,
                  new Text("胜利", style: TextStyle(fontSize: Dimens.font_space_22,color: ColorT.app_common)),
                  Gaps.verticalGapPercent4,
                  new Text("正确率：50%", style: new TextStyle(
                      fontSize: Dimens.font_space_15, color: Colors.black54)),
                ],
              ),
          ),
          new Expanded(
              child: new Stack(
                children: <Widget>[
                  new Container(
                    alignment: Alignment.center,
                    child: new CustomPaint(
                      size: new Size(Dimens.ratio_width_15, Dimens.ratio_width_15),
                      painter: new PkPainter(type: info.personResult),
                    ),
                  ),
                  new Container(
                    alignment: Alignment.center,
                    child: new Text("PK", style: TextStyle(fontFamily: 'Roboto-BlackItalic',
                        fontSize: Dimens.font_space_48, color: Color(0xffffc14d)),),
                  ),
                ],
              )
          ),
          new Expanded(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(IconData(0xe671, fontFamily: Constant.IconFontFamily,), size: Dimens.ratio_width_8,
                  color: ColorT.app_common,),
                Gaps.verticalGapPercent4,
                new Text("王莉莉", style: new TextStyle(
                    fontSize: Dimens.font_space_16, color: Colors.black87),
                ),
                Gaps.verticalGap8,
                new Text("胜利", style: TextStyle(fontSize: Dimens.font_space_22,color: ColorT.app_common)),
                Gaps.verticalGapPercent4,
                new Text("正确率：50%", style: new TextStyle(
                    fontSize: Dimens.font_space_15, color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
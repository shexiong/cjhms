import 'package:cjhms/common/constant.dart';
import 'package:cjhms/component/achieve/adapter/adapter_achieve_detail_item.dart';
import 'package:cjhms/component/achieve/bloc/bloc_achieve.dart';
import 'package:cjhms/component/achieve/entity/student_game_report.dart';
import 'package:cjhms/component/achieve/entity/student_game_result_detail.dart';
import 'package:cjhms/component/achieve/ui/widget/custom_bg_painter.dart';
import 'package:cjhms/component/base/bloc_provider.dart';
import 'package:cjhms/resources/res_index.dart';
import 'package:cjhms/utils/utils.dart';
import 'package:cjhms/widget/widget_app_bar.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

///
/// @author She xiong
/// 创建日期：2019/4/2
/// 描述： 战绩播报详情页面
///
///
class AchieveDetailPage extends StatefulWidget {
  /// 初始化在第几页
  final int index;
  final List<StudentGameReport> reportList;

  const AchieveDetailPage(this.index, this.reportList, {Key key})
      : super(key: key);

  @override
  _AchieveDetailState createState() => new _AchieveDetailState();
}

class _AchieveDetailState extends State<AchieveDetailPage> {
  AchieveBloc bloc;
  PageController _pageController;
  bool isFirstIn = true;

  @override
  initState() {
    super.initState();
    //  初始化显示index位置页面
    _pageController = new PageController(initialPage: widget.index);
  }

  ///  初始化获取数据
  Future _initData(int currentIndex) async {
    await bloc.getAchieveReportDetail(
        currentIndex, widget.reportList[currentIndex].classGameId);
  }

  @override
  Widget build(BuildContext context) {
    //  拿到bloc
    bloc = BlocProvider.of<AchieveBloc>(context);
    new Future.delayed(new Duration(milliseconds: 500), () {
      _initData(widget.index);
    });
    return new Scaffold(
      backgroundColor: ColorT.app_common,
      body: new Stack(
        children: <Widget>[
          buildCustomAppBar(context),
          buildContainer,
        ],
      ),
    );
  }

  CustomAppBar buildCustomAppBar(BuildContext context) {
    return new CustomAppBar(
        child: new Stack(
          children: <Widget>[
            new Align(
                alignment: Alignment.topLeft,
                child: new Container(
                  margin: EdgeInsets.only(
                      top: Dimens.ratio_height_4,
                      left: Dimens.ratio_width_3),
                  child: new IconButton(
                    iconSize: Dimens.space_width_24,
                    icon: new Icon(
                      IconData(
                        0xe672, fontFamily: Constant.IconFontFamily,),
                      color: Colors.white,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
            ),
            new Align(
                alignment: Alignment.topCenter,
                child: new Container(
                  margin: EdgeInsets.only(
                      top: Dimens.ratio_height_5),
                  child: new Text("战绩播报",
                    style: TextStyle(fontSize: Dimens.font_space_18,
                        color: Colors.white),),
                )
            ),
          ],
        )
    );
  }

  Container get buildContainer {
    return new Container(
      margin: EdgeInsets.only(top: Dimens.ratio_width_8),
      child: new PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          //  翻页时的动作
          if (index >= 0 || index < widget.reportList.length) {
            isFirstIn = false;
            _initData(index);
          }
        },
        itemBuilder: (BuildContext context, int index) {
          return buildCardView(index);
        },
        itemCount: widget.reportList == null ? 1 : widget.reportList.length,
      ),
    );
  }

  Widget buildCardView(int index) {
    return new StreamBuilder(
        stream: bloc.studentReportDetailStream,
        builder: (BuildContext context,
            AsyncSnapshot<Map<int, StudentGameResultDetail>> snapshot) {
          StudentGameResultDetail detail = StudentGameResultDetail.fromJson({});
          if (ObjectUtil.isNotEmpty(snapshot.data)) {
            detail = snapshot.data[index];
            if (isFirstIn &&
                ObjectUtil.isNotEmpty(snapshot.data[widget.index])) {
              detail = snapshot.data[widget.index];
            }
          }

          //  得到以下数据用于显示
          String gameName = detail?.gameName;
          double rankNum = detail?.ranking;
          String ranking = rankNum == null ? "0" : (rankNum * 100)
              .toStringAsFixed(0);
          String imagePath = detail?.groupResult == 1 ? Utils.getImgPath(
              'achieve_report_success') : detail?.groupResult == 2
              ? Utils.getImgPath('achieve_report_tied')
              : Utils.getImgPath('achieve_report_fail');
          List<PlayerInfo> infoList = List();
          if(ObjectUtil.isNotEmpty(detail?.classGameId)){
            infoList.addAll(detail?.playerInfo);
          }
          return new Stack(
            children: <Widget>[
              new Offstage(
                offstage: ObjectUtil.isEmpty(detail?.classGameId)
                    ? true : detail.noGroup,
                child: new Container(
                  margin: EdgeInsets.only(
                      top: Dimens.ratio_height_8, left: Dimens.ratio_width_6,
                      right: Dimens.ratio_width_6),
                  child: new CustomPaint(
                    size: new Size(
                        Dimens.ratio_width_88, Dimens.ratio_height_12),
                    painter: new BgPainter(color: Color(0xff047b67)),
                  ),
                ),
              ),
              new Card(
                elevation: 1.0,
                margin: EdgeInsets.all(Dimens.ratio_width_10),
                color: Colors.white,
                shape: new RoundedRectangleBorder(side: BorderSide.none,
                    borderRadius: BorderRadius.circular(Dimens.space_width_18)),
                child: new Container(
                  decoration: new BoxDecoration(
                    color: Color(0xffecfaf3),
                    borderRadius: BorderRadius.circular(Dimens.space_width_18),
                  ),
                  child: new Stack(
                    children: <Widget>[
                      new Offstage(
                        offstage: ObjectUtil.isEmpty(detail?.classGameId)
                            ? true
                            : detail.noGroup,
                        child: new Align(
                            alignment: Alignment.bottomCenter,
                            child: new Padding(padding: EdgeInsets.only(
                                bottom: Dimens.ratio_height_1),
                              child: new Image.asset(
                                imagePath,
                                fit: BoxFit.fill,
                                width: ObjectUtil.isEmpty(detail?.groupResult)
                                    ? Dimens.ratio_width_70 :
                                detail?.groupResult == 2
                                    ? Dimens.ratio_width_18
                                    : Dimens.ratio_width_70,
                              ),
                            )
                        ),
                      ),
                      new Offstage(
                        offstage: ObjectUtil.isEmpty(detail?.classGameId)
                            ? true
                            : detail.noGroup,
                        child: new Container(
                          margin: EdgeInsets.only(top: Dimens.ratio_height_10),
                          child: new ListView.builder(
                            itemBuilder: (context, index) => new AchieveReportDetailItem(infoList[index]),
                            itemExtent: Dimens.ratio_height_30,
                            itemCount: infoList.length,
                          ),
                        ),
                      ),
                      new Offstage(
                          offstage: ObjectUtil.isEmpty(detail?.classGameId)
                              ? false
                              : !detail.noGroup,
                          child: new Center(
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Image.asset(
                                  Utils.getImgPath('achieve_report_no_group'),
                                  fit: BoxFit.fill,
                                  width: Dimens.ratio_width_30,
                                  height: Dimens.ratio_width_18,
                                ),
                                Gaps.verticalGap36,
                                new Text(
                                    "虽然在《$gameName》中未能帮你找到合适的对手，\n但是你已经战胜了$ranking%的人哦",
                                    style: TextStyle(
                                        fontSize: Dimens.font_space_17,
                                        color: ColorT.gray_99,
                                        letterSpacing: 1)),
                              ],
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
              new Offstage(
                offstage: ObjectUtil.isEmpty(detail?.classGameId)
                    ? true
                    : detail.noGroup,
                child: new Card(
                  elevation: 5.0,
                  margin: EdgeInsets.only(top: Dimens.ratio_width_8,
                      left: Dimens.ratio_width_6,
                      right: Dimens.ratio_width_6),
                  shape: new RoundedRectangleBorder(side: BorderSide.none,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimens.space_width_18),
                          topRight: Radius.circular(Dimens.space_width_18))),
                  child: new Container(
                    height: Dimens.ratio_height_12,
                    decoration: new BoxDecoration(
                      color: Color(0xff009582),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimens.space_width_18),
                          topRight: Radius.circular(Dimens.space_width_18)),
                    ),
                    child: new Stack(
                      children: <Widget>[
                        new Center(
                          child: new Text(
                            (StudentGameResultDetail.getReportTitle(detail)),
                            style: new TextStyle(fontSize: Dimens.font_space_20,
                                color: Colors.white),),
                        ),
                        new Align(
                            alignment: Alignment.bottomCenter,
                            child: new Padding(padding: EdgeInsets.only(
                                bottom: Dimens.ratio_height_2),
                              child: new Text(
                                StudentGameResultDetail.getReportScoreText(
                                    detail),
                                style: new TextStyle(
                                    fontSize: Dimens.font_space_16,
                                    color: Color(0xffb9dc51)),),)
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
    );
  }


}
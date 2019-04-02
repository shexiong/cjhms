
import 'package:cjhms/resources/res_index.dart';
import 'package:flutter/material.dart';

class AchieveItem extends StatelessWidget {

  const AchieveItem({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new ListTile(
        onTap: () {},
        enabled: false,
        title: new Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: Dimens.ratio_width_8, right: Dimens.ratio_width_8),
          height: Dimens.ratio_height_6,
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.ratio_height_3),
            color: ColorT.transparent_gray_aa,
          ),
          child: new Center(
            child: new Text("恭喜你在PK中获得胜利！"),
          ),
        ),
      ),
    );
  }

}
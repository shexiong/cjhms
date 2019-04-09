import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cjhms/resources/res_index.dart';

class TextStyles {
  static TextStyle small = TextStyle(
    fontSize: Dimens.font_space_13,
    color: ColorT.text_gray,
  );
  static TextStyle buttonTextWhite = TextStyle(
    fontSize: Dimens.font_space_16,
    color: Colors.white,
  );
  static TextStyle normal = TextStyle(
    fontSize: Dimens.font_space_15,
    color: ColorT.text_normal,
  );
  static TextStyle pageTitle = TextStyle(
    fontSize: Dimens.font_space_17,
    color: ColorT.text_dark,
  );
  static TextStyle listTitle = TextStyle(
    fontSize: Dimens.font_space_15,
    color: ColorT.text_dark,
  );
  static TextStyle listContent = TextStyle(
    fontSize: Dimens.font_space_13,
    color: ColorT.text_normal,
  );
  static TextStyle listExtra = TextStyle(
    fontSize: Dimens.font_space_12,
    color: ColorT.text_gray,
  );
}

class Gaps {
  static Widget horizontalGap1 = new SizedBox(width: Dimens.space_width_1);
  static Widget horizontalGap3 = new SizedBox(width: Dimens.space_width_3);
  static Widget horizontalGap5 = new SizedBox(width: Dimens.space_width_5);
  static Widget horizontalGap10 = new SizedBox(width: Dimens.space_width_10);
  static Widget horizontalGap15 = new SizedBox(width: Dimens.space_width_15);
  static Widget horizontalGap18 = new SizedBox(width: Dimens.space_width_18);
  static Widget horizontalGap22 = new SizedBox(width: Dimens.space_width_22);
  static Widget horizontalGap24 = new SizedBox(width: Dimens.space_width_24);
  static Widget horizontalGap48 = new SizedBox(width: Dimens.space_width_48);

  static Widget verticalGap1 = new SizedBox(height: Dimens.space_height_1);
  static Widget verticalGap5 = new SizedBox(height: Dimens.space_height_5);
  static Widget verticalGap8 = new SizedBox(height: Dimens.space_height_8);
  static Widget verticalGap10 = new SizedBox(height: Dimens.space_height_10);
  static Widget verticalGap15 = new SizedBox(height: Dimens.space_height_15);
  static Widget verticalGap18 = new SizedBox(height: Dimens.space_height_18);
  static Widget verticalGap22 = new SizedBox(height: Dimens.space_height_22);
  static Widget verticalGap24 = new SizedBox(height: Dimens.space_height_24);
  static Widget verticalGap36 = new SizedBox(height: Dimens.space_height_36);

  ///  百分比
  static Widget verticalGapPercent4 = new SizedBox(height: Dimens.ratio_height_4);
}

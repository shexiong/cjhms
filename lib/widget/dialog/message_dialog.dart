import 'package:cjhms/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:cjhms/resources/res_index.dart';

// ignore: must_be_immutable
class MessageDialog extends Dialog {
  String message;
  String negativeText;
  String positiveText;
  Function onCloseEvent;
  Function onPositivePressEvent;

  MessageDialog({
    Key key,
    @required this.message,
    this.negativeText,
    this.positiveText,
    this.onPositivePressEvent,
    @required this.onCloseEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Material(
      type: MaterialType.transparency,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            width: ScreenUtil.screenWidthDp / 3 * 2,
            decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(Dimens.space_width_10),
                ),
              ),
            ),
            child: new Column(
              children: <Widget>[
                new Container(
                  constraints: BoxConstraints(minHeight: Dimens.space_height_180),
                  child: new Padding(
                    padding: EdgeInsets.all(Dimens.space_height_36),
                    child: new Center(
                      child: new Text(
                        message,
                        style: TextStyle(fontSize: Dimens.font_space_16),
                      ),
                    ),
                  ),
                ),
                new Container(
                  color: Color(0xffe0e0e0),
                  height: 1.0,
                ),
                this._buildBottomButtonGroup(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtonGroup() {
    var widgets = <Widget>[];
    if (negativeText != null && negativeText.isNotEmpty) widgets.add(
        _buildBottomCancelButton());
    if (positiveText != null && positiveText.isNotEmpty) widgets.add(
        _buildBottomPositiveButton());
    return new Flex(
      direction: Axis.horizontal,
      children: widgets,
    );
  }

  Widget _buildBottomCancelButton() {
    return new Flexible(
      fit: FlexFit.tight,
      child: new FlatButton(
        onPressed: onCloseEvent,
        child: new Text(
          negativeText,
          style: TextStyle(
            fontSize: Dimens.font_space_18,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomPositiveButton() {
    return new Flexible(
      fit: FlexFit.tight,
      child: new FlatButton(
        onPressed: onPositivePressEvent,
        child: new Text(
          positiveText,
          style: TextStyle(
            color: Color(Colors.teal.value),
            fontSize: Dimens.font_space_18,
          ),
        ),
      ),
    );
  }
}
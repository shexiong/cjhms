
import 'package:flutter/material.dart' hide RefreshIndicator;
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

enum IconPosition { left, right, top, bottom }

class CustomIndicator extends Indicator {
  final String releaseText,
      idleText,
      refreshingText,
      completeText,
      failedText,
      noDataText;

  final Widget releaseIcon,
      idleIcon,
      refreshingIcon,
      completeIcon,
      failedIcon,
      noMoreIcon;

  final double height;

  final double spacing;

  final IconPosition iconPos;

  final TextStyle textStyle;

  const CustomIndicator({
    @required int mode,
    Key key,
    this.textStyle: const TextStyle(color: const Color(0xff555555)),
    this.releaseText: '松开刷新',
    this.refreshingText: '正在刷新',
    this.completeText: '刷新数据完成',
    this.noDataText: '没有更多数据',
    this.height: 60.0,
    this.noMoreIcon: const Icon(Icons.clear, color: Colors.grey),
    this.failedText: '刷新数据失败',
    this.idleText: '刷新数据中...',
    this.iconPos: IconPosition.left,
    this.spacing: 15.0,
    this.refreshingIcon: const CircularProgressIndicator(strokeWidth: 2.0),
    this.failedIcon: const Icon(Icons.clear, color: Colors.grey),
    this.completeIcon: const Icon(Icons.done, color: Colors.grey),
    this.idleIcon = const Icon(Icons.arrow_downward, color: Colors.grey),
    this.releaseIcon = const Icon(Icons.arrow_upward, color: Colors.grey),
  }) : super(key: key, mode: mode);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _CustomIndicatorState();
  }
}

class _CustomIndicatorState extends State<CustomIndicator> {
  Widget _buildText() {
    return new Text(
        widget.mode == RefreshStatus.canRefresh
            ? widget.releaseText
            : widget.mode == RefreshStatus.completed
                ? widget.completeText
                : widget.mode == RefreshStatus.failed
                    ? widget.failedText
                    : widget.mode == RefreshStatus.refreshing
                        ? widget.refreshingText
                        : widget.mode == RefreshStatus.noMore
                            ? widget.noDataText
                            : widget.idleText,
        style: widget.textStyle);
  }

  Widget _buildIcon() {
    Widget icon = widget.mode == RefreshStatus.canRefresh
        ? widget.releaseIcon
        : widget.mode == RefreshStatus.noMore
            ? widget.noMoreIcon
            : widget.mode == RefreshStatus.idle
                ? widget.idleIcon
                : widget.mode == RefreshStatus.completed
                    ? widget.completeIcon
                    : widget.mode == RefreshStatus.failed
                        ? widget.failedIcon
                        : new SizedBox(
                            width: 25.0,
                            height: 25.0,
                            child: widget.refreshingIcon,
                          );
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement buildContent
    Widget textWidget = _buildText();
    Widget iconWidget = _buildIcon();
    List<Widget> children = <Widget>[
      iconWidget,
      new Container(
        width: widget.spacing,
        height: widget.spacing,
      ),
      textWidget
    ];
    Widget container = (widget.iconPos == IconPosition.top ||
            widget.iconPos == IconPosition.bottom)
        ? new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            verticalDirection: widget.iconPos == IconPosition.top
                ? VerticalDirection.down
                : VerticalDirection.up,
            children: children,
          )
        : new Row(
            textDirection: widget.iconPos == IconPosition.right
                ? TextDirection.rtl
                : TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          );
    return new Container(
      alignment: Alignment.center,
      height: widget.height,
      child: new Center(
        child: container,
      ),
    );
  }

}

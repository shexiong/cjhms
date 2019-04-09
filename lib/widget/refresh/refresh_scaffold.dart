
import 'package:cjhms/widget/refresh/custom_indicator.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

typedef void OnGetData(bool up);

class RefreshWrapper extends StatefulWidget {
  const RefreshWrapper(
      {Key key,
      this.isLoading,
      @required this.controller,
      this.enablePullUp: true,
      this.onGetData,
      this.itemExtent,
      this.child,
      this.itemCount,
      this.itemBuilder})
      : super(key: key);

  final bool isLoading;
  final RefreshController controller;
  final bool enablePullUp;
  final OnGetData onGetData;
  final Widget child;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double itemExtent;

  @override
  State<StatefulWidget> createState() {
    return new RefreshWrapperState();
  }
}

class RefreshWrapperState extends State<RefreshWrapper>
    with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new SmartRefresher(
            controller: widget.controller,
            headerBuilder: (BuildContext context, int mode){
              return new CustomIndicator(mode: mode,);
            },
            footerBuilder: (BuildContext context, int mode){
              return new CustomIndicator(mode: mode,);
            },
            onRefresh: widget.onGetData,
            child: widget.child ??
                new ListView.builder(
                  itemCount: widget.itemCount,
                  itemExtent: widget.itemExtent,
                  itemBuilder: widget.itemBuilder,
                )),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

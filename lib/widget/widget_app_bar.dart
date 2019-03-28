import 'package:flutter/material.dart';
import 'package:cjhms/resources/res_index.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget child;

  CustomAppBar({@required this.child}) : assert(child != null);

  @override
  Size get preferredSize => new Size.fromHeight(Dimens.ratio_width_16);

  @override
  State<StatefulWidget> createState() {
    return _CustomAppBarState();
  }
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
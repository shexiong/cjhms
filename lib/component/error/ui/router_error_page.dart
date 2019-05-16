import 'package:flutter/material.dart';

///
/// @author She xiong
/// 创建日期：2019/3/20
/// 描述： 错题本首页
///
///
class ErrorPage extends StatefulWidget {

  final PageStorageKey<String> pageKey; //当前控件唯一标识Key

  ErrorPage({@required this.pageKey}) : assert(pageKey != null);

  @override
  _ErrorState createState() => new _ErrorState();
}

class _ErrorState extends State<ErrorPage> {

  //当控件插入控件树时触发，适合初始化变量
  @override
  void initState(){
    print('${DateTime.now().toString()} :  initState调用');
    super.initState();
  }
  //紧跟在initState之后调用
  @override
  void didChangeDependencies() {
    print('${DateTime.now().toString()} : didChangeDependencies');
    super.didChangeDependencies();
  }
  //当组件的状态改变的时候就会调用
  @override
  void didUpdateWidget(ErrorPage oldWidget) {
    print('${DateTime.now().toString()} : didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }
  //在控件dispose之前，会调用这个函数
  @override
  void deactivate() {
    print('${DateTime.now().toString()} : deactivate');
    super.deactivate();
  }
  //在控件dispose之后调用，组件已销毁，一般用于移除监听，清理环境
  @override
  void dispose() {
    print('${DateTime.now().toString()} : dispose');
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第三页'),
      ),
    );
  }
}
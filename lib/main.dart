import 'package:cjhms/component/base/bloc_provider.dart';
import 'package:cjhms/component/login/bloc/bloc_login.dart';
import 'package:cjhms/component/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // 闪屏页
      home: new BlocProvider<LoginBloc>(child: SplashPage(),bloc: new LoginBloc(),),
    );
  }
}

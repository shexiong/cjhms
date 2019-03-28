import 'package:cjhms/component/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tip_dialog/tip_dialog.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new TipDialogContainer(
        duration: const Duration(seconds: 2),
        child: new MaterialApp(
          home: new SplashPage(),   // 闪屏页
        )
    );
  }
}

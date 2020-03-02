import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class MyApp extends StatelessWidget {
  List _currencies;
  MyApp(this._currencies);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: debugDefaultTargetPlatformOverride == TargetPlatform.iOS ? Colors.blue[100] : null
      ),

      home: new HomePage(_currencies),
    );
  }
}

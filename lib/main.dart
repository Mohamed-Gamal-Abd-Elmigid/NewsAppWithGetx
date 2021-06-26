import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsappgetx/Article/UI/ArticleScene.dart';

import 'Article/binding/ArticleBinding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: Binding(),
      home: ArticleScene(),
    );
  }
}

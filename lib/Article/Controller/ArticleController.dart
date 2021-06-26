import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsappgetx/core/model/ArticleModel.dart';
import 'package:newsappgetx/service/http_service_imp.dart';

class ArticleCortoller extends GetxController {
  NetworkProvider networkProvider = NetworkProvider();

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<Result> results;

  ArticleCortoller() {
    getResults();
  }

  getResults() async {
    loading.value = true;
    results = await networkProvider.getResults();
    loading.value = false;

    update();
  }
}

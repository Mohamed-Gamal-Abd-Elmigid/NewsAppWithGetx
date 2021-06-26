import 'package:get/get.dart';
import 'package:newsappgetx/Article/Controller/ArticleController.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleCortoller());
  }
}

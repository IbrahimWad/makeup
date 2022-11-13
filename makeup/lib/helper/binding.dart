import 'package:get/get.dart';
import 'package:makeup/core/controller/auth_viewmodel.dart';
import 'package:makeup/core/controller/category_viewmodel.dart';
import 'package:makeup/core/controller/product_viewmodel.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel(), fenix: true);
    Get.lazyPut(() => HomeViewModel(), fenix: true);
    Get.lazyPut(() => ProductViewModel(), fenix: true);
  }
}

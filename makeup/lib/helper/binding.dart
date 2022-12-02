import 'package:get/get.dart';
import 'package:makeup/core/controller/auth_viewmodel.dart';
import 'package:makeup/core/controller/cartViewModel.dart';
import 'package:makeup/core/controller/category_viewmodel.dart';
import 'package:makeup/core/controller/controle_viewModel.dart';
import 'package:makeup/core/controller/product_viewmodel.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => ProductViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => CartViewModel());
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../model/categoryModel.dart';
import '../services/homeServices.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loadding => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  HomeViewModel() {
    getCategory();
  }
  getCategory() async {
    _loading.value = true;
    await HomeService().getCategory().then((value) => {
          for (int i = 0; i < value.length; i++)
            {
              _categoryModel.add(CategoryModel.fromJson(
                  value[i].data() as Map<String, dynamic>)),
              _loading.value = false,
            },
          update(),
        });
  }
}

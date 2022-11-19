import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:makeup/core/controller/category_viewmodel.dart';
import 'package:makeup/main.dart';
import 'package:makeup/model/categoryModel.dart';
import 'package:makeup/screen/products/productView.dart';
import 'package:makeup/screen/widget/colors.dart';
import 'package:makeup/screen/widget/customText.dart';
import 'package:makeup/screen/widget/getBox.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  String? categoryname;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: GetBuilder<HomeViewModel>(
            init: HomeViewModel(),
            builder: (controller) => GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 4 / 5,
                crossAxisSpacing: MediaQuery.of(context).size.width * .04,
                mainAxisSpacing: MediaQuery.of(context).size.height * .02,
              ),
              itemCount: controller.categoryModel.length,
              itemBuilder: (BuildContext ctx, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () async {
                    categoryname = controller.categoryModel[index].name;
                    sharedPreferences = await SharedPreferences.getInstance();
                    print(controller.categoryModel[index].name);
                    await sharedPreferences!.setString(
                        'name', '${controller.categoryModel[index].name}');
                    Get.to(ProductView());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: secondary),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: Image.network(
                            '${controller.categoryModel[index].image}',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        CustomText(
                            text: "${controller.categoryModel[index].name}",
                            color: Colors.white),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

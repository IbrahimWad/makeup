import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makeup/core/controller/product_viewmodel.dart';
import 'package:makeup/screen/category/categoryview.dart';
import 'package:makeup/screen/products/detailsView.dart';
import 'package:makeup/screen/widget/colors.dart';
import 'package:makeup/screen/widget/customText.dart';

class ProductView extends StatelessWidget {
  ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.1),
          GetBuilder<ProductViewModel>(
            init: ProductViewModel(),
            builder: (controller) => Container(
              height: Get.height * 0.8,
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 4 / 5,
                  crossAxisSpacing: MediaQuery.of(context).size.width * .04,
                  mainAxisSpacing: MediaQuery.of(context).size.height * .02,
                ),
                itemCount: controller.productModel.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      Get.to(Details(
                          productModel: controller.productModel[index]));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: secondary),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Image.network(
                              '${controller.productModel[index].image}',
                              // width: Get.width * 0.3,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .01,
                          ),
                          CustomText(
                            text: '${controller.productModel[index].name}',
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

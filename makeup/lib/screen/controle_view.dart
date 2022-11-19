import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:makeup/screen/auth/login.dart';
import 'package:makeup/screen/widget/colors.dart';

import '../core/controller/auth_viewmodel.dart';
import '../core/controller/controle_viewModel.dart';

class ControlView extends StatelessWidget {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? Login()
          : GetBuilder<ControlViewModel>(
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  "Explore",
                  style: TextStyle(color: secondary),
                ),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Image.asset(
                  'assets/image/Explore.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text("Cart", style: TextStyle(color: secondary)),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Image.asset(
                  'assets/image/cart.png',
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          // BottomNavigationBarItem(
          //     activeIcon: Padding(
          //       padding: const EdgeInsets.only(top: 20.0),
          //       child: Text("Account", style: TextStyle(color: secondary)),
          //     ),
          //     label: '',
          //     icon: Padding(
          //       padding: const EdgeInsets.only(top: 20),
          //       child: Image.asset(
          //         'assets/image/profile.png',
          //         fit: BoxFit.contain,
          //         width: 20,
          //       ),
          //     )),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        backgroundColor: Colors.red.withOpacity(0.1),
        selectedItemColor: secondary,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:makeup/core/controller/auth_viewmodel.dart';
import 'package:makeup/screen/widget/colors.dart';
import 'package:makeup/screen/widget/customBotton.dart';
import 'package:makeup/screen/widget/customText.dart';
import 'package:makeup/screen/widget/customTextFormFild.dart';
import 'login.dart';

class SingUp extends GetWidget<AuthViewModel> {
  SingUp({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.offAll(Login());
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              right: 10,
              left: 10,
            ),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Sign Up',
                        color: primary,
                        fontsize: 30,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomTextFormFild(
                    hint: 'name',
                    text: 'Name',
                    validator: (value) {
                      if (value == null) {
                        print('name is empty');
                      }
                    },
                    onsave: (value) {
                      controller.name = value;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomTextFormFild(
                    onsave: (value) {
                      controller.email = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        print('error');
                      }
                    },
                    text: 'Email',
                    hint: 'user@gmail.com',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomTextFormFild(
                    onsave: (value) {
                      controller.password = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        print('error');
                      }
                    },
                    text: 'password',
                    hint: '**********',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: 'SIGN UP',
                    onPressed: () {
                      _formkey.currentState!.save();
                      if (_formkey.currentState!.validate()) {
                        controller.createAccountWithEmailAndPassword();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

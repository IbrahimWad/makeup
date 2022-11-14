import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makeup/core/controller/auth_viewmodel.dart';
import 'package:makeup/screen/auth/singup.dart';
import 'package:makeup/screen/widget/colors.dart';
import 'package:makeup/screen/widget/customBotton.dart';
import 'package:makeup/screen/widget/customSocialButton.dart';
import 'package:makeup/screen/widget/customText.dart';
import 'package:makeup/screen/widget/customTextFormFild.dart';

class Login extends GetWidget<AuthViewModel> {
  Login({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Welcom',
                        fontsize: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(SingUp());
                        },
                        child: CustomText(
                          text: 'Sign Up',
                          color: primary,
                          fontsize: 22,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: 'Sign in to Continue',
                    fontsize: 14,
                    alignment: Alignment.bottomLeft,
                    color: secondary,
                  ),
                  const SizedBox(
                    height: 30,
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
                  const SizedBox(
                    height: 40,
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
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: 'Forgot Password?',
                    fontsize: 14,
                    alignment: Alignment.topRight,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: 'SIGN IN',
                    onPressed: () {
                      //isloading = true;
                      _formkey.currentState!.save();
                      if (_formkey.currentState!.validate()) {
                        controller.signInWithEmailAndPassword();
                      }
                      //isloading = true;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: '--OR--',
                    alignment: Alignment.center,
                    fontsize: 14,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomSocialButton(
                    onPressed: () {
                      controller.googleSignInMethod();
                    },
                    image: 'assets/image/Google.png',
                    text: 'Sign In with Google',
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

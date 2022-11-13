import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:makeup/main.dart';
import 'package:makeup/screen/widget/getBox.dart';

import '../../model/usermodel.dart';
import '../../screen/category/categoryview.dart';
import '../services/firestore_user.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? email, password, name;
  bool isloading = false;

  final Rxn<User> _user = Rxn<User>();
  String? get user => _user.value!.email;

  @override
  void onInit() {
    super.onInit();

    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    print(googleUser);

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
    });
    Get.off(CategoryView());
    box.write(saveName, user);
  }

  void signInWithEmailAndPassword() async {
    isloading = true;
    try {
      await _auth.signInWithEmailAndPassword(
          email: '$email', password: '$password');
      Get.off(CategoryView());
      box.write(saveName, user);
      isloading = false;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        e.code,
        e.message.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: '$email',
        password: '$password',
      )
          .then((user) async {
        saveUser(user);
      });

      Get.offAll(CategoryView());
      box.write(saveName, user);
    } on FirebaseAuthException catch (e) {
      print(e);

      Get.snackbar(
        e.code,
        e.message.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFireStore(UserModel(
      email: '${user.user!.email}',
      name: name ?? '${user.user!.displayName}',
      userId: user.user!.uid,
    ));
  }
}

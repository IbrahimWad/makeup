import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:makeup/screen/auth/login.dart';
import 'package:makeup/screen/category/categoryview.dart';
import 'package:makeup/screen/controle_view.dart';
import 'package:makeup/screen/widget/getBox.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helper/binding.dart';

final box = GetStorage();
SharedPreferences? sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      title: 'makeup',
      home: box.read(saveName) == null ? Login() : ControlView(),
    );
  }
}

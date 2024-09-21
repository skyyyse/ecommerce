import 'package:ecommerce/controller/SharedPreferences.dart';
import 'package:ecommerce/view/isloading/splash.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'controller/translations_controller.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefsController = Get.put(SharedPreferences_controller());
  await prefsController.init();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => ecommerce(),
    ),
  );
  // runApp(const ecommerce());
}

class ecommerce extends StatelessWidget {
  ecommerce({super.key});
  final prefsController = Get.put(SharedPreferences_controller());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: prefsController.isLanguages?Locale(prefsController.languages):Locale("US"),
      translations: translations_controller(),
      home: splash(),
    );
  }
}

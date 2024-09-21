import 'dart:convert';
import 'package:ecommerce/controller/SharedPreferences.dart';
import 'package:ecommerce/controller/detail_controller.dart';
import 'package:ecommerce/model/favorite_model.dart';
import 'package:get/get.dart';
import 'package:ecommerce/service/service.dart';
import 'package:http/http.dart' as http;
class favorite_controller extends GetxController {
  final prefsController = Get.put(SharedPreferences_controller());
  final detail=Get.put(detail_controller());
  var favorites = <favorite_model>[].obs;
  var isloading=true.obs;
  void get() async {
    try {
      isloading.value=true;
      final response = await http.get(
        Uri.parse(service.getfavorite),
        headers: {
          "Authorization": "Bearer ${prefsController.token}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        print('object');
        isloading.value=false;
        final List<dynamic> jsonList = json.decode(response.body)['favorite'];
        print(jsonList);
        favorites.assignAll(jsonList.map((json) => favorite_model.fromJson(json)).toList());
      } else {
        Get.snackbar('Error', 'Failed to fetch posts');
      }
    } catch (e) {
      print(e);
    }
  }
  void stote(id)async{
    try {
      isloading.value=true;
      final response = await http.get(
        Uri.parse(service.storefavorite+"${id}"),
        headers: {
          "Authorization": "Bearer ${prefsController.token}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        isloading.value=false;
        final data = json.decode(response.body);
        if (data['status'] == true) {
          Get.snackbar("Sucess","${data['message']}");
          detail.get(id);
          get();
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch posts');
      }
    } catch (e) {
      print(e);
    }
  }
}

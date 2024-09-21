import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/controller/SharedPreferences.dart';
import 'package:ecommerce/model/detail_model.dart';
import 'package:ecommerce/service/service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class detail_controller extends GetxController{

  final prefsController = Get.put(SharedPreferences_controller());

  final  carouselController = CarouselController();

  var currentIndex = 0,id;

  var products = <product>[].obs;

  var isloading=true.obs;

  void get(id) async {
    try {
      isloading.value=true;
      final response = await http.get(
        Uri.parse(service.detail+"${id}"),
        headers: {
          "Authorization": "Bearer ${prefsController.token}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        isloading.value=false;
        final List<dynamic> jsonList = json.decode(response.body)['products'];
        products.assignAll(jsonList.map((json) => product.fromJson(json)).toList());
      } else {
        Get.snackbar('Error', 'Failed to fetch posts');
      }
    } catch (e) {
      print(e);
    }
  }
}
import 'dart:convert';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce/controller/SharedPreferences.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/service/service.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:get/get.dart';
class product_controller extends GetxController {

  final  carouselController = CarouselController();

  final prefsController = Get.put(SharedPreferences_controller());

  var products = <product_model>[].obs;

  var isloading=true.obs;

  var currentIndex = 0,id;

  var searchText = ''.obs;

  @override
  void onInit() {
    get();
    super.onInit();
  }

  void get() async {
    try {
      isloading.value=true;
      final response = await http.get(
        Uri.parse(service.product),
        headers: {
          "Authorization": "Bearer ${prefsController.token}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        isloading.value=false;
        final List<dynamic> jsonList = json.decode(response.body)['products'];
        products.assignAll(jsonList.map((json) => product_model.fromJson(json)).toList());
      } else {
        print('object');
        Get.snackbar('Error', 'Failed to fetch product');
      }
    } catch (e) {
      print(e);
    }
  }

  void getid(id) async {
    try {
      isloading.value=true;
      final response = await http.get(
        Uri.parse(service.productid+"${id}"),
        headers: {
          "Authorization": "Bearer ${prefsController.token}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        isloading.value=false;
        final List<dynamic> jsonList = json.decode(response.body)['products'];
        products.assignAll(jsonList.map((json) => product_model.fromJson(json)).toList());
      } else {
        Get.snackbar('Error', 'Failed to fetch posts');
      }
    } catch (e) {
      print(e);
    }
  }

  RxList<product_model> get filteredProducts {
    if (searchText.value.isEmpty) {
      return products;
    } else {
      return products
          .where((product) => product.title
          .toLowerCase()
          .contains(searchText.value.toLowerCase()))
          .toList()
          .obs;
    }
  }

  void updateSearchText(String text) {
    searchText.value = text;
  }
}
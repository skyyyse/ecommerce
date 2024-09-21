import 'dart:convert';
import 'package:ecommerce/controller/SharedPreferences.dart';
import 'package:ecommerce/model/categories_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../service/service.dart';
class categories_controller extends GetxController {
  final prefsController = Get.put(SharedPreferences_controller());
  var categories = <categories_model>[].obs;
  var isloading=true.obs;
  @override
  void onInit() {
    get();
    super.onInit();
  }
  void get() async {
    try{
      isloading.value=true;
      final response = await http.get(Uri.parse(service.categories),
        headers: {
          "Authorization": "Bearer ${prefsController.token}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        isloading.value=false;
        final List<dynamic> categoriesList=jsonDecode(response.body)['categories'];
        categories.assignAll(categoriesList.map((json) => categories_model.fromJson(json)).toList());
      } else {
        Get.snackbar('Error', 'Failed to fetch categories');
      }
    }catch(e){
      print(e);
    }
  }
}

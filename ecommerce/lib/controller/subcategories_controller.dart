import 'dart:convert';
import 'package:ecommerce/controller/SharedPreferences.dart';
import 'package:ecommerce/model/subcategories_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../service/service.dart';
class subcategories_controller extends GetxController {
  final prefsController = Get.put(SharedPreferences_controller());
  var subcategories = <subcategories_model>[].obs;
  var isloading=true.obs;
  void get(id) async {
    try{
      isloading.value=true;
      final response = await http.get(Uri.parse("${service.subcategory}${id}"),
        headers: {
          "Authorization": "Bearer ${prefsController.token}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        isloading.value=false;
        final List<dynamic> subcategories_list=jsonDecode(response.body)['Subcategories'];
        subcategories.assignAll(subcategories_list.map((json) => subcategories_model.fromJson(json)).toList());
      } else {
        Get.snackbar('Error', 'Failed to fetch subcategories');
      }
    }catch(e){
      print(e);
    }
  }
}

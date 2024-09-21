import 'dart:convert';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce/controller/SharedPreferences.dart';
import 'package:ecommerce/model/slider_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/service/service.dart';
class slider_controller extends GetxController {
  final  carouselController = CarouselController();
  final prefsController = Get.put(SharedPreferences_controller());
  var currentIndex = 0;
  var isloading = false.obs;
  var slider=<slider_model>[].obs;
  @override
  void onInit() {
    get();
    super.onInit();
  }
  void get()async{
    try{
      isloading.value=true;
      final response = await http.get(Uri.parse(service.slider),
        headers: {
          "Authorization": "Bearer ${prefsController.token}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> slider_list=jsonDecode(response.body)['slider'];
        slider.assignAll(slider_list.map((json) => slider_model.fromjson(json)).toList());
      } else {
        Get.snackbar('Error', 'Failed to fetch Slider');
      }
    }catch(e){
      print(e);
    }
  }
}

import 'dart:convert';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce/controller/SharedPreferences.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/service/service.dart';
import 'package:ecommerce/model/order_model.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
class order_controller extends GetxController{

  final prefsController = Get.put(SharedPreferences_controller());

  final  carouselController = CarouselController();

  var currentIndex = 0;

  var Order=<order_model>[].obs;

  var isLoading=true.obs;

  void get()async{
    try{
      isLoading.value=true;
      final response = await http.get(Uri.parse(service.getorder),
        headers: {
          "Authorization": "Bearer ${prefsController.token}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        isLoading.value=false;
        final List<dynamic> order_list=jsonDecode(response.body)['orders'];
        print(order_list);
        Order.assignAll(order_list.map((json) => order_model.fromjson(json)).toList());

      } else {
        Get.snackbar('Error', 'Failed to fetch Slider');
      }
    }catch(e){
      print(e);
    }
  }

  void status(status)async{
    try{
      isLoading.value=true;
      final response = await http.get(Uri.parse(service.getorderstatus+"${status}"),
        headers: {
          "Authorization": "Bearer ${prefsController.token}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        isLoading.value=false;
        final List<dynamic> order_list=jsonDecode(response.body)['orders'];
        Order.assignAll(order_list.map((json) => order_model.fromjson(json)).toList());
      } else {
        Get.snackbar('Error', 'Failed to fetch Slider');
      }
    }catch(e){
      print(e);
    }
  }

  void store_sigle(product_id,qty)async{
    print(product_id);
    print(qty);


    try{
      isLoading.value=true;
      final response = await http.get(Uri.parse("http://10.0.2.2:8000/api/order/store/single/${product_id}/${qty}"),
        headers: {
          "Authorization": "Bearer ${prefsController.token}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        isLoading.value=false;
        final data=jsonDecode(response.body);
        if(data['status']==true) {
          Message(QuickAlertType.success, data['message']);
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch Slider');
      }
    }catch(e){
      print(e);
    }
  }

  void store_more(totalPrice)async{
    try{
      isLoading.value=true;
      final response = await http.get(Uri.parse("http://10.0.2.2:8000/api/order/store/more/${totalPrice}"),
        headers: {
          "Authorization": "Bearer ${prefsController.token}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        isLoading.value=false;
        final data=jsonDecode(response.body);
        if(data['status']==true) {
          Message(QuickAlertType.success, data['message']);
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch Slider');
      }
    }catch(e){
      print(e);
    }
  }

  void cancel(id)async{
    try{
      isLoading.value=true;
      final response = await http.get(Uri.parse("http://10.0.2.2:8000/api/order/cancel/${id}"),
        headers: {
          "Authorization": "Bearer ${prefsController.token}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        isLoading.value=false;
        final data=jsonDecode(response.body);
        if(data['status']==true) {
          Message(QuickAlertType.success, data['message']);
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch Slider');
      }
    }catch(e){
      print(e);
    }
  }

  void Message(message,content) {
    QuickAlert.show(
      context: Get.context!,
      type: message,
      title: 'Sucess',
      text: content,
      confirmBtnText: 'OK',
    );
  }
}
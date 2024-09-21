import 'dart:convert';
import 'package:ecommerce/controller/SharedPreferences.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:get/get.dart';
import 'package:ecommerce/service/service.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class cart_controller extends GetxController {

  final prefsController = Get.put(SharedPreferences_controller());

  var Cart = <cart_model>[].obs;

  var isloading = true.obs;

  RxInt Counter = 1.obs;

  double get totalPrice => Cart.fold(0.0, (sum, item) => sum + item.totalprice);

  @override
  void onInit() {
    get();
    super.onInit();
  }

  void get() async {
    try {
      isloading.value = true;
      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/cart'),
        headers: {
          "Authorization": "Bearer ${prefsController.token}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        isloading.value = false;
        final List<dynamic> jsonList = json.decode(response.body)['cart'];
        Cart.assignAll(jsonList.map((json) => cart_model.fromjson(json)).toList());
      } else {
        print('object');
        Get.snackbar('Error', 'Failed to fetch cart');
      }
    } catch (e) {
      print(e);
    }
  }

  void addCounter(id, qty, totalprice) async {
    try {
      isloading.value = true;
      final response = await http.get(
        Uri.parse(
            "${service.add_remove}?id=${id}&qty=${qty}&totalprice=${totalprice}"),
        headers: {
          "Authorization": "Bearer ${prefsController.token}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        get();
      } else {
        print('object');
        Get.snackbar('Error', 'Failed to fetch product');
      }
    } catch (e) {
      print(e);
    }
  }

  void addCart(product_id, qty, totalprice) async {
    print(product_id);
    try {
      isloading.value = true;
      final response = await http.get(
        Uri.parse("http://10.0.2.2:8000/api/cart/store/${product_id}/${qty}/${totalprice}"),
        headers: {
          "Authorization": "Bearer ${prefsController.token}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        get();
        Get.snackbar('Sucess', 'Add Sucessfully...');
      } else {
        Get.snackbar('Error', 'Failed to fetch hjjjjjjjjjjjjjjj');
      }
    } catch (e) {
      print(e);
    }
  }

  void delete_cart(id) async {
    try {
      isloading.value = true;
      final response = await http.get(
        Uri.parse("${service.cartdelete}${id}"),
        headers: {
          "Authorization": "Bearer ${prefsController.token}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        get();
        Get.snackbar('Error', 'fffffffffff');
      } else {
        Get.snackbar('Error', 'Failed to fetch hjjjjjjjjjjjjjjj');
      }
    } catch (e) {
      print(e);
    }
  }

  void add() {
    Counter.value++;
  }

  void remove() {
    if (Counter > 1) {
      Counter.value--;
    } else {
      Counter == 1;
    }
  }

  void Update() {
    Counter.value == 1;
  }
}

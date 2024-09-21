import 'dart:convert';
import 'package:ecommerce/controller/SharedPreferences.dart';
import 'package:ecommerce/service/service.dart';
import 'package:ecommerce/view/auth/login_page.dart';
import 'package:ecommerce/view/main/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class auth_controller extends GetxController {
  bool isHidden = true;
  bool validate = false;
  final old= TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirm = TextEditingController();
  final  prefsController = Get.put(SharedPreferences_controller());
  var isLoading = false.obs;
  void Login()async{
    try{
      isLoading.value=true;
      final response=await http.post(Uri.parse(service.login),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email.text,
          'password': password.text,
        }),
      );
      if(response.statusCode==200){
        isLoading.value=false;
        final data=jsonDecode(response.body);
        if(data['status']==true){
          await prefsController.setToken(data['token']);
          clear();
          return Get.offAll(main_page());
        }else{
          if (data['message'] is List<dynamic>) {
            List<dynamic> messages = data['message'];
            String messageText = messages.join(', ');
            Message(QuickAlertType.error, messageText);
          }
        }
      }
    }catch(data){
      print(data);
    }
  }
  void Register()async{
    if(password.text!=confirm.text) {
      Message(QuickAlertType.error, "Wrong the Passwords....?");
    }else{
      try{
        isLoading.value=true;
        final response=await http.post(Uri.parse(service.register),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "username": username.text,
            "email": email.text,
            "password": password.text,
          }),
        );
        if(response.statusCode==200){
          final data=jsonDecode(response.body);
          isLoading.value=false;
          if(data['status']==true){
            clear();
            return Get.back();
          }else{
            if (data['message'] is List<dynamic>) {
              List<dynamic> messages = data['message'];
              String messageText = messages.join(', ');
              Message(QuickAlertType.error, messageText);
            }
          }
        }
      }catch(data){
        print(data);
      }
    }
  }

  void logout() async {
    try {
      isLoading.value=true;
      var headers = {
        "Authorization": "Bearer ${prefsController.token}",
      };
      var request = http.Request('POST', Uri.parse(service.logout));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        isLoading.value=false;
        prefsController.clearToken();
        return Get.offAll(login_page());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }
  void Message(message,content) {
    QuickAlert.show(
      context: Get.context!,
      type: message,
      title: 'Error',
      text: content,
      confirmBtnText: 'OK',
    );
  }

  void clear() {
    username.text = '';
    email.text = '';
    password.text = '';
    confirm.text = '';
    isLoading.value = false;
  }
}

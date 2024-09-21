import 'package:ecommerce/controller/auth_controller.dart';
import 'package:ecommerce/view/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../constand/color.dart';
class login_page extends StatefulWidget {
  login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  @override
  final  controller = Get.put(auth_controller());
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Icon(
                    Icons.person,
                    size: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: controller.email,
                    decoration: InputDecoration(
                      hintText: 'Email'.tr,
                      prefixIcon:  Icon(
                        Icons.email_outlined,
                        color: TColor.KPrimarykeycolor,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextField(
                    obscureText: controller.isHidden,
                    controller: controller.password,
                    decoration: InputDecoration(
                      hintText: 'Password'.tr,
                      prefixIcon:  Icon(
                        Icons.password,
                        color: TColor.KPrimarykeycolor,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            controller.isHidden
                                ? controller.isHidden = false
                                : controller.isHidden = true;
                          });
                        },
                        icon: controller.isHidden
                            ? const Icon(Icons.visibility)
                            : const Icon(
                                Icons.visibility_off_outlined,
                              ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                       Text(
                        "forgot Password ? ".tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        controller.Login();
                      });
                    },
                    child: Obx(
                      () => controller.isLoading.value
                          ? Container(
                              height: 20,
                              width: 20,
                              child: const CircularProgressIndicator(),
                            )
                          : Text(
                              'Login'.tr,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                    ),
                    color: Colors.cyan,
                    minWidth: double.infinity,
                    height: 50,
                    elevation: 0,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        "Don't have account ? ".tr,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Get.to(register_page());
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child:  Text(
                            'Sign up'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:ecommerce/constand/color.dart';
import 'package:ecommerce/controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class register_page extends StatefulWidget {
  register_page({super.key});

  @override
  State<register_page> createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {
  final controller = Get.put(auth_controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Icon(
                    Icons.person,
                    size: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: controller.username,
                    decoration: InputDecoration(
                      hintText: 'Username'.tr,
                      prefixIcon:  Icon(
                        Icons.person,
                        color: TColor.KPrimarykeycolor,
                      ),
                      enabledBorder: OutlineInputBorder(
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
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: controller.email,
                    decoration: InputDecoration(
                      hintText: 'Email'.tr,
                      prefixIcon:  Icon(
                        Icons.email_outlined,
                        color: TColor.KPrimarykeycolor,
                      ),
                      enabledBorder: OutlineInputBorder(
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
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextField(
                    obscureText: controller.isHidden,
                    controller: controller.password,
                    decoration: InputDecoration(
                      hintText: 'Password'.tr,
                      prefixIcon:  Icon(
                        Icons.password,
                        color: TColor.KPrimarykeycolor,
                      ),
                      enabledBorder: OutlineInputBorder(
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
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextField(
                    controller: controller.confirm,
                    obscureText: controller.isHidden,
                    decoration: InputDecoration(
                      hintText: 'Confirm Passsword'.tr,
                      prefixIcon:  Icon(
                        Icons.password,
                        color: TColor.KPrimarykeycolor,
                      ),
                      enabledBorder: OutlineInputBorder(
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
                  padding: const EdgeInsets.only(top: 0),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        controller.Register();
                      });
                    },
                    child: Obx(
                      () => controller.isLoading.value
                          ? Container(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              'Sign up'.tr,
                              style: TextStyle(
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
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Get.back();
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child:  Text(
                            'Login'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 15,
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

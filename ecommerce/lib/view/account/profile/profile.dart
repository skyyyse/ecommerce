import 'dart:io';

import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/view/isloading/isloading.dart';
import 'package:ecommerce/view/card/order/completed.dart';
import 'package:ecommerce/view/card/order/order.dart';
import 'package:ecommerce/view/card/order/cancel.dart';
import 'package:ecommerce/view/account/profile/settings/language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/auth_controller.dart';
import '../widget/contact.dart';

class profile extends StatefulWidget {
  profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final auth=Get.put(auth_controller());
  final user=Get.put(user_controller());
  File? image;
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() => this.image = imageTemp);
  }
  @override
  void initState() {
    user.get();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFe5e5e5),
      appBar: AppBar(
        title: const Text("Profile"),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 0),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white
                  ),
                  child:  Obx(()=>ListView.builder(itemCount: user.Users.length,itemBuilder: (context, index) {
                    final users=user.Users[index];
                    return Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20,top: 8,right: 8,bottom: 8),
                              child: InkWell(
                                onTap:(){
                                  pickImage();
                                },
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                    "http://10.0.2.2:8000/Image/User/Image/${users.image}"
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10,top: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 2,top: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Name : " .tr),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5),
                                            child: Text( users.username),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 2,bottom: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Email :".tr),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 5),
                                            child: Text(users.email),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white
                  ),
                  child: Column(
                    children: [
                       Padding(
                        padding: EdgeInsets.only(left: 8,top: 8,right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Order".tr),
                            Icon(Icons.arrow_forward_ios_sharp),
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                Get.to(order());
                              },
                              child:  Column(
                                children: [
                                  Icon(Icons.shopping_cart),
                                  Text('Order'.tr),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Get.to(completed());
                              },
                              child:  Column(
                                children: [
                                  Icon(Icons.verified_outlined),
                                  Text('Complated'.tr),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Get.to(cancel());
                              },
                              child:  Column(
                                children: [
                                  Icon(Icons.cancel_outlined),
                                  Text('Cancelled'.tr),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white
                  ),
                  child: Column(
                    children: [
                       Padding(
                        padding: EdgeInsets.only(left: 8,right: 8,top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.credit_card_outlined),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text("My Cridit".tr),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios_sharp),
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8),
                        child: InkWell(
                          onTap: (){
                            Get.to(language());
                          },
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.language),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("Language".tr),
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_sharp),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                       Padding(
                        padding: EdgeInsets.only(left: 8,right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text("My Address".tr),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios_sharp),
                          ],
                        ),
                      ),
                      const Divider(),
                      const Padding(
                        padding: EdgeInsets.only(left: 8,right: 8,bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star_border),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text("Rate Shop"),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios_sharp),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 30),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white
                  ),
                  child: Column(
                    children: [
                       Padding(
                        padding: EdgeInsets.only(left: 8,right: 8,top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.info_outline),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text("Terms of User".tr),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios_sharp),
                          ],
                        ),
                      ),
                      const Divider(),
                       Padding(
                        padding: EdgeInsets.only(left: 8,right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.verified_user_outlined),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text("Privacy Pilicy".tr),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios_sharp),
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: InkWell(
                          onTap: (){

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.lock_open_rounded),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("Changes Password".tr),
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_sharp),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8,bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.email_outlined),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text("Changes Email".tr),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios_sharp),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                        child: InkWell(
                          onTap: (){
                            auth.logout();
                          },
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.logout),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("Logout".tr),
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_sharp),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

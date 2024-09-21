import 'dart:io';

import 'package:ecommerce/constand/color.dart';
import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/view/isloading/isloading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';

class edit_profile extends StatefulWidget {
  edit_profile({super.key});

  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {

  final user = Get.put(user_controller());


  File? image;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() => this.image = imageTemp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Obx(()=>ListView.builder(
        physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()
        ),
        itemCount: user.Users.length,
        itemBuilder: (context, index) {
          final users = user.Users[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    hoverColor: Colors.white,
                    highlightColor: Colors.white,
                    focusColor: Colors.white,
                    splashColor: Colors.white,
                    onTap: (){
                      pickImage();
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: TColor.KBackgroundcolor),
                          color: Colors.white
                      ),
                      child: users.image==null?Icon(Icons.perm_identity_outlined,size: 80,):image!=null?ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:CircleAvatar(
                          radius: 40,
                          backgroundImage: FileImage(image!),
                        ),
                      ):CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            "http://10.0.2.2:8000/Image/User/Image/${users.image}"
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: TColor.KBackgroundcolor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: user.username,
                      decoration: InputDecoration(
                          hintText: users.username==null?'Pleasse enter your email.....':users.username,
                          prefixIcon:  Icon(
                            Icons.perm_identity_outlined,
                            color: TColor.KPrimarykeycolor,
                          ),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: TColor.KBackgroundcolor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: user.email,
                      decoration: InputDecoration(
                          hintText: users.email==null?'Pleasse enter your email.....':users.email,
                          prefixIcon:  Icon(
                            Icons.email_outlined,
                            color: TColor.KPrimarykeycolor,
                          ),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: TColor.KBackgroundcolor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: user.phone,
                      decoration: InputDecoration(
                        hintText: users.phone==null?'Pleasse enter your email.....':users.phone,
                        prefixIcon:  Icon(
                          Icons.call,
                          color: TColor.KPrimarykeycolor,
                        ),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide.none
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.blue, width: 1.0),
                    ),
                    child: TextFormField(
                      controller: user.address,
                      decoration: InputDecoration(
                        hintText: users.address==null?'Address':users.address,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                        border: InputBorder.none, // Remove the default border
                      ),
                      maxLines: 5,
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        user.changes_profile(this.image,users.username,users.email,users.phone,users.address);
                      });
                    },
                    child: user.isloading.value?isloading():Text(
                      'Savec Changes'.tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
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
              ],
            ),
          );
        },
      )),
    );
  }
}

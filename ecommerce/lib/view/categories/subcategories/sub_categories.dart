import 'package:ecommerce/controller/subcategories_controller.dart';
import 'package:ecommerce/view/isloading/isloading.dart';
import 'package:ecommerce/view/home/product/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class subcategories extends StatefulWidget {
  var id,title;
  subcategories({super.key,required this.id,required this.title});

  @override
  State<subcategories> createState() => _subcategoriesState();
}

class _subcategoriesState extends State<subcategories> {
  final subcategorie= Get.put(subcategories_controller());
  @override
  void initState() {
    subcategorie.get(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0XFFe5e5e5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: Obx((){
        if(subcategorie.isloading.value){
          return const isloading();
        }else{
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.75),
            itemCount: subcategorie.subcategories.length,
            itemBuilder: (context, index) {
              final subcategories=subcategorie.subcategories[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      Get.to(product(id: subcategories.id));
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image(
                            image: NetworkImage(
                              'http://10.0.2.2:8000/Image/Subcategories/Image/${subcategories.image}',
                            ),
                            fit: BoxFit.cover,
                            height: 70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}

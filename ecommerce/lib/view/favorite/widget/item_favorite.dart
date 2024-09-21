import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/view/home/detail/detail.dart';
import 'package:ecommerce/view/isloading/isloading.dart';
import 'package:ecommerce/view/home/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class item_favorite extends StatefulWidget {
  item_favorite({super.key});

  @override
  State<item_favorite> createState() => _item_favoriteState();
}

class _item_favoriteState extends State<item_favorite> {
  final favorite = Get.put(favorite_controller());
  final product = Get.put(product_controller());
  @override
  void initState() {
    favorite.get();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Obx(() {
        if (favorite.isloading.value) {
          return isloading();
        } else {
          if(favorite.favorites.length==0){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height:250,
                    width: 250,
                    child: Image(
                      image: AssetImage("assets/img/empty_cart.png"),
                    ),
                  ),
                  Text("Favorites".tr),
                ],
              ),
            );
          }else{
            return ListView.builder(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: favorite.favorites.length,
              itemBuilder: (context, index) {
                final favorites = favorite.favorites[index];
                return Slidable(
                  endActionPane: ActionPane(
                    extentRatio: 5 / 16,
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          setState(() {
                            favorite.stote(favorites.product_id);
                          });
                        },
                        backgroundColor: Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: InkWell(
                      onTap: (){
                        // product.detail(favorites.product.id);
                        // Get.to(detail());
                      },
                      child: Container(
                        height: 100,
                        color: Colors.white,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.teal
                                ),
                                height: 100,
                                width: 100,
                                child: ListView.builder(scrollDirection: Axis.vertical,itemCount: 1,itemBuilder: (context, index) {
                                  final image=favorites.product.images[index];
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child:  Image(
                                      height: 100,
                                      fit: BoxFit.cover,
                                      image: NetworkImage("http://10.0.2.2:8000/Image/Product/Image/${image.image}"),
                                    ),
                                  );
                                },)
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Stack(
                                  children: [
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  favorites.product.title,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "\$${favorites.product.price}",
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 2, right: 2),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                  border:
                                                  Border.all(color: Colors.red),
                                                ),
                                                height: 30,
                                                width: 90,
                                                child: Center(
                                                  child: Text(
                                                    "Add to Card",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        }
      }),
    );
  }
}

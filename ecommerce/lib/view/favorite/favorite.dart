import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/view/favorite/widget/item_favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class favorite extends StatelessWidget {
  favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Favorites'.tr),
        centerTitle: true,
      ),
      body: item_favorite(),
    );
  }
}

import 'package:ecommerce/view/card/card.dart';
import 'package:ecommerce/view/categories/categories.dart';
import 'package:ecommerce/view/favorite/favorite.dart';
import 'package:ecommerce/view/home/home.dart';
import 'package:ecommerce/view/account/profile/profile.dart';
import 'package:ecommerce/view/settinges/settinges.dart';
import 'package:get/get.dart';

class main_controller extends GetxController{
  int index=0;
  List page=[
    home(),
    categories(),
    card(),
    favorite(),
    settings(),
  ];
}
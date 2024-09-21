import 'package:ecommerce/view/home/widget/menu.dart';
import 'package:ecommerce/view/home/widget/populor.dart';
import 'package:ecommerce/view/home/widget/slider.dart';
import 'package:flutter/material.dart';

class sliveradapter extends StatelessWidget {
  const sliveradapter({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          slider(),
          menu(),
          const populor(),
        ],
      ),
    );
  }
}

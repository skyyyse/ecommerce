import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/controller/slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class slider extends StatefulWidget {
  slider({super.key});

  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {
  final slider=Get.put(slider_controller());
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Padding(
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(2, 3),
                  ),
                ],
                color: Colors.transparent,
              ),
              child: CarouselSlider(
                items: slider.slider
                    .map(
                      (item) => Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "http://10.0.2.2:8000/Image/Slider/Image/${item.image}"
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
                    .toList(),
                carouselController: slider.carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      slider.currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: slider.slider.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => slider.carouselController.animateToPage(entry.key),
                    child: Container(
                      width: slider.currentIndex == entry.key ? 17 : 7,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                        slider.currentIndex == entry.key ? Colors.red : Colors.teal,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    });
  }
}

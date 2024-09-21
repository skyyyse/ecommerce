import 'package:flutter/material.dart';
import 'package:get/get.dart';

class populor extends StatelessWidget {
  const populor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            height: 60,
            width: 100,
            child: Center(
                child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    height: 60,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Populor".tr,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(40)),
                    ),
                    height: 40,
                    width: 100,
                    child: Center(
                      child: Text(
                        "Product".tr,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10,top: 8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 140,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                    'assets/img/slide1.gif'
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 140,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/img/slide2.gif'
                )
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            height: 60,
            width: 100,
            child: Center(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      height: 60,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "All Products".tr,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(40)),
                      ),
                      height: 40,
                      width: 100,
                      child: Center(
                        child: Text(
                          "For You".tr,
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

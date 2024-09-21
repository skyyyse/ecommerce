import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class isloading extends StatelessWidget {
  const isloading({super.key});
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        color: Colors.transparent,
        width: 20,
        height: 20,
        child: CircularProgressIndicator()
      ),
    );
  }
}

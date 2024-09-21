import 'package:flutter/material.dart';

class product_page extends StatelessWidget {
  var image,title,subtitle,price;
  product_page({super.key,required this.image,required this.title,required this.subtitle,required this.price});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  "http://10.0.2.2:8000/Image/Product/Image/${image}",
                  width: double.infinity,
                  height: 125,
                  fit: BoxFit.cover,
                ),
              ),
            ),
             Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Price
                    Text(
                      "\$${price.toString()}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String productImage;
  final String productName;
  final String actualPrice;
  final String canceledPrice;

  const ProductItem({
    Key? key,
    required this.productImage,
    required this.productName,
    required this.actualPrice,
    required this.canceledPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Discount label positioned at the top left
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              '10% off',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
          // Center the image with reduced height
          Center(
            child: Image.asset(
              productImage,
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            productName, // Product name
            style: TextStyle(fontSize: 14), // Smaller font size
          ),
          // Row for prices
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                actualPrice, // Actual product price
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold), // Bolder price
              ),
              Text(
                canceledPrice, // Canceled price
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    decoration:
                        TextDecoration.lineThrough), // Canceled price style
              ),
            ],
          ),
        ],
      ),
    );
  }
}

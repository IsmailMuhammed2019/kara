import 'package:flutter/material.dart';
import 'product_item.dart'; // Import the ProductItem component

class ProductList extends StatelessWidget {
  final List<Map<String, String>> productList;

  const ProductList({Key? key, required this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: GridView.builder(
        physics:
            const NeverScrollableScrollPhysics(), // Disable scrolling for GridView
        shrinkWrap: true, // Allow GridView to take only the space it needs
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two products per row
          childAspectRatio: 0.9, // Adjust aspect ratio to reduce height
          crossAxisSpacing: 10, // Space between columns
          mainAxisSpacing: 10, // Space between rows
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ProductItem(
            productImage: productList[index]['image']!,
            productName: productList[index]['name']!,
            actualPrice: productList[index]['actualPrice']!,
            canceledPrice: productList[index]['canceledPrice']!,
          );
        },
      ),
    );
  }
}

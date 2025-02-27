import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductCarousel extends StatelessWidget {
  final List<String> productList;
  final Function(int) onPageChanged;

  const ProductCarousel(
      {Key? key, required this.productList, required this.onPageChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 150,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5), // Slower sliding
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.5, // Show two products at a time
          onPageChanged: (index, reason) => onPageChanged(index),
        ),
        items: productList
            .map((product) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        product,
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Product Name', // Replace with actual product name
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '\$99.99', // Replace with actual product price
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}

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
          height: 220,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5), // Slower sliding
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.4, // Adjusted to show wider products
          onPageChanged: (index, reason) => onPageChanged(index),
        ),
        items: productList
            .map((product) => Container(
                  width: 170, // Set a specific width for the product container
                  margin: const EdgeInsets.symmetric(
                      horizontal: 2), // Reduced margin
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Add padding to the inner part
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align children to the start
                      children: [
                        // Discount label positioned at the top left
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            '10% off',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Center the image
                        Center(
                          child: Image.asset(
                            product,
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Product Name', // Replace with actual product name
                          style: TextStyle(fontSize: 14), // Smaller font size
                        ),
                        // Row for prices
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$99.99', // Actual product price
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold), // Bolder price
                            ),
                            Text(
                              '\$109.99', // Canceled price
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  decoration: TextDecoration
                                      .lineThrough), // Canceled price style
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

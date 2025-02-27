// lib/screens/home.dart
import 'package:flutter/material.dart';
import '../components/search_bar.dart';
import '../components/image_carousel.dart';
import '../components/product_carousel.dart';
import '../components/countdown_timer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imgList = [
    'assets/imgs/img1.png',
    'assets/imgs/img2.png',
    'assets/imgs/img3.png',
    'assets/imgs/img4.png',
  ];

  final List<String> productList = [
    'assets/imgs/product1.png',
    'assets/imgs/product2.png',
    'assets/imgs/product3.png',
    'assets/imgs/product4.png',
  ];

  int _currentIndex = 0; // Variable to track the current index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          TopSearchBar(),
          ImageCarousel(
            imgList: imgList,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Deals of the Day',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.white,
                            size: 14,
                          ),
                          SizedBox(width: 8),
                          CountdownTimer(), // Countdown Timer Widget
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  'View All',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
          ProductCarousel(
            productList: productList,
            onPageChanged: (index) {
              setState(() {
                _currentIndex =
                    index; // Update current index for products if needed
              });
            },
          ),
        ],
      ),
    );
  }
}

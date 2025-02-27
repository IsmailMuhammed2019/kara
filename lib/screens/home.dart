// lib/screens/home.dart
import 'package:flutter/material.dart';
import 'package:kara/components/products_list.dart';
import '../components/search_bar.dart';
import '../components/image_carousel.dart';
import '../components/product_carousel.dart';
import '../components/countdown_timer.dart';
import '../components/bottom_nav_bar.dart';

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

  final List<Map<String, String>> productList1 = [
    {
      'image': 'assets/imgs/product1.png',
      'name': 'Product 1',
      'actualPrice': '\$20.00',
      'canceledPrice': '\$25.00',
    },
    {
      'image': 'assets/imgs/product2.png',
      'name': 'Product 2',
      'actualPrice': '\$30.00',
      'canceledPrice': '\$35.00',
    },
    {
      'image': 'assets/imgs/product3.png',
      'name': 'Product 3',
      'actualPrice': '\$40.00',
      'canceledPrice': '\$45.00',
    },
    {
      'image': 'assets/imgs/product4.png',
      'name': 'Product 4',
      'actualPrice': '\$50.00',
      'canceledPrice': '\$55.00',
    },
    {
      'image': 'assets/imgs/product5.png',
      'name': 'Product 5',
      'actualPrice': '\$60.00',
      'canceledPrice': '\$65.00',
    },
    {
      'image': 'assets/imgs/product6.png',
      'name': 'Product 6',
      'actualPrice': '\$70.00',
      'canceledPrice': '\$75.00',
    },
    {
      'image': 'assets/imgs/product7.png',
      'name': 'Product 7',
      'actualPrice': '\$80.00',
      'canceledPrice': '\$85.00',
    },
    {
      'image': 'assets/imgs/product8.png',
      'name': 'Product 8',
      'actualPrice': '\$90.00',
      'canceledPrice': '\$95.00',
    },
    {
      'image': 'assets/imgs/product9.png',
      'name': 'Product 9',
      'actualPrice': '\$100.00',
      'canceledPrice': '\$105.00',
    },
    {
      'image': 'assets/imgs/product10.png',
      'name': 'Product 10',
      'actualPrice': '\$110.00',
      'canceledPrice': '\$115.00',
    },
  ];

  int _currentIndex = 0; // Variable to track the current index
  int _currentNavIndex =
      0; // Variable to track the current index of the bottom nav bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
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
              padding: const EdgeInsets.fromLTRB(16, 30, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Deals of the Day',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'All Products',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(5),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Colors.white,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'View All',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
            ProductList(productList: productList1),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Add pagination logic here
                  // For example, load more products or navigate to another page
                },
                child: Text('Load More Products'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() {
            _currentNavIndex = index; // Update the current index
          });
          // Handle navigation based on the selected index
          // For example, you can navigate to different screens here
        },
      ),
    );
  }
}

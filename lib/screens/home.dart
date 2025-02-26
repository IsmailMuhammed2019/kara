// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

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

  int _currentIndex = 0; // Variable to track the current index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        SvgPicture.asset(
                          'assets/imgs/search.svg',
                          width: 25,
                          height: 25,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              hintStyle: TextStyle(
                                  color: Colors
                                      .grey), // Optional: Style for hint text
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10), // Center text vertically
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black),
                  ),
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.transparent,
                    child: SvgPicture.asset(
                      'assets/imgs/bell.svg',
                      width: 22,
                      height: 22,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index; // Update current index
                });
              },
            ),
            items: imgList
                .map((item) => Container(
                      child: Center(
                        child:
                            Image.asset(item, fit: BoxFit.cover, width: 1000),
                      ),
                    ))
                .toList(),
          ),
          // Indicator Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              int index = entry.key;
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Colors.red
                      : Colors.grey, // Active indicator color
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Deals of the Day section
                Row(
                  children: [
                    Text(
                      'Deals of the Day',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        width: 8), // Spacing between text and timer container
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
                // "View All" text
                Text(
                  'View All',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Countdown Timer Widget
class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  int _start = 24 * 60 * 60; // 24 hours in seconds

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int hours = (_start ~/ 3600);
    int minutes = (_start % 3600) ~/ 60;
    int seconds = _start % 60;

    return Text(
      '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
      style: TextStyle(color: Colors.white, fontSize: 14),
    );
  }
}

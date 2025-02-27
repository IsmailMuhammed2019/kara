import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imgList;
  final Function(int) onPageChanged;

  const ImageCarousel({
    Key? key,
    required this.imgList,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentIndex = 0; // Declare current index

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              widget.onPageChanged(index); // Call the passed function
            },
          ),
          items: widget.imgList
              .map((item) => Container(
                    child: Center(
                      child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                    ),
                  ))
              .toList(),
        ),
        // Indicator Row for Image Carousel
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imgList.asMap().entries.map((entry) {
            int index = entry.key;
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Colors.red
                    : Colors.black, // Change color based on active index
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

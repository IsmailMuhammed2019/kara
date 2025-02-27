import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imgList;
  final Function(int) onPageChanged;

  const ImageCarousel(
      {Key? key, required this.imgList, required this.onPageChanged})
      : super(key: key);

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
            onPageChanged: (index, reason) => onPageChanged(index),
          ),
          items: imgList
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
          children: imgList.asMap().entries.map((entry) {
            int index = entry.key;
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black, // Active indicator color
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

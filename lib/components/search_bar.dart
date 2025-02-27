import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopSearchBar extends StatelessWidget {
  const TopSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:midnimo/utility/utilits.dart';

class Filtercard extends StatelessWidget {
  Filtercard({
    super.key,
    required this.imageurl,
    required this.text,
    required this.titale_COLOR,
    required this.width,
    required this.height,
    required this.onTap,
    required this.isclicked,
  });
  String? imageurl;
  String? text;

  Color titale_COLOR;
  double? width;
  double? height;
  bool isclicked = true;

  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 190,
        // padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: isclicked
            ? KClickedContainersDocoration
            : KUnClickedContainersDocoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(clipBehavior: Clip.antiAlias, children: [
              Center(
                child: Container(
                    width: 60,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: isclicked
                              ? Kmost_used
                              : Colors.grey, // Shadow color
                          spreadRadius: 5, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: Offset(0, 3), // Offset in x and y direction
                        ),
                      ],
                    ),
                    child: null),
              ),
              Center(
                child: Image.asset(
                  imageurl!,
                  fit: BoxFit.cover,
                  width: width!,
                  height: height!,
                ),
              ),
            ]),
            Text(
              text!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: titale_COLOR),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midnimo/pages/map.dart';

class Itemcardtampleate extends StatelessWidget {
  Itemcardtampleate({
    super.key,
    required this.titile,
    required this.subtitile,
    required this.imageurl,
    required this.price,
    required this.catagory,
  });
  String titile;
  String subtitile;
  int price;
  String imageurl;
  String catagory;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          padding: catagory == "cilad bixin"
              ? EdgeInsets.symmetric()
              : EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          width: 185,
          height: 190,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: catagory == "cilad bixin"
              ? Image.asset(
                  imageurl,
                  fit: BoxFit.fill, // corrected here
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Image.asset(
                            imageurl,
                            fit: catagory == "cilad bixin"
                                ? BoxFit.fill
                                : BoxFit.contain,
                            width: 80,
                          ),
                          catagory == "agab cusub" &&
                                  imageurl != "assets/images/haan 6KG.png"
                              ? Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Center(
                                    child: Container(
                                      width: 100,
                                      child: Image.asset(
                                        "assets/images/coocker.png",
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 2,
                      child: AutoSizeText(
                        minFontSize: 1,
                        overflow: TextOverflow.ellipsis,
                        "\$$price",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                titile,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 130.0,
                child: Text(subtitile),
              ),
              SizedBox(
                height: 10.0,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Maplocation(),
                    ),
                  );
                },
                child: Text(
                  "DALBO",
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xff4C9CE1),
              )
            ],
          ),
        ),
        SizedBox(
          height: 12.0,
        )
      ],
    );
  }
}

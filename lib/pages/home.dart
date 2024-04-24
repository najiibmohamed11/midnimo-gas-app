import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:midnimo/components/filtercard.dart';
import 'package:midnimo/components/itemcard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? items_name = "soo buuxin";
  List<Map<String, dynamic>> soobuuxin = [
    {
      "image": "assets/images/haan cag 17kg.png",
      "titile": "17 KG CAAG ",
      "description":
          "hadii uu GASS  kaa dhamaaday haantaduna eytahay CAAG 17 KG hada dalbo",
      "price": 23
    },
    {
      "image": "assets/images/haanbir13kg.png",
      "titile": "haan 13KG Bir",
      "description":
          "hadii uu GASS  kaa dhamaaday haantaduna eytahay BIR 13 KG hada dalbo",
      "price": 23
    },
    {
      "image": "assets/images/haan 6KG.png",
      "titile": "6 KG BIR ",
      "description":
          "hadii uu GASS  kaa dhamaaday haantaduna eytahay BIR 6KG hada dalbo",
      "price": 11
    },
  ];
  List<Map<String, dynamic>> cilad_bixin = [
    {
      "image": "assets/images/cilad bixin.png",
      "titile": "cilad ayaa jirto ",
      "description":
          "HADII EY CILAD KU QABSATO XAGA GAAS KA WAA INALA SOO XERIIRI KARTAA ",
      "price": 0
    },
  ];
  List<Map<String, dynamic>> agab_cusub = [
    {
      "image": "assets/images/haan cag 17kg.png",
      "titile": "17 KG CAAG ",
      "description": "haan caag ah iyo jikadeeda oo cusub hada dalbo",
      "price": 129
    },
    {
      "image": "assets/images/haanbir13kg.png",
      "titile": "haan 13KG Bir",
      "description":
          "hadii uu GASS  kaa dhamaaday haantaduna eytahay BIR 13 KG hada dalbo",
      "price": 23
    },
    {
      "image": "assets/images/haan 6KG.png",
      "titile": "6 KG BIR ",
      "description":
          "hadii uu GASS  kaa dhamaaday haantaduna eytahay BIR 6KG hada dalbo",
      "price": 11
    },
  ];

  List<Map<String, dynamic>> filtred_items = [];

  void filteritems(String catagoty) {
    setState(() {
      filtred_items.clear();

      if (catagoty == "soo buuxin") {
        filtred_items.addAll(soobuuxin);

        items_name = catagoty;
      } else if (catagoty == "agab cusub") {
        filtred_items.addAll(agab_cusub);
        items_name = catagoty;
      } else if (catagoty == "cilad bixin") {
        filtred_items.addAll(cilad_bixin);
        items_name = catagoty;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    filtred_items.addAll(soobuuxin);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.menu_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text("T"),
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Text(
                "HI Welcome👋",
                style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Filtercard(
                  imageurl: "assets/images/haan cag 17kg.png",
                  text: "soo \nbuuxin",
                  titale_COLOR:
                      items_name == "soo buuxin" ? Colors.white : Colors.black,
                  width: 40,
                  height: 80,
                  isclicked: items_name == "soo buuxin",
                  onTap: () {
                    filteritems("soo buuxin");
                  },
                ),
                Filtercard(
                  imageurl:
                      "assets/images/haan cag 17kg & burjukadeeda cusub.png",
                  text: "Agab \nCusub",
                  titale_COLOR: Colors.black,
                  width: 90,
                  height: 110,
                  isclicked: items_name == "agab cusub",
                  onTap: () {
                    filteritems("agab cusub");
                  },
                ),
                Filtercard(
                  imageurl: "assets/images/technician.png",
                  text: "Cilad \nBixin",
                  titale_COLOR: Colors.black,
                  width: 40,
                  height: 80,
                  isclicked: items_name == "cilad bixin",
                  onTap: () {
                    filteritems("cilad bixin");
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                items_name!,
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            filtred_items == null
                ? Text("no data")
                : Expanded(
                    child: ListView.builder(
                      itemCount: filtred_items.length,
                      itemBuilder: (context, index) {
                        return Itemcardtampleate(
                          titile: filtred_items[index]["titile"],
                          subtitile: filtred_items[index]["description"],
                          price: filtred_items[index]["price"],
                          imageurl: filtred_items[index]["image"],
                          catagory: items_name!,
                        );
                      },
                    ),
                  )

            // items list
          ],
        ),
      )),
    ));
  }
}

import 'dart:convert';
// import 'dart:html';
import 'package:best_folk_medicine/shopcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShopingPage extends StatefulWidget {
  const ShopingPage({Key? key}) : super(key: key);

  @override
  _ShopingPageState createState() => _ShopingPageState();
}

class _ShopingPageState extends State<ShopingPage> {
  String? shopData;
  late var sData;

  loadJson() async {
    shopData = await rootBundle.loadString("asset/data/shop.json");
    sData = await jsonDecode(shopData!);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    if (shopData == null) {
      return CircularProgressIndicator(strokeWidth: 4);
    } else {
      return Container(
        child: GridView.builder(
            itemCount: sData.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) => shopCardPage(
                image: sData[index]["image"], name: sData[index]["name"])),
      );
    }
  }
}

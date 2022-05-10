import 'dart:convert';
import 'package:best_folk_medicine/shoppage/shopcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShopingPage extends StatefulWidget {
  const ShopingPage({Key? key}) : super(key: key);

  @override
  _ShopingPageState createState() => _ShopingPageState();
}

class _ShopingPageState extends State<ShopingPage> {
  String? shopData;
   var shopsData;

  loadJson() async {
    shopData = await rootBundle.loadString("asset/data/shop.json");
    shopsData = await jsonDecode(shopData!);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    if (shopData == null) {
      return const CircularProgressIndicator(strokeWidth: 4);
    } else {
      return Container(
        child: GridView.builder(
            itemCount: shopsData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) => ShopCardPage(
                image: shopsData[index]["image"],
                name: shopsData[index]["name"])),
      );
    }
  }
}

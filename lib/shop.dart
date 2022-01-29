// import 'dart:convert';
//
// // import 'dart:html';
// import 'package:best_folk_medicine/bottomnavigationbar.dart';
// import 'package:best_folk_medicine/controlbox.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class ShopingPage extends StatefulWidget {
//   const ShopingPage({Key? key}) : super(key: key);
//
//   @override
//   _ShopingPageState createState() => _ShopingPageState();
// }
//
// class _ShopingPageState extends State<ShopingPage> {
//   late String shopData;
//
//   loadJson() async {
//     shopData = await rootBundle.loadString("asset/data/shop.json");
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loadJson();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var sData = jsonDecode(shopData);
//     return Scaffold(
//       backgroundColor: Kbgcolor,
//       appBar: AppBar(
//         backgroundColor: Kappbarbgcolor,
//         elevation: 0.0,
//         title: Text(
//           "Shop",
//           style: Theme.of(context).textTheme.headline1,
//         ),
//       ),
//       body: GridView.builder(
//         itemCount: sData.length,
//         gridDelegate:
//             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemBuilder: (context, index) => Card(
//             child: Column(
//               children: [
//                 Image.asset(
//                   sData[index]["image"],
//                   fit: BoxFit.cover,
//                   height: MediaQuery.of(context).size.height * .18,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   sData[index]["name"],
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       bottomNavigationBar: bottomBar(),
//
//     );
//   }
// }

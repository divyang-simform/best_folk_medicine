import 'package:best_folk_medicine/state_management/mobx.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../data_fetching/api_calling.dart';
import '../data_fetching/data.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'card.dart';
import 'main_articles_card.dart';
//
// FutureBuilder<Postt> buildCard(BuildContext context, int page) {
// Data data = Data();
//   return FutureBuilder<Postt>(
//   future: data.onData(),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.done) {
//         if (snapshot.hasError) {
//           return Center(
//             child: Text(
//               snapshot.error.toString(),
//               textAlign: TextAlign.center,
//               textScaleFactor: 1.3,
//             ),
//           );
//         }
//         final posts = snapshot.data;
//         print(posts?.articles);
//         return ListView.builder(
//           scrollDirection: (page == 1) ? Axis.horizontal : Axis.vertical,
//           physics: (page == 2) ? const NeverScrollableScrollPhysics() : null,
//           shrinkWrap: true,
//           itemCount: (page == 1) ? 5 : posts?.articles.length ?? 5,
//           itemBuilder: (context, index) => (page == 1)
//               ? MyCardPage(
//               urlToImage: (posts?.articles[index].urlToImage).toString(),
//               title: (posts?.articles[index].title).toString(),
//               description: (posts?.articles[index].description).toString(),
//               author: (posts?.articles[index].author).toString(),
//               publishedAt: (posts?.articles[index].publishedAt).toString())
//               : cardPage(
//               image: (posts?.articles[index].urlToImage).toString(),
//               title: (posts?.articles[index].title).toString(),
//               description: (posts?.articles[index].description).toString(),
//               time: (posts?.articles[index].publishedAt).toString(),
//               name: (posts?.articles[index].author).toString()),
//         );
//       } else {
//         return Container(
//             alignment: Alignment.center,
//             child: const CircularProgressIndicator.adaptive());
//       }
//     },
//   );
// }

buildCard(BuildContext context, int page) {
  Data data = Data();
  data.onData();
  return Observer(builder: (_) {
    try {
      print("object1");
      if (data.response == null) {
        return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator.adaptive());
      }
      if (data.response?.status == FutureStatus.pending) {
        return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator.adaptive());
      } else if (data.response?.status == FutureStatus.rejected) {
        return const Text("error :(");
      } else {
        print(data.getData?.body?.articles[0].title);
        return Text((data.getData?.body?.articles[0].title).toString());
        // if (data.response.status == FutureStatus.fulfilled) {
        // return Text((data.getData?.articles.length).toString());
      }
    } catch (exe) {
      return Text(exe.toString());
    }
  }
      // (data.getData == null)
      //     ? CircularProgressIndicator()
      //     : Text(data.getData.articles[1].title.toString()),
      );
}

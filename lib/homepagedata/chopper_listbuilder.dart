import 'package:best_folk_medicine/state_management/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import '../data_fetching/data.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import 'main_articles_card.dart';

/// this is not a comment this is other method

FutureBuilder<Postt> buildCard(BuildContext context) {
  Data data = Data();
  return FutureBuilder<Postt>(
    future: data.onData(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          if (snapshot.error.toString() == "404"){
            return Image.network("https://blog.thomasnet.com/hs-fs/hubfs/shutterstock_774749455.jpg?width=600&name=shutterstock_774749455.jpg");
          }else{
          return Center(
            child: Text(
              snapshot.error.toString(),
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
            ),
          );}
        }
        final posts = snapshot.data;
        return _buildPosts(context, posts, 1);
      } else {
        return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator.adaptive());
      }
    },
  );
}

buildCards(BuildContext context) {
  Data data = Data();
  data.onDatas();
  return Observer(builder: (_) {
    try {
      if (data.response == null) {
        return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator.adaptive());
      }
      if (data.response?.status == FutureStatus.pending) {
        return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator.adaptive());
      }
      else if (data.response?.status == FutureStatus.rejected) {
        return const Text("Error :(");
      }
      else {
        return _buildPosts(context, data, 2);
      }
    } catch (exe) {
      return Text(exe.toString());
    }
  });
}

ListView _buildPosts(BuildContext context, dynamic data, int page) {
  return ListView.builder(
    scrollDirection: (page == 1) ? Axis.horizontal : Axis.vertical,
    physics: (page == 2) ? const NeverScrollableScrollPhysics() : null,
    shrinkWrap: true,
    itemCount: (page == 1) ? 5 : data.getData?.body?.articles.length,
    itemBuilder: (context, index) => (page == 1)
        ? MyCardPage(
            urlToImage: (data?.articles[index].urlToImage).toString(),
            title: (data?.articles[index].title).toString(),
            description: (data?.articles[index].description).toString(),
            author: (data?.articles[index].author).toString(),
            publishedAt: (data?.articles[index].publishedAt).toString())
        : CardPage(
            image: (data.getData?.body?.articles[index].urlToImage).toString(),
            title: (data.getData?.body?.articles[index].title).toString(),
            description:
                (data.getData?.body?.articles[index].description).toString(),
            time: (data.getData?.body?.articles[index].publishedAt).toString(),
            name: (data.getData?.body?.articles[index].author).toString()),
  );
}

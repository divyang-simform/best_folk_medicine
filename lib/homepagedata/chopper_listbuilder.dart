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
          return Center(
            child: Text(
              snapshot.error.toString(),
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
            ),
          );
        }
        final posts = snapshot.data;
        return ListView.builder(
            scrollDirection:  Axis.horizontal ,
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) => MyCardPage(
                urlToImage: (posts?.articles[index].urlToImage).toString(),
                title: (posts?.articles[index].title).toString(),
                description: (posts?.articles[index].description).toString(),
                author: (posts?.articles[index].author).toString(),
                publishedAt: (posts?.articles[index].publishedAt).toString()));
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
      } else if (data.response?.status == FutureStatus.rejected) {
        return const Text("error :(");
      } else {
        return _buildPosts(context, data);
      }
    } catch (exe) {
      return Text(exe.toString());
    }
  });
}

ListView _buildPosts(BuildContext context, Data data) {
  return ListView.builder(
    scrollDirection: Axis.vertical,
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: data.getData?.body?.articles.length ?? 5,
    itemBuilder: (context, index) => cardPage(
        image: (data.getData?.body?.articles[index].urlToImage).toString(),
        title: (data.getData?.body?.articles[index].title).toString(),
        description:
            (data.getData?.body?.articles[index].description).toString(),
        time: (data.getData?.body?.articles[index].publishedAt).toString(),
        name: (data.getData?.body?.articles[index].author).toString()),
  );
}

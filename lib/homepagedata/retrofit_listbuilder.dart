import '../state_management/mobxretofit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'main_articles_card.dart';
import 'package:flutter/material.dart';
import 'card.dart';

buildAllArticles(BuildContext context, int page) {
  DataFile dataFile = DataFile();
  dataFile.onData();
  return Observer(builder: (_) {
    try {
      if (dataFile.response == null) {
        return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator.adaptive());
      }
      if (dataFile.response?.status == FutureStatus.pending) {
        return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator.adaptive());
      } else if (dataFile.response?.status == FutureStatus.rejected) {
        return const Text("error :(");
      } else {
        return _buildPosts(context, dataFile, page);
      }
    } catch (exe) {
      return Text(exe.toString());
    }
  });
}

ListView _buildPosts(BuildContext context, DataFile data, int page) {
  return ListView.builder(
    scrollDirection: (page == 1) ? Axis.horizontal : Axis.vertical,
    physics: (page == 2) ? const NeverScrollableScrollPhysics() : null,
    shrinkWrap: true,
    itemCount: (page == 1) ? 4 : data.getData?.articles.length,
    itemBuilder: (context, index) => (page == 1)
        ? MyCardPage(
            urlToImage: (data.getData?.articles[index].urlToImage).toString(),
            title: (data.getData?.articles[index].title).toString(),
            description: (data.getData?.articles[index].description).toString(),
            author: (data.getData?.articles[index].author).toString(),
            publishedAt: (data.getData?.articles[index].publishedAt).toString())
        : CardPage(
            image: (data.getData?.articles[index].urlToImage).toString(),
            title: (data.getData?.articles[index].title).toString(),
            description: (data.getData?.articles[index].description).toString(),
            time: (data.getData?.articles[index].publishedAt).toString(),
            name: (data.getData?.articles[index].author).toString()),
  );
}

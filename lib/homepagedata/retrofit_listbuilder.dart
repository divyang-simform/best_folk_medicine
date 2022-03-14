import '../data_fetching/Articles.dart';
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
        ? MyCardPage(articles: data.getData?.articles[index] as Articles)
        : CardPage(
            articles: data.getData?.articles[index] as Articles, mode: 1),
  );
}

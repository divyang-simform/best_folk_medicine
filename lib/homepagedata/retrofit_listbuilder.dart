import '../data_fetching/Articles.dart';
import '../data_fetching/data.dart';
import 'main_articles_card.dart';
import '../setting/image_control_box.dart';
import '../setting/textcontrolbox.dart';
import 'package:flutter/material.dart';
import '../data_fetching/api_calling_byretrofit.dart';
import 'package:dio/dio.dart';

import 'card.dart';

FutureBuilder<Postt> buildAllArticles(BuildContext context, int page) {
  final client = ApiCalling(Dio(BaseOptions()));
  return FutureBuilder<Postt>(
    future: client.getPost(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final List<Articles>? post = snapshot.data?.articles;
        return ListView.builder(
          scrollDirection: (page == 1) ? Axis.horizontal : Axis.vertical,
          physics: (page == 2) ? const NeverScrollableScrollPhysics() : null,
          shrinkWrap: true,
          itemCount: (page == 1) ? 5 : post?.length ?? 5,
          itemBuilder: (context, index) => (page == 1)
              ? MyCardPage(
                  urlToImage: post?[index].urlToImage ?? kUrlToImage,
                  title: post?[index].title ?? kTitle,
                  description: post?[index].description ?? kDescription,
                  publishedAt: post?[index].publishedAt ?? kPublishedAt,
                  author: post?[index].author ?? kAuthorName)
              : cardPage(
                  image: post?[index].urlToImage ?? kUrlToImage,
                  title: post?[index].title ?? kTitle,
                  description: post?[index].description ?? kDescription,
                  time: post?[index].publishedAt ?? kPublishedAt,
                  name: post?[index].author ?? kAuthorName),
        );
      } else {
        return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator());
      }
    },
  );
}

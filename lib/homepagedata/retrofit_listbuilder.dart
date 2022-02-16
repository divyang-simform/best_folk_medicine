import '../data_fetching/Articles.dart';
import '../data_fetching/data.dart';
import 'main_articles_card.dart';
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
                  urlToImage: (post?[index].urlToImage).toString(),
                  title: (post?[index].title).toString(),
                  description: (post?[index].description).toString(),
                  publishedAt: (post?[index].publishedAt).toString(),
                  author: (post?[index].author).toString())
              : cardPage(
                  image: (post?[index].urlToImage).toString(),
                  title: (post?[index].title).toString(),
                  description: (post?[index].description).toString(),
                  time: (post?[index].publishedAt).toString(),
                  name: (post?[index].author).toString()),
        );
      } else {
        return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator.adaptive());
      }
    },
  );
}

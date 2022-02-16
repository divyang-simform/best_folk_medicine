import '../data_fetching/api_calling.dart';
import '../data_fetching/data.dart';
import '../setting/image_control_box.dart';
import '../setting/textcontrolbox.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'card.dart';
import 'main_articles_card.dart';

FutureBuilder<Response<Postt>> buildCard(BuildContext context, int page) {
  return FutureBuilder<Response<Postt>>(
    future: Provider.of<ApiService>(context).getPost(),
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
        final posts = snapshot.data?.body;
        return ListView.builder(
          scrollDirection: (page == 1) ? Axis.horizontal : Axis.vertical,
          physics: (page == 2) ? const NeverScrollableScrollPhysics() : null,
          shrinkWrap: true,
          itemCount: (page == 1) ? 5 : posts?.articles.length ?? 5,
          itemBuilder: (context, index) => (page == 1)
              ? MyCardPage(
                  urlToImage: posts?.articles[index].urlToImage ?? kUrlToImage,
                  title: posts?.articles[index].title ?? kTitle,
                  description:
                      posts?.articles[index].description ?? kDescription,
                  author: posts?.articles[index].author ?? kAuthorName,
                  publishedAt:
                      posts?.articles[index].publishedAt ?? kPublishedAt)
              : cardPage(
                  image: posts?.articles[index].urlToImage ?? kUrlToImage,
                  title: posts?.articles[index].title ?? kTitle,
                  description:
                      posts?.articles[index].description ?? kDescription,
                  time: posts?.articles[index].publishedAt ?? kPublishedAt,
                  name: posts?.articles[index].author ?? kAuthorName),
        );
      } else {
        return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator());
      }
    },
  );
}

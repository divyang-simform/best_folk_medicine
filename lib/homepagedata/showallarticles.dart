import 'dart:convert';
import '../setting/image_control_box.dart';
import 'card.dart';
import '../setting/textcontrolbox.dart';
import '../data_fetching/Articles.dart';
import '../data_fetching/api_calling_byretrofit.dart';
import '../data_fetching/data.dart';
import '../setting/controlbox.dart';
import 'detail.dart';
import '../data_fetching/parsingdata.dart';
import 'search.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class showAllArticales extends StatefulWidget {
  static const showArticalesdata = '/showarticalespage';

  const showAllArticales({Key? key}) : super(key: key);

  @override
  _showAllArticalesState createState() => _showAllArticalesState();
}

class _showAllArticalesState extends State<showAllArticales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(kAllArticalesPageAppTitle,
              style: Theme.of(context).textTheme.headline1),
          backgroundColor: kappBarBgcolor,
          elevation: 0.0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SearchBar(),
              const SizedBox(height: 30),
              buildAllArticles(context),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<Postt> buildAllArticles(BuildContext context) {
    final client = ApiCalling(Dio(BaseOptions()));
    return FutureBuilder<Postt>(
      future: client.getPost(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Articles> post = snapshot.data!.articles;
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: post.length,
            itemBuilder: (context, index) => Column(
              children: [
                GestureDetector(
                  child: cardPage(
                      image: post[index].urlToImage,
                      title: post[index].title,
                      description: post[index].description,
                      time: post[index].publishedAt),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      detailPage.detailPagedata,
                      arguments: Product(
                          image: post[index].urlToImage ?? kUrlToImage,
                          name: post[index].author ?? kAuthorName,
                          description: post[index].description ?? kDescription,
                          title: post[index].title ?? kTitle,
                          time: post[index].publishedAt ?? kPublishedAt),
                    );
                  },
                ),
                const Divider(thickness: 2)
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

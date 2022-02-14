import 'dart:convert';
import 'package:best_folk_medicine/homepagedata/card.dart';

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
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("All Articales",
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
                    time: post[index].publishedAt,
                  ),
                  // Card(
                  //   child: Row(
                  //     children: [
                  //       Image.network(
                  //           post[index].urlToImage ??
                  //               "https://region4.uaw.org/sites/default/files/styles/large_square/public/bio/10546i3dac5a5993c8bc8c_5.jpg?itok=KqaqPMDL&c=2e7651912d133fd4368c0dce602cd839",
                  //           fit: BoxFit.fill,
                  //           height: MediaQuery.of(context).size.height * .11,
                  //           width: MediaQuery.of(context).size.width * .3),
                  //       Flexible(
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(post[index].title ?? "No Title",
                  //                   maxLines: 2,
                  //                   overflow: TextOverflow.ellipsis,
                  //                   style:
                  //                       Theme.of(context).textTheme.bodyText1),
                  //               Text(post[index].publishedAt ?? "today"),
                  //               Text(
                  //                   post[index].description ?? "No description",
                  //                   overflow: TextOverflow.ellipsis),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      detailPage.detailPagedata,
                      arguments: Product(
                        image: post[index].urlToImage ??
                            "https://region4.uaw.org/sites/default/files/styles/large_square/public/bio/10546i3dac5a5993c8bc8c_5.jpg?itok=KqaqPMDL&c=2e7651912d133fd4368c0dce602cd839",
                        name: post[index].author ?? "No Name",
                        description:
                            post[index].description ?? "No Description",
                        title: post[index].title ?? "No Title",
                        time: post[index].publishedAt ?? "Today",
                      ),
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

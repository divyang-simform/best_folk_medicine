import 'package:best_folk_medicine/data_fetching/Articles.dart';
import 'package:best_folk_medicine/state_management/favoritemobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _favorite = Provider.of<Favorite>(context);
    return Observer(builder: (_) {
      // if (data.response == null) {
      //   return Container(
      //       alignment: Alignment.center,
      //       child: const CircularProgressIndicator.adaptive());
      // }
      if (_favorite.response?.status == FutureStatus.pending) {
        return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator.adaptive());
      } else if (_favorite.response?.status == FutureStatus.rejected) {
        return const Text("Error :(");
      } else {
        return _buildPosts(context, _favorite.response);
      }
    });
  }

  ListView _buildPosts(BuildContext context, dynamic articles) {
    return ListView.builder(
      // scrollDirection: (page == 1) ? Axis.horizontal : Axis.vertical,
      // physics: (page == 2) ? const NeverScrollableScrollPhysics() : null,
      // shrinkWrap: true,
      itemCount: articles.length,
      itemBuilder: (context, index) => Text(articles.id),

      // (page == 1)
      //     ? MyCardPage(articles: data?.articles[index])
      //     : CardPage(
      //   articles: data.getData?.body?.articles[index],
      // ),
    );
  }
}
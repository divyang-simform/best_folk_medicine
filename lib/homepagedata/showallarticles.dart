import '../Flavors/app_config.dart';
import 'retrofit_listbuilder.dart';

import '../setting/textcontrolbox.dart';
import '../setting/controlbox.dart';
import 'chopper_listbuilder.dart';
import 'search.dart';
import 'package:flutter/material.dart';

class showAllArticales extends StatefulWidget {
  static const showArticalesdata = '/showarticalespage';

  const showAllArticales({Key? key}) : super(key: key);

  @override
  _showAllArticalesState createState() => _showAllArticalesState();
}

class _showAllArticalesState extends State<showAllArticales> {
  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return Scaffold(
      backgroundColor: kBgcolor,
      appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
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
              (config?.appInternalId == 1)
                  ? buildCard(context, 2)
                  : buildAllArticles(context, 2),
            ],
          ),
        ),
      ),
    );
  }
}

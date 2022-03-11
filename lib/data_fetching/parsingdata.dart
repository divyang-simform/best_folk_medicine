import 'package:best_folk_medicine/data_fetching/Articles.dart';

import '../DataBase/moor_database.dart';

class Product {
  Articles? articles;
  FavoriteMoorData? favoriteMoorData;
  final int mode;

  Product(
      {this.articles, this.favoriteMoorData , required this.mode});
}

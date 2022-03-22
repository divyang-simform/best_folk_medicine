import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class FavoriteMoor extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();

  TextColumn get author => text()();

  TextColumn get title => text()();

  TextColumn get description => text()();

  TextColumn get urlToImage => text()();

  TextColumn get url => text()();

  TextColumn get publishedAt => text()();

  TextColumn get content => text()();
}

@UseMoor(tables: [FavoriteMoor])
class FavoriteDataBase extends _$FavoriteDataBase {
  FavoriteDataBase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'moor.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<FavoriteMoorData>> getAllTasks() => select(favoriteMoor).get();


  Stream<List<FavoriteMoorData>> watchAllTasks() =>
      select(favoriteMoor).watch();

  Future insert(FavoriteMoorData favoriteMoorData) =>
      into(favoriteMoor).insert(favoriteMoorData);

  Future deletedata(FavoriteMoorData favoriteMoorData) =>
      delete(favoriteMoor).delete(favoriteMoorData);
}

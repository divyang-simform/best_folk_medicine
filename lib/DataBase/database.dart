import 'dart:core';
import 'package:best_folk_medicine/data_fetching/Articles.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ArticleFavorite {
  ArticleFavorite._init();

  static Database? _database;
  static final ArticleFavorite instance = ArticleFavorite._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('favoritearticle.db');
    return _database!;
  }

  Future<Database> _initDB(String filename) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filename);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    await db.execute("CREATE TABLE FAVORITE ("
        "${ArticlesFields.id} $idType,"
        "${ArticlesFields.author} $textType,"
        "${ArticlesFields.title} $textType,"
        "${ArticlesFields.description} $textType,"
        "${ArticlesFields.urlToImage} $textType,"
        "${ArticlesFields.url} $textType,"
        "${ArticlesFields.publishedAt} $textType,"
        "${ArticlesFields.content} $textType,"
        ")");
  }

  Future<Articles> toInsert(Articles articles) async {
    final db = await instance.database;
    final id = db.insert("FAVORITE", articles.toJson());
    return articles.copy(id: int.parse(id.toString()));
  }

  Future<Articles> singleArticle(int id) async {
    final db = await instance.database;
    final response =
        await db.query("FAVORITE", where: "id = ?", whereArgs: [id]);
    return response.isNotEmpty
        ? Articles.fromJson(response.first)
        : throw Exception('Data not Found');
  }

  Future<List<Articles>> allArticle() async {
    final db = await instance.database;
    final responses = await db.query("FAVORITE");
    return responses.map((data) => Articles.fromJson(data)).toList();
  }

  Future<int> deleteArticle(int id) async {
    final db = await instance.database;
    return await db.delete("FAVORITE", where: "id = ?", whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

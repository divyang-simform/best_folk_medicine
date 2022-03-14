import 'package:hive/hive.dart';
import '../setting/resources.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Articles.g.dart';

class ArticlesFields {
  static const String id = 'id';
  static const String author = 'author';
  static const String title = 'title';
  static const String description = 'description';
  static const String urlToImage = 'urlToImage';
  static const String url = 'url';
  static const String publishedAt = 'publishedAt';
  static const String content = 'content';
}

@HiveType(typeId: 0)
@JsonSerializable()
class Articles {
  Articles({this.id,
    this.description = kDescription,
    this.publishedAt = kPublishedAt,
    this.title = kTitle,
    this.urlToImage = kUrlToImage,
    this.content = kContent,
    this.author = kAuthorName,
    this.url = kUrl});

  int? id;
  @HiveField(0)
  String? author;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? urlToImage;
  @HiveField(4)
  String? url;
  @HiveField(5)
  String? publishedAt;
  @HiveField(6)
  String? content;

  Articles copy({
    int? id,
    String? author,
    String? title,
    String? description,
    String? urlToImage,
    String? url,
    String? publishedAt,
    String? content,
  }) =>
      Articles(id: id ,
        author: author ?? this.author,
        publishedAt: publishedAt ?? this.publishedAt,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImage: urlToImage ?? this.urlToImage,
        content: content ?? this.content,
      );

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}

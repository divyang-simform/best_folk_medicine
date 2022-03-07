import '../setting/resources.dart';
import 'package:json_annotation/json_annotation.dart';
import 'Source.dart';

part 'Articles.g.dart';

class ArticlesFields {
  static final String id = '_id';
  static final String author = 'author';
  static final String title = 'title';
  static final String description = 'description';
  static final String urlToImage = 'urlToImage';
  static final String url = 'url';
  static final String publishedAt = 'publishedAt';
  static final String content = 'content';
}

@JsonSerializable()
class Articles {
  Articles({this.id,
    this.description = kDescription,
    this.publishedAt = kPublishedAt,
    this.title = kTitle,
    this.urlToImage = kUrlToImage,
    this.content = kContent,
    this.author = kAuthorName,
    required this.source,
    this.url = kUrl});

  int? id;
  String? author;
  String? title;
  String? description;
  String? urlToImage;
  String? url;
  String? publishedAt;
  String? content;
  final Source? source;

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
      Articles(id: id ?? this.id,
        author: author ?? this.author,
        publishedAt: publishedAt ?? this.publishedAt,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImage: urlToImage ?? this.urlToImage,
        content: content ?? this.content,
        source: source ?? this.source,
      );

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}

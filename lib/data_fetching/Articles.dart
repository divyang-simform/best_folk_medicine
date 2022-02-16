import '../setting/resources.dart';
import 'package:json_annotation/json_annotation.dart';
import 'Source.dart';

part 'Articles.g.dart';

@JsonSerializable()
class Articles {
  Articles(
      {this.description = kDescription,
      this.publishedAt = kPublishedAt,
      this.title = kTitle,
      this.urlToImage = kUrlToImage,
      this.content = kContent,
      this.author = kAuthorName,
      required this.source,
      this.url = kUrl});

  String? author;
  String? title;
  String? description;
  String? urlToImage;
  String? url;
  String? publishedAt;
  String? content;
  final Source source;

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);
}

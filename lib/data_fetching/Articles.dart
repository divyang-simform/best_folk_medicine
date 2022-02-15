import 'package:json_annotation/json_annotation.dart';
import 'Source.dart';

part 'Articles.g.dart';

@JsonSerializable()
class Articles {
  Articles(this.description, this.publishedAt, this.title, this.urlToImage,
      this.content, this.author, this.source, this.url);

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

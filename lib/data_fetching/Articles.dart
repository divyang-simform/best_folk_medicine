import 'package:best_folk_medicine/setting/image_control_box.dart';
import 'package:best_folk_medicine/setting/textcontrolbox.dart';
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
      this.content = 'No Content',
      this.author = kAuthorName,
      required this.source,
      this.url = 'No Url'});

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

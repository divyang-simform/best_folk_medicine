import 'package:json_annotation/json_annotation.dart';

part 'Source.g.dart';

@JsonSerializable()
class Source {
  Source({this.id = '1', this.name = 'divyang'});

  String? id;
  String? name;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}

import 'package:json_annotation/json_annotation.dart';

part 'Source.g.dart';


@JsonSerializable()
class Source{
  Source(this.id, this.name);
  String? id;
  String? name;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

}
import '../setting/resources.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Source.g.dart';

@JsonSerializable()
class Source {
  Source({this.id = kId, this.name = kName});

  String? id;
  String? name;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}

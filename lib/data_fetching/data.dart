import 'package:json_annotation/json_annotation.dart';

import 'Articles.dart';

part 'data.g.dart';

@JsonSerializable()
class Postt {
  Postt(this.articles);
  final List<Articles> articles;

  factory Postt.fromJson(Map<String, dynamic> json) => _$PosttFromJson(json);

}
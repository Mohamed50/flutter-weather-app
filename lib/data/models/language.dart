// To parse this JSON data, do
//
//     final languageModel = languageModelFromJson(jsonString);

import 'dart:convert';

List<LanguageModel> languageModelFromJson(List json) =>
    List<LanguageModel>.from(
        json.map((x) => LanguageModel.fromJson(x)));

String languageModelToJson(List<LanguageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LanguageModel {
  LanguageModel(
    this.title,
    this.code,
  );

  String title;
  String code;

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        json["title"],
        json["code"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "code": code,
      };
}

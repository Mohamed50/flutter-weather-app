import 'dart:convert';
import 'package:flutter/services.dart';

dynamic getJsonFromAssetsFile(String fileName) async {
  String jsonContent = await rootBundle.loadString("assets/json/$fileName.json");
  return json.decode(jsonContent);
}
import 'package:flutter/services.dart';

Future<String> _loadFromAsset(String jsonFilePath) async {
  return await rootBundle.loadString(jsonFilePath);
}

Future<String> getDataFromJsonFile(String jsonFilePath) async {
  String jsonString = await _loadFromAsset(jsonFilePath);
  // print(jsonString);
  return jsonString;
}

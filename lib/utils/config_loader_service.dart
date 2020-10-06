import 'dart:convert';

import 'package:flutter/services.dart';

class ConfigLoaderService {
  String configFilePath = "assets/config/config.json";
  
  getValue(String key) async {
    var configRaw = await this.loadAsset();
    var configMap = json.decode(configRaw) as Map<String, dynamic>;
    var configValue = (configMap[key] as String);
    if (configValue.isNotEmpty) {
      return configMap[key];
    } else {
      throw Exception("Given Key is not declared in $configFilePath");
    }
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString(configFilePath);
  }

  
}
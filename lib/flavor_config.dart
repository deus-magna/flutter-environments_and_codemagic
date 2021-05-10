import 'package:flutter/material.dart';
import 'package:flutter_environments_and_codemagic/utils/string_utils.dart';

enum Flavor { DEV, STAGE, PRODUCTION }

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  static FlavorConfig _instance;

  factory FlavorConfig({
    @required Flavor flavor,
    Color color: Colors.blue,
  }) {
    _instance ??= FlavorConfig._internal(
      flavor,
      StringUtils.enumName(flavor.toString()),
      color,
    );
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color);
  static FlavorConfig get instance {
    return _instance;
  }

  static bool isProduction() => _instance.flavor == Flavor.PRODUCTION;
  static bool isDevelopment() => _instance.flavor == Flavor.DEV;
  static bool isQA() => _instance.flavor == Flavor.STAGE;
}

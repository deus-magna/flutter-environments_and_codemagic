import 'package:flutter/material.dart';
import 'package:flutter_environments_and_codemagic/flavor_config.dart';
import 'package:flutter_environments_and_codemagic/main_common.dart';

Future<void> main() async {
  FlavorConfig(
    flavor: Flavor.STAGE,
    color: Colors.lightGreenAccent,
  );

  await mainCommon();
}

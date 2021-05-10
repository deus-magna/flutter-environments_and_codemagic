import 'package:flutter/material.dart';
import 'package:flutter_environments_and_codemagic/app.dart';
import 'package:flutter_environments_and_codemagic/config_reader.dart';
import 'package:flutter_environments_and_codemagic/flavor_config.dart';
import 'package:provider/provider.dart';

Future<void> mainCommon() async {
  // Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();
  // Load the JSON config into memory
  await ConfigReader.initialize();

  Color primaryColor;
  switch (FlavorConfig.instance.flavor) {
    case Flavor.DEV:
      primaryColor = Colors.blue;
      break;
    case Flavor.STAGE:
      primaryColor = Colors.green;
      break;
    case Flavor.PRODUCTION:
      primaryColor = Colors.red;
      break;
  }

  runApp(
    Provider.value(
      value: primaryColor,
      child: MyApp(),
    ),
  );
}

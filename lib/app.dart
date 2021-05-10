import 'package:flutter/material.dart';
import 'package:flutter_environments_and_codemagic/screens/home_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CI with Codemagic',
      theme: ThemeData(
        primarySwatch: Provider.of<Color>(context),
      ),
      home: HomeScreen(title: 'Flutter CI with Codemagic'),
    );
  }
}

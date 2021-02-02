import 'package:flutter_environments_and_codemagic/environment.dart';
import 'package:flutter_environments_and_codemagic/main_common.dart';

Future<void> main() async {
  await mainCommon(Environment.dev);
}

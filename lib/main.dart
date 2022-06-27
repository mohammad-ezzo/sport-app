import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sport_app/src/app.dart';
import 'package:sport_app/src/injections.dart';

const String fixturesBox = 'fixtures';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  await initInjection();

  runApp(const App());
}

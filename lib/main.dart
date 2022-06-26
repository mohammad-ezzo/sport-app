import 'package:flutter/material.dart';
import 'package:sport_app/src/app.dart';
import 'package:sport_app/src/injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();
  runApp(const App());
}

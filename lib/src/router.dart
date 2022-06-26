import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_app/src/features/fixtures/presentation/pages/fixtures_home_page.dart';

// screen router based on names..
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const FixturesHomePage());
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

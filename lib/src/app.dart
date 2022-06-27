import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/src/features/fixtures/presentation/bloc/fixture_bloc.dart';
import 'package:sport_app/src/injections.dart';
import 'package:sport_app/src/router.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FixtureBloc>(
      create: (context) => FixtureBloc(locator()),
      child: MaterialApp(
        theme: ThemeData.dark(),
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}

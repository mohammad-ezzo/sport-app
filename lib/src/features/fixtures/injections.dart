import 'package:hive_flutter/hive_flutter.dart';
import 'package:sport_app/src/features/fixtures/data/data_sources/fixtures_api.dart';
import 'package:sport_app/src/features/fixtures/data/data_sources/fixtures_shared_prefs.dart';
import 'package:sport_app/src/features/fixtures/data/repositories/fixtures_repo_empl.dart';
import 'package:sport_app/src/features/fixtures/domain/repositories/fixtures_repository.dart';
import 'package:sport_app/src/injections.dart';

injectFixture() async {
  locator.registerLazySingleton<FixturesApi>(() => FixturesApi());
  final fixtureHiveBox = await Hive.openBox<String>("fixturesBox");
  locator.registerLazySingleton<FixturesSharedPrefs>(
      () => FixturesSharedPrefs(locator(), fixtureHiveBox));
  locator.registerLazySingleton<FixturesRepository>(
      () => FixturesRepositoryImpl(locator(), locator()));
}

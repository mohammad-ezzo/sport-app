import 'package:sport_app/src/features/fixtures/data/data_sources/fixtures_api.dart';
import 'package:sport_app/src/features/fixtures/data/data_sources/fixtures_shared_prefs.dart';
import 'package:sport_app/src/features/fixtures/data/repositories/fixtures_repo_empl.dart';
import 'package:sport_app/src/features/fixtures/domain/repositories/fixtures_repository.dart';
import 'package:sport_app/src/service_locator.dart';

injectFixture() {
  locator.registerLazySingleton<FixturesApi>(() => FixturesApi());
  locator.registerLazySingleton<FixturesSharedPrefs>(
      () => FixturesSharedPrefs(locator()));
  locator.registerLazySingleton<FixturesRepository>(
      () => FixturesRepositoryImpl(locator(), locator()));
}

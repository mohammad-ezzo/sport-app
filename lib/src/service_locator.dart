import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_app/src/core/network/injections.dart';
import 'package:sport_app/src/features/fixtures/injections.dart';

import 'core/logger/app_logger.dart';

final locator = GetIt.instance;

initInjection() async {
  initRootLogger();
  injectNetwork();
  locator.registerFactoryAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  injectFixture();
}

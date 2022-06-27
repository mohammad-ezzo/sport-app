import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_app/src/core/utils/exceptions/exceptions.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/fixture.dart';

class FixturesSharedPrefs {
  final SharedPreferences _preferences;
  FixturesSharedPrefs(this._preferences, this.fixturesBox);
  final String _fixurecachdate = 'fixure_cach_date';
  final Box<String> fixturesBox;

  _setLastCachEntryDate() {
    _preferences.setString(_fixurecachdate, DateTime.now().toString());
  }

  String? getLastCachEntryDate() {
    return _preferences.getString(
      _fixurecachdate,
    );
  }

  setFixtures(List<Fixture> data) {
    _setLastCachEntryDate();
    fixturesBox.put("fixtures", json.encode(data));
  }

  List<Fixture> getFixtures() {
    try {
      final result = fixturesBox.get("fixtures");
      return Fixture.fromJsonList(jsonDecode(result!));
    } catch (e) {
      throw CacheException(e.toString());
    }
  }
}

import 'package:dio/dio.dart';
import 'package:sport_app/src/core/exceptions/exceptions.dart';
import 'package:sport_app/src/core/network/dio_error_handler.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/base_response.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/fixture.dart';
import 'package:sport_app/src/service_locator.dart';

class FixturesApi {
  Future<List<Fixture>> getFixtures() async {
    try {
      return (BaseReponse<List<Fixture>>.fromJson(
              (await locator<Dio>().get(
                "fixtures",
              ))
                  .data,
              Fixture.fromJsonList))
          .response!;
    } on DioError catch (e) {
      throw ServerException(handleDioError(e));
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

import 'package:dio/dio.dart';
import 'package:sport_app/src/core/exceptions/exceptions.dart';
import 'package:sport_app/src/core/network/dio_error_handler.dart';

class FixturesApi {
  Future<bool> getFixtures() async {
    try {
      throw UnimplementedError();
      // return Product.fromJson((await sl<Dio>().get(
      //   "api/posts/$id",
      // ))
      //     .data);
    } on DioError catch (e) {
      throw ServerException(handleDioError(e));
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

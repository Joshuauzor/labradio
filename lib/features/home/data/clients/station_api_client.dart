import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'station_api_client.g.dart';

@RestApi()
abstract class StationApiClient {
  factory StationApiClient(Dio dio, {String baseUrl}) = _StationApiClient;

  @GET('/radios/random')
  Future<HttpResponse<dynamic>> getStations({
    @Queries() required Map<String, dynamic> queries,
  });
}

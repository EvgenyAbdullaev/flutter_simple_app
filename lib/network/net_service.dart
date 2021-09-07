import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart' as http;
import 'dart:io';

import 'model_response.dart';
import 'model_converter.dart';
import 'net_models.dart';

part 'net_service.chopper.dart';

@ChopperApi()
abstract class NetService extends ChopperService {
  static const int _connectionTimeoutDuration = 8;

  @Get(path: 'all_coffee.json')
  Future<Response<Result<APIAllQuery>>> queryAllCoffee();

  static NetService create() {
    final client = ChopperClient(
      baseUrl: apiUrl,
      client: http.IOClient(
        HttpClient()..connectionTimeout = const Duration(
            seconds: _connectionTimeoutDuration
        ),
      ),
      interceptors: [HttpLoggingInterceptor()],
      converter: ModelConverter(),
      errorConverter: const JsonConverter(),
      services: [
        _$NetService(),
      ],
    );

    return _$NetService(client);
  }

}
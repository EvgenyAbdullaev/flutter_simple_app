// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'net_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$NetService extends NetService {
  _$NetService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = NetService;

  @override
  Future<Response<Result<APIAllQuery>>> queryAllCoffee() {
    final $url = 'all_coffee.json';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Result<APIAllQuery>, APIAllQuery>($request);
  }
}

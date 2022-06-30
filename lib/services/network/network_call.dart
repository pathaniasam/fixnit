import 'dart:convert';

import 'package:fixnit/services/network/network_service.dart';
import 'package:http/http.dart';


class NetworkCall extends INetworkService {
  NetworkCall({
    required Client client,
  }) : _client = client;

  final Client _client;

  static const _header = {'Content-Type': 'application/json'};

  @override
  Future get({
    required String path,
    Map<String, String>? header,
  }) async {
    final _response = await _client.get(
      Uri.parse(path),
      headers: _header,
    );
    if (_response.statusCode == 200) {
      return _response;
    } else {
      throw _response.body;
    }
  }

  @override
  Future<Response> post({
    required String path,
    required data,
    Map<String, String>? header,
  }) async {
    final _response = await _client.post(
      Uri.parse(path),
      headers: _header,
      body: jsonEncode(data),
    );
    if (_response.statusCode == 200) {
      return _response;
    } else {
      throw _response.body;
    }
  }
}

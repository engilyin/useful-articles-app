import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:useful_articles_app/commands/async_command.dart';
import 'package:http/http.dart' as http;
import 'package:useful_articles_app/exceptions/unauthorized_exception.dart';

abstract class AbstractHttpCommand<T> extends AsyncCommand {
  AbstractHttpCommand();

  String endpoint();

  void handleResponse(Map<String, dynamic> jsonDecode);

  Map<String, String> headers() {
    return {'Content-Type': 'application/json'};
  }

  Map<String, String> queryParams() {
    return {};
  }

  Future<Response> httpRequest(Uri endpointUrl);

  @override
  Future<void> execCommand() async {
    var prefs = await SharedPreferences.getInstance();

    var apiBase = prefs.getString('apiBase') ?? 'http://192.168.0.55:8080';

    var endpointUrl = Uri.parse('$apiBase${endpoint()}');

    if (queryParams().isNotEmpty) {
      endpointUrl = endpointUrl.replace(queryParameters: queryParams());
    }

    final response = await httpRequest(endpointUrl);

    if (response.statusCode == 200) {
      handleResponse(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      throw UnauthorizedException("Wrong credentials!");
    } else {
      throw Exception(
          'Unexpected error: ${response.statusCode}: ${response.body}');
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:useful_articles_app/exceptions/unauthorized_exception.dart';
import 'package:useful_articles_app/models/auth/login_response.dart';


class AuthApi {

  final String baseApi;

  AuthApi(this.baseApi);

  Future<LoginResponse> login(String username, String password) async {
    var endpointUrl = Uri.parse('$baseApi/auth/signin');

    final response = await http.get(endpointUrl);

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else if(response.statusCode == 401) {
      throw UnauthorizedException("Wrong credentials!");
    } else {
      throw Exception('Unexpected error: ${response.statusCode}: ${response.body}');
    }
  }
}


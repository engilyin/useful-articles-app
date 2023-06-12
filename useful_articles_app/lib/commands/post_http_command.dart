import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:useful_articles_app/commands/abstract_http_command.dart';

abstract class PostHttpCommand<T> extends AbstractHttpCommand {

  PostHttpCommand();

  Map<String, dynamic> body();

  @override
  Future<http.Response> httpRequest(Uri endpointUrl) {
    return http.post(endpointUrl, headers: headers(), body: jsonEncode(body()));
  }


}

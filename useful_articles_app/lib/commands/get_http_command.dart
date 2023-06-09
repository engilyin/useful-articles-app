import 'package:http/http.dart' as http;
import 'package:useful_articles_app/commands/abstract_http_command.dart';

abstract class GetHttpCommand<T> extends AbstractHttpCommand {

  GetHttpCommand(super.context);

  @override
  Future<http.Response> httpRequest(Uri endpointUrl) {
    return http.get(endpointUrl, headers: headers());
  }

}

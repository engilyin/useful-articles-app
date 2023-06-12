import 'package:provider/provider.dart';
import 'package:useful_articles_app/commands/post_http_command.dart';
import 'package:useful_articles_app/models/auth/login_request.dart';
import 'package:useful_articles_app/models/auth/login_response.dart';
import 'package:useful_articles_app/state/app_state_provider.dart';

class LoginCommand extends PostHttpCommand {

  final LoginRequest loginRequest;

  LoginCommand(this.loginRequest);

  @override
  String endpoint() {
    return '/auth/signin';
  }

  @override
  Map<String, dynamic> body() {
    return loginRequest.toJson();
  }

  @override
  void handleResponse(Map<String, dynamic> json) {
    var loginResponse = LoginResponse.fromJson(json);

  }

  @override
  String nextScreen() {
    return "/home";
  }
}
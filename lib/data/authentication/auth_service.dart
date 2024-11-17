import 'package:http/http.dart' as http;

import 'auth_endpoints.dart';

late String accessToken;
late String refreshToken;

class AuthService {
  Future<http.Response> getTokens() async {
    try {
      return await http.post(
        Uri.parse(AuthEndpoints.login),
        headers: {'content-type': 'application/json'},
        body: {
          //json body
        }
      );
    } on Exception catch (e) {
      throw Exception('Exception on getTokens: $e');
    } catch (e) {
      throw UnimplementedError('$e');
    }
  }
}
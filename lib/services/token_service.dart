import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:videocall/configuration/constants.dart';

class TokenService {
  /// Fetches a token from the configured token endpoint.
  /// Throws an [Exception] on non-200 or malformed responses.
  static Future<String> fetchToken({required String room, required String username}) async {
    final uri = Uri.parse('${Constants.TOKEN_ENDPOINT}?room=$room&username=$username');
    final resp = await http.get(uri);
    if (resp.statusCode != 200) {
      throw Exception('Failed to fetch token: ${resp.statusCode} ${resp.reasonPhrase}');
    }

    final data = jsonDecode(resp.body);
    if (data == null || data['token'] == null) {
      throw Exception('Invalid token response');
    }
    return data['token'] as String;
  }
}

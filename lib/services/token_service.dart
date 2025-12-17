import 'dart:convert';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:http/http.dart' as http;
import 'package:videocall/configuration/constants.dart';

class TokenService {
  /// Fetches a token from the configured token endpoint.
  /// Throws an [Exception] on non-200 or malformed responses.
  static Future<String> fetchToken({required String room, required String username}) async {

    final appCheckToken = await FirebaseAppCheck.instance.getToken();
    if (appCheckToken != null) {

      final uri = Uri.parse('${Constants.TOKEN_ENDPOINT}?room=$room&username=$username');
      final resp = await http.get(
        uri,
        headers: {'X-Firebase-AppCheck': appCheckToken},
      );

      if (resp.statusCode != 200) {
        throw Exception('Failed to fetch token: ${resp.statusCode} ${resp.reasonPhrase}');
      }

      final data = jsonDecode(resp.body);
      if (data == null || data['token'] == null) {
        throw Exception('Invalid token response');
      }
      return data['token'] as String;
    } else {
      throw Exception("Couldn't get an App Check token.");
    }
  }
}

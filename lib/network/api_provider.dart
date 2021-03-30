import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer' as developer;

class ApiProvider {
  String token;

  void setToken(String token) {
    this.token = token;
  }

  Future<dynamic> get(String url, {String token = '', dynamic query}) async {
    dynamic responseJson;
    try {
      final dynamic response = await http.get(Uri.parse(url), headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer ' + token,
        'api_key': "b2946522-3425-4baa-a206-2444df3af659", // hardcode key
      });
      responseJson = _response(response);
    } on SocketException {}
    developer.log('${responseJson.length}', name: 'responseJson');
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final dynamic responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
    }
  }
}
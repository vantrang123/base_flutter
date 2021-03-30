import 'package:flutter/foundation.dart';
import 'package:flutter_app/network/api_provider.dart';

class HomeApiProvider {
  HomeApiProvider({@required this.baseUrl, @required this.apiProvider}) : assert(apiProvider != null);

  final ApiProvider apiProvider;
  final String baseUrl;

  Future<Map<String, dynamic>> fetchData() {
    return apiProvider.get('$baseUrl/images/search');
  }
}
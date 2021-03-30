import 'package:flutter/foundation.dart';
import 'package:flutter_app/common/env.dart';
import 'package:flutter_app/models/cat.dart';
import 'package:flutter_app/network/api_provider.dart';
import 'package:flutter_app/ui/base/response.dart';
import 'dart:developer' as developer;

import 'home_api_provider.dart';

class HomeRepository {
  ApiProvider apiProvider;
  HomeApiProvider homeApiProvider;
  Env env;

  HomeRepository({@required this.apiProvider, @required this.env}) {
    homeApiProvider = HomeApiProvider(baseUrl: env.baseUrl, apiProvider: apiProvider);
  }

  Future<DataResponse<List<CatPhoto>>> fetchData() async {
    final response = await homeApiProvider.fetchData();
    developer.log('${response.length}', name: 'fetchData');
    /// should handle success
    return DataResponse.error("Error");
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/home_bloc/cat_bloc.dart';
import 'package:flutter_app/common/env.dart';
import 'package:flutter_app/network/api_provider.dart';
import 'package:flutter_app/ui/home/resource/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => CatBloc(
                  homeRepository: HomeRepository(
                      apiProvider: RepositoryProvider.of<ApiProvider>(context),
                      env: RepositoryProvider.of<Env>(context)
                  )
              )
          )
        ],
        child: Center(child: Text("Home Screen")));
  }
}
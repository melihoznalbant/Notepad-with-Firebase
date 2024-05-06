import 'package:dio/dio.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/domain/spor_repository.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/presentation/bloc/spors_bloc/spors_bloc.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/presentation/bloc/stream_bloc/stream_bloc.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/presentation/bloc/users_bloc/users_bloc.dart';
import 'package:get_it/get_it.dart';

import '../app/core/api_client.dart';
import '../app/data/repository/spor_repository_impl.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(Dio.new);
  locator.registerLazySingleton(SporsApiClient.new);
  locator.registerLazySingleton<SporsRepository>(SporsRepositoryImpl.new);
  locator.registerLazySingleton(SporsBloc.new);
  locator.registerLazySingleton(StreamBloc.new);
  locator.registerLazySingleton(UsersBloc.new);
}

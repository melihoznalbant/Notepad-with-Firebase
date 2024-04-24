import 'package:flutter_ui_api_bloc/data/spor_repository.dart';
import 'package:get_it/get_it.dart';

import 'data/api_client.dart';
import 'data/repository_implementetion.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<SporsRepository>(SporsRepositoryImpl.new);
  locator.registerLazySingleton<SporsApiClient>(() => SporsApiClient());
}

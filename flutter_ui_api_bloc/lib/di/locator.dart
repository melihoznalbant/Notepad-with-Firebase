import 'package:flutter_ui_api_bloc/app/features/authentications/domain/spor_repository.dart';
import 'package:get_it/get_it.dart';

import '../app/features/authentications/domain/api_client.dart';
import '../app/features/authentications/domain/repository_implementetion.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<SporsRepository>(SporsRepositoryImpl.new);
  locator.registerLazySingleton<SporsApiClient>(() => SporsApiClient());
}

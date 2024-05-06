import 'package:flutter_ui_api_bloc/app/features/authentications/domain/spor_repository.dart';

import '../../../di/locator.dart';
import '../models/spors.dart';
import '../../core/api_client.dart';

class SporsRepositoryImpl implements SporsRepository {
  SporsApiClient sporsApiClient = locator<SporsApiClient>();

  @override
  Future<Spors> getSpors(String league) async {
    return await sporsApiClient.fetchSpors(league);
  }
}

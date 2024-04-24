import 'package:flutter_ui_api_bloc/data/spor_repository.dart';

import '../locator.dart';
import '../models/spors.dart';
import 'api_client.dart';



class SporsRepositoryImpl implements SporsRepository {
  SporsApiClient sporsApiClient = locator<SporsApiClient>();
  
  @override
  Future<Spors> getSpors (String league) async{
    return await sporsApiClient.fetchSpors(league);
  }
}
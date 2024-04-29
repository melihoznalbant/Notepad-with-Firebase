import 'package:flutter_ui_api_bloc/app/features/authentications/domain/spor_repository.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/domain/models/spors.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'sport_repository_impl_mock.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('SporsApiClient', () {
    SporsRepository repository = SporsRepositoryImplMock();

    test('Model test', () async {
      final result = await repository.getSpors('tr');
      expect(result, isA<Spors>());
      expect(result.result[0]['team'], equals('Galatasaray'));
      expect(result.result[0]['goaldistance'], equals(53));
      expect(result.result[0]['goalagainst'], equals(20));
    });
  });
}

import 'dart:io';
import 'package:dio/dio.dart';
import 'models/spors.dart';

class SporsApiClient {
  Future<Spors> fetchSpors(String league) async {
    final dio = Dio();
    final response = await dio.get(
      "https://api.collectapi.com/sport/league?data.league=$league",
      options: Options(
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "apikey 6GkbxWYatfMXtfy7DSWtjb:58zgRBgHhjVjiwnq9qS9Fb",
        },
      ),
    );

    if (response.statusCode == 200) {
      return Spors.fromMap(response.data as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

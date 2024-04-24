import 'dart:convert';

import 'package:flutter_ui_api_bloc/data/spor_repository.dart';
import 'package:flutter_ui_api_bloc/models/spors.dart';

class SporsRepositoryImplMock implements SporsRepository {
  @override
  Future<Spors> getSpors(String league) async {
    return Spors.fromMap(jsonDecode('''
  {
    "result": [
        {
            "rank": 1,
            "draw": 3,
            "lose": 1,
            "win": 28,
            "play": 32,
            "point": 87,
            "goalfor": 73,
            "goalagainst": 20,
            "goaldistance": 53,
            "team": "Galatasaray"
        },
        {
            "rank": 2,
            "draw": 4,
            "lose": 1,
            "win": 27,
            "play": 32,
            "point": 85,
            "goalfor": 85,
            "goalagainst": 28,
            "goaldistance": 57,
            "team": "Fenerbahçe"
        },
        {
            "rank": 3,
            "draw": 4,
            "lose": 12,
            "win": 16,
            "play": 32,
            "point": 52,
            "goalfor": 54,
            "goalagainst": 42,
            "goaldistance": 12,
            "team": "Trabzonspor"
        },
        {
            "rank": 4,
            "draw": 6,
            "lose": 12,
            "win": 14,
            "play": 32,
            "point": 48,
            "goalfor": 42,
            "goalagainst": 38,
            "goaldistance": 4,
            "team": "Beşiktaş"
        },
        {
            "rank": 5,
            "draw": 6,
            "lose": 12,
            "win": 14,
            "play": 32,
            "point": 48,
            "goalfor": 43,
            "goalagainst": 47,
            "goaldistance": -4,
            "team": "Çaykur Rizespor"
        },
        {
            "rank": 6,
            "draw": 7,
            "lose": 12,
            "win": 13,
            "play": 32,
            "point": 46,
            "goalfor": 42,
            "goalagainst": 38,
            "goaldistance": 4,
            "team": "Rams Başakşehir"
        },
        {
            "rank": 7,
            "draw": 7,
            "lose": 12,
            "win": 13,
            "play": 32,
            "point": 46,
            "goalfor": 55,
            "goalagainst": 57,
            "goaldistance": -2,
            "team": "Kasımpaşa"
        },
        {
            "rank": 8,
            "draw": 11,
            "lose": 10,
            "win": 11,
            "play": 32,
            "point": 44,
            "goalfor": 38,
            "goalagainst": 43,
            "goaldistance": -5,
            "team": "EMS Yapı Sivasspor"
        },
        {
            "rank": 9,
            "draw": 12,
            "lose": 10,
            "win": 10,
            "play": 32,
            "point": 42,
            "goalfor": 36,
            "goalagainst": 37,
            "goaldistance": -1,
            "team": "Bitexen Antalyaspor"
        },
        {
            "rank": 10,
            "draw": 12,
            "lose": 10,
            "win": 10,
            "play": 32,
            "point": 42,
            "goalfor": 41,
            "goalagainst": 46,
            "goaldistance": -5,
            "team": "Corendon Alanyaspor"
        },
        {
            "rank": 11,
            "draw": 13,
            "lose": 10,
            "win": 9,
            "play": 32,
            "point": 40,
            "goalfor": 48,
            "goalagainst": 43,
            "goaldistance": 5,
            "team": "Yukatel Adana Demirspor"
        },
        {
            "rank": 12,
            "draw": 8,
            "lose": 14,
            "win": 10,
            "play": 32,
            "point": 38,
            "goalfor": 36,
            "goalagainst": 42,
            "goaldistance": -6,
            "team": "Yılport Samsunspor"
        },
        {
            "rank": 13,
            "draw": 13,
            "lose": 11,
            "win": 8,
            "play": 32,
            "point": 37,
            "goalfor": 40,
            "goalagainst": 41,
            "goaldistance": -1,
            "team": "MKE Ankaragücü"
        },
        {
            "rank": 14,
            "draw": 10,
            "lose": 12,
            "win": 10,
            "play": 32,
            "point": 37,
            "goalfor": 36,
            "goalagainst": 45,
            "goaldistance": -9,
            "team": "Mondihome Kayserispor"
        },
        {
            "rank": 15,
            "draw": 12,
            "lose": 12,
            "win": 8,
            "play": 32,
            "point": 36,
            "goalfor": 34,
            "goalagainst": 45,
            "goaldistance": -11,
            "team": "Tümosan Konyaspor"
        },
        {
            "rank": 16,
            "draw": 12,
            "lose": 13,
            "win": 7,
            "play": 32,
            "point": 33,
            "goalfor": 36,
            "goalagainst": 44,
            "goaldistance": -8,
            "team": "Atakaş Hatayspor"
        },
        {
            "rank": 17,
            "draw": 7,
            "lose": 17,
            "win": 8,
            "play": 32,
            "point": 31,
            "goalfor": 35,
            "goalagainst": 50,
            "goaldistance": -15,
            "team": "Gaziantep FK"
        },
        {
            "rank": 18,
            "draw": 9,
            "lose": 16,
            "win": 7,
            "play": 32,
            "point": 30,
            "goalfor": 35,
            "goalagainst": 41,
            "goaldistance": -6,
            "team": "VavaCars Fatih Karagümrük"
        },
        {
            "rank": 19,
            "draw": 9,
            "lose": 16,
            "win": 7,
            "play": 32,
            "point": 30,
            "goalfor": 36,
            "goalagainst": 64,
            "goaldistance": -28,
            "team": "Siltaş Yapı Pendikspor"
        },
        {
            "rank": 20,
            "draw": 7,
            "lose": 21,
            "win": 4,
            "play": 32,
            "point": 16,
            "goalfor": 25,
            "goalagainst": 59,
            "goaldistance": -34,
            "team": "İstanbulspor"
        }
    ],
    "success": true
}
 '''));
  }
}

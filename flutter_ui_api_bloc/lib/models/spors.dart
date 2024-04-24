
import 'dart:convert';

Spors sporsFromMap(String str) => Spors.fromMap(json.decode(str));

String sporsToMap(Spors data) => json.encode(data.toMap());

class Spors {
    final bool success;
    final List<dynamic> result;

    Spors({
        required this.success,
        required this.result,
    });

    factory Spors.fromMap(Map<String, dynamic> json) => Spors(
        success: json["success"],
        result: List<dynamic>.from(json["result"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "result": List<dynamic>.from(result.map((x) => x)),
    };
}

class ResultClass {
    final String rank;
    final String lose;
    final String win;
    final String play;
    final String point;
    final String team;

    ResultClass({
        required this.rank,
        required this.lose,
        required this.win,
        required this.play,
        required this.point,
        required this.team,
    });

    factory ResultClass.fromMap(Map<String, dynamic> json) => ResultClass(
        rank: json["rank"],
        lose: json["lose"],
        win: json["win"],
        play: json["play"],
        point: json["point"],
        team: json["team"],
    );

    Map<String, dynamic> toMap() => {
        "rank": rank,
        "lose": lose,
        "win": win,
        "play": play,
        "point": point,
        "team": team,
    };
}

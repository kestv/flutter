import 'dart:convert';
import 'package:flutter_app/classes/user.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_app/classes/tournament.dart';

class TournamentsService {
  //var endpoint = '192.168.0.59:57703';
  var endpoint = '10.0.2.2:57703';

  Future<List<Tournament>> getTournaments() async {
    var url = Uri.http(endpoint, '/api/Tournaments');
    var _response = await http.get(url);
    if (_response.statusCode == 200) {
      Iterable l = json.decode(_response.body);
      List<Tournament> _tournaments =
          List<Tournament>.from(l.map((model) => Tournament.fromJson(model)));
      return _tournaments;
    } else {
      throw Exception('Failed to fetch Tournaments');
    }
  }

  Future<List<Tournament>> getUserTournaments(int userId) async {
    var url = Uri.http(endpoint, '/api/Tournaments/User/$userId');
    var _response = await http.get(url);
    if (_response.statusCode == 200) {
      Iterable l = json.decode(_response.body);
      List<Tournament> _tournaments =
          List<Tournament>.from(l.map((model) => Tournament.fromJson(model)));
      return _tournaments;
    } else {
      throw Exception('Failed to fetch Tournaments');
    }
  }

  Future<bool> joinTournament(Tournament tournament, User user) async {
    user.joinedTournaments = [];
    user.joinedTournaments.add(tournament);

    var url =
        Uri.http(endpoint, '/api/Tournaments/join/${tournament.id}/${user.id}');
    var _response = await http.get(url, headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });
    if (_response.statusCode != 200) {
      return false;
    }
    return true;
  }

  Future<bool> leaveTournament(int tournamentId, int userId) async {
    var url =
        Uri.http(endpoint, '/api/Tournaments/leave/$tournamentId/$userId');
    var _response = await http.get(url);
    if (_response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<List<Tournament>> getOrganisedTournaments(int organiserId) async {
    var url = Uri.http(endpoint, '/api/Tournaments/organised/$organiserId');
    var _response = await http.get(url);
    if (_response.statusCode == 200) {
      Iterable l = json.decode(_response.body);
      List<Tournament> _tournaments =
          List<Tournament>.from(l.map((model) => Tournament.fromJson(model)));
      return _tournaments;
    } else {
      throw Exception('Failed to fetch Tournaments');
    }
  }

  Future<bool> addTournament(Tournament tournament) async {
    var url = Uri.http(endpoint, '/api/Tournaments');
    print(json.encode(tournament.toJson()));
    var _response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode(tournament.toJson()));
    if (_response.statusCode != 201) {
      return false;
    }
    return true;
  }
}

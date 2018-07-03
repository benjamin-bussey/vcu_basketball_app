import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import './ui/home.dart';

void main() async{
  List _newsData = await _getNewsData();
  List _coachData = await _getCoachData();
  List _playerData = await _getPlayerData();

  runApp(new MaterialApp(
    home: Home(_newsData, _coachData, _playerData),
  ));
}

Future<List> _getNewsData() async {
  String url = 'http://209.97.157.66/DATA/VCU/BASKETBALL/NEWS';

  http.Response response;
  response = await http.get(url);
  return json.decode(response.body);
}

 Future<List>_getCoachData() async {
  String url = 'http://209.97.157.66/DATA/VCU/BASKETBALL/COACHES';

  http.Response response;
  response = await http.get(url);
  return json.decode(response.body);
}

Future<List> _getPlayerData() async {
  String url = 'http://209.97.157.66/DATA/VCU/BASKETBALL/PLAYERS';

  http.Response response;
  response = await http.get(url);
  return json.decode(response.body);
}
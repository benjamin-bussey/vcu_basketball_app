import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Roster extends StatefulWidget {
  @override
  _RosterState createState() => _RosterState();
}

class _RosterState extends State<Roster> {
  List _data;

  @override
  void initState() async {
    _data = await _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double viewWidth = MediaQuery.of(context).size.width;
    double viewHeight = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: _data.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(5.0),
          ),
          margin: EdgeInsets.fromLTRB(viewWidth * .05, viewHeight * .015,
              viewWidth * .05, viewHeight * .015),
          child: Row(
            children: <Widget>[
              // Building player data column in the box
              Column(
                children: <Widget>[
                  Text(_data[index]['name']),
                  Text(_data[index]['number']),
                  Text(_data[index]['position']),
                  Text(_data[index]['height']),
                  Text(_data[index]['weight']),
                  Text(_data[index]['prevSchool']),
                  RaisedButton(onPressed: () => _openBio(_data[index]['bio']))
                ],
              ),
              Expanded(
                  //Building image from base url + json data
                  child: Image.network('')),
            ],
          ),
        );
      },
    );
  }

  //TODO Write method to open player bio
  _openBio(String bio) {
    //Create url to be launched

    //Use package to launch
  }
}

Future<List> _getData() async {
  String url = '';

  http.Response response = await http.get(url);
  return json.decode(response.body);
}

import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List _data;
  static const String BASE_URL = 'http://www.vcuathletics.com';

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
                  Text(_data[index]['title'], style: TextStyle(fontSize: 22.0),),
                  Text(_data[index]['date']),
                  RaisedButton(onPressed: () => _openBio(_data[index]['link']))
                ],
              ),
              Expanded(
                //Building image from base url + json data
                  child: Image.network('${BASE_URL + _data[index]['picture']}')),
            ],
          ),
        );
      },
    );
  }

  //TODO Write method to open player bio
  _openBio(String bio) async{
    //Create url to be launched
    var url = '${BASE_URL + bio}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open webpage';
    }
  }
}

Future<List> _getData() async {
  String url = '';

  http.Response response = await http.get(url);
  return json.decode(response.body);
}

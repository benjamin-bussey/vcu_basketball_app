import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';

class Coaches extends StatefulWidget {
  List coachData;
  Coaches(coachData){
    this.coachData = coachData;
  }

  @override
  _CoachesState createState() => _CoachesState(coachData);
}

class _CoachesState extends State<Coaches> {
  List _data;
  static const String BASE_URL = 'http://www.vcuathletics.com';

  _CoachesState(List coachData){
    _data = coachData;
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
            color: Color(0xFFFFB300),
            borderRadius: BorderRadius.circular(5.0),
          ),
          margin: EdgeInsets.fromLTRB(viewWidth * .05, viewHeight * .015,
              viewWidth * .05, viewHeight * .015),
          child: Row(
            children: <Widget>[
              // Building player data column in the box
              Column(
                children: <Widget>[
                  Text(_data[index]['name'], style: TextStyle(fontSize: 22.0),),
                  RaisedButton(onPressed: () => _openBio(_data[index]['bio']), child: Text('View Bio'),)
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

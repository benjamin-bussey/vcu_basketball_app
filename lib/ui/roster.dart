import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';

class Roster extends StatefulWidget {
  List playerData;

  Roster(playerData) {
    this.playerData = playerData;
  }

  @override
  _RosterState createState() => _RosterState(playerData);
}

class _RosterState extends State<Roster> {
  List _data;
  static const String BASE_URL = 'http://www.vcuathletics.com';

  _RosterState(List playerData) {
    _data = playerData;
  }

  @override
  Widget build(BuildContext context) {
    double viewWidth = MediaQuery.of(context).size.width;
    double viewHeight = MediaQuery.of(context).size.height;
    return Container(
      child: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => _openBio(_data[index]['bio']),
            child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFB300),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                margin: EdgeInsets.fromLTRB(viewWidth * .05, viewHeight * .015,
                    viewWidth * .05, viewHeight * .015),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.0,
                        left: 5.0,
                        right: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            _data[index]['name'],
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Text(' #${_data[index]['number']}'),
                          Text(' ${_data[index]['position']}'),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            // Building player data column in the box
                            child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, bottom: 5.0, right: 5.0),
                          child: Column(
                            children: <Widget>[
                              Text('Year: ${_data[index]['year']}', style: TextStyle(fontSize: 17.0),),
                              Row(
                                children: <Widget>[
                                  Text('HT: ${_data[index]['height']}'),
                                  Text(' WT: ${_data[index]['weight']}'),
                                ],
                              ),
                              Text(
                                _data[index]['prevSchool'],
                                style: TextStyle(fontSize: 13.0),
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        )),
                        Padding(
                          padding: EdgeInsets.only(right: 10.0, bottom: 10.0),
                          child: Image.network(
                            '${BASE_URL + _data[index]['picture']}',
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }

  _openBio(String bio) async {
    //Create url to be launched
    var url = '${BASE_URL + bio}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open webpage';
    }
  }
}

import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';

class News extends StatefulWidget {
  List newsData;
  News(List newsData){
    this.newsData = newsData;
  }

  @override
  _NewsState createState() => _NewsState(newsData);
}

class _NewsState extends State<News> {
  List _data;
  static const String BASE_URL = 'http://www.vcuathletics.com';

  _NewsState(List newsData){
   _data = newsData;
  }

  @override
  Widget build(BuildContext context) {
    double viewWidth = MediaQuery.of(context).size.width;
    double viewHeight = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: _data.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => _openURL(_data[index]['link']),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFB300),
              borderRadius: BorderRadius.circular(5.0),
            ),
            margin: EdgeInsets.fromLTRB(viewWidth * .05, viewHeight * .015,
                viewWidth * .05, viewHeight * .015),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(7.5),
                    child: Text(
                      _data[index]['date'],
                      style: TextStyle(
                        fontSize: 11.0,
                      ),
                    ),
                  ),
                ),
                Image.network(
                  '${BASE_URL + _data[index]['picture']}',
                  width: 200.0,
                  alignment: Alignment.center,
                ),
                Divider(color: Colors.black,),
                Padding(
                  padding: EdgeInsets.all(7.5),
                  child: Column(
                    children: <Widget>[
                      Text(
                        _data[index]['title'],
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _openURL(String link) async {
    //Create url to be launched
    var url = '${BASE_URL + link}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open webpage';
    }
  }
}

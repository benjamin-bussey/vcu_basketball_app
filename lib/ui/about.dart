import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Center(
          child: Text(
            'About',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
        Text(
            'The unofficial VCU Basketball app was created by Benjamin Bussey. '
            'This app has no affiliation to VCU or the Men\'s basketball team.'),
        Row(
          children: <Widget>[
            RaisedButton(
              color: Color(0xFFFFB300),
              onPressed: () async {
                var url = 'mailto:bbussey23@gmail.com';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not send email';
                }
              },
              child: Text('Report bug'),
            ),
            RaisedButton(
              color: Color(0xFFFFB300),
              onPressed: () async {
                //TODO Fill in github link to project
                var url = 'https://github.com/theBusBoy/vcu_basketball_app';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not open webpage';
                }
              },
              child: Text('View Source Code'),
            )
          ],
        ),
      ],
    );
  }
}

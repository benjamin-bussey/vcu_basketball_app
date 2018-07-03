import 'package:flutter/material.dart';
import '../ui/about.dart';
import '../ui/roster.dart';
import '../ui/coaches.dart';
import '../ui/news.dart';

class Home extends StatefulWidget {
  List newsData, coachData, playerData;
  Home(List newsData, List coachData, List playerData){
    this.newsData = newsData;
    this.coachData = coachData;
    this.playerData = playerData;
  }

  @override
  _HomeState createState() => _HomeState(newsData, coachData, playerData);
}

class _HomeState extends State<Home> {
  int _currentTab = 0;
  About about;
  Roster roster;
  Coaches coaches;
  News news;
  List<Widget> pages;
  Widget currentPage;

  _HomeState(newsData, coachData, playerData){
    about = About();
    roster = Roster(playerData);
    coaches = Coaches(coachData);
    news = News(newsData);

    pages = [news, roster, coaches, about];
    currentPage = news;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VCU Basketball', style: TextStyle(color: Color(0xFFFFB300)),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: currentPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: _currentTab,
          onTap: (int index) {
            setState(() {
              _currentTab = index;
              currentPage = pages[index];
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.library_books,
                color: Colors.black,
              ),
              title: Text(
                'News',
                style: TextStyle(color: Colors.black),
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.people,
                  color: Colors.black,
                ),
                title: Text(
                  'Roster',
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.face,
                  color: Colors.black,
                ),
                title: Text(
                  'Coaches',
                  style: TextStyle(color: Colors.black),
                )),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info_outline,
                color: Colors.black,
              ),
              title: Text(
                'About',
                style: TextStyle(color: Colors.black),
              ),),
          ]),
    );
  }
}

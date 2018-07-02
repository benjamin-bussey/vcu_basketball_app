import 'package:flutter/material.dart';
import '../ui/about.dart';
import '../ui/roster.dart';
import '../ui/coaches.dart';
import '../ui/news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTab = 0;
  About about;
  Roster roster;
  Coaches coaches;
  News news;
  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    about = About();
    roster = Roster();
    coaches = Coaches();
    news = News();

    pages = [news, roster, coaches, about];
    currentPage = about;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VCU Basketball'),
        centerTitle: true,
        backgroundColor: Color(0xFFFFB300),
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
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), title: Text('Roster')),
            BottomNavigationBarItem(
                icon: Icon(Icons.face), title: Text('Coaches')),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              title: Text('News'),
            )
          ]),
    );
  }
}

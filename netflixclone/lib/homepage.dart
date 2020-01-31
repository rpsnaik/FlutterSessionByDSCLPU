import 'package:flutter/material.dart';
import 'package:netflixclone/homecontent.dart';
import 'package:netflixclone/profilePage.dart';
import 'package:netflixclone/searchPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currIndex = 0;
  List pages = [HomeContentPage(), SearchPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.red,
        onTap: (int i){
          setState(() {
            currIndex = i;
          });
        },
        currentIndex: currIndex,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            title: Text("Search"),
            icon: Icon(Icons.search)
          ),
          BottomNavigationBarItem(
            title: Text("Profile"),
            icon: Icon(Icons.person)
          ),
        ],
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: <Widget>[
            Image.asset("./assets/netflixLogo.png", width: 100.0,),
            Text("NETFLIX")
          ],
        ),
      ),
      body: pages[currIndex],
    );
  }
}
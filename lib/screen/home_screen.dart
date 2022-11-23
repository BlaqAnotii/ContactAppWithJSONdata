import 'package:contactapp/widgets/favorite_widgets.dart';
import 'package:contactapp/widgets/home_widgets.dart';
import 'package:contactapp/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int _selectedIndex = 0;
  static final List _widgetOption = <Widget>[
    const HomeWidget(),
    const FavoriteWidget(),
    const ProfileWidget(),
  ];
  static final List _titleOption = <Widget>[
    const Text("Contacts", style: TextStyle(fontFamily: "Poppins",fontSize: 25,color: Colors.white),),
    const Text("Favorites", style: TextStyle(fontFamily: "Poppins",fontSize: 25,color: Colors.white),),
     const Text("Profile", style: TextStyle(fontFamily: "Poppins",fontSize: 25,color: Colors.white),)
];
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 6, 67, 95),
          centerTitle: false,
          title: _titleOption.elementAt(_selectedIndex),
        ),
        body: _widgetOption.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.lightBlueAccent,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorites"),
                 BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Profile"),
          ],
        ));
  }
}
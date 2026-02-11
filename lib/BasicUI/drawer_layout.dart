import 'package:flutter/material.dart';
import 'package:ui_flutter/common/Logger.dart';

class DrawerLayoutCustom extends StatefulWidget {
  const DrawerLayoutCustom({super.key});

  @override
  State<DrawerLayoutCustom> createState() => _DrawerLayoutCustomState();
}

class _DrawerLayoutCustomState extends State<DrawerLayoutCustom> {
  @override
  Widget build(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'Profile',
      'Settings',
      'About',
      'Home',
      'Profile',
      'Settings',
      'About',
      'Settings',
      'About',
      'Home',
      'Profile',
      'Settings',
      'About',
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        iconTheme: IconThemeData(color: Colors.white), //mau sac cua icon
        centerTitle: true,
        //neu muon them cac icon o ben phai
        actions: [
          IconButton(
            onPressed: () {
              Logger.logTest(tag: 'Clicked', msg: 'Clicked share data');
            },
            icon: Icon(Icons.share, color: Colors.white),
          ),
        ],
        title: Text(
          'DrawerLayout',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(10),
        child: Center(child: Text('hoamz')),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              //header
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                // height: 150,
                color: Colors.pinkAccent,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 60, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/logo.jpg'),
                      ),
                      SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'hoamz',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'mobile dev',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //menu item
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(menuTitles.length, (index) {
                    return Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        vertical: 6,
                        horizontal: 8,
                      ),
                      child: menu_item(menuTitles[index], context),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Card menu_item(String menuName, BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      child: ListTile(
        title: Text(
          menuName,
          style: TextStyle(fontSize: 13, color: Colors.black),
        ),
        leading: Icon(Icons.star, color: Colors.pinkAccent),
        onTap: () {
          Navigator.pop(context); //dong navigation drawer
        },
      ),
    );
  }
}

/*
appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu, color: Colors.white),
            );
          },
        ),

*/

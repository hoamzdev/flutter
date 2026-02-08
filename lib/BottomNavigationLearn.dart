// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ui_flutter/AlertDialogLearn.dart';
import 'package:ui_flutter/BottomSheetLearn.dart';
import 'package:ui_flutter/image_view.dart';

class BottomNavigationLearn extends StatefulWidget {
  const BottomNavigationLearn({super.key});

  @override
  State<BottomNavigationLearn> createState() => _BottomNavigationLearnState();
}

class _BottomNavigationLearnState extends State<BottomNavigationLearn> {
  int _selectedIndex = 0;

  final List<String> listScreen = ['Home', 'Search', 'Share'];
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Center(
          child: PageView(
            controller: _controller,
            children: [
              AlertDialogLearn(),
              ImageViewWidgetLearn(),
              BottomSheetlearn(),
            ],
            onPageChanged: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
          ),
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          indicatorColor: Colors.transparent,
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(color: Colors.pink);
            }
            return IconThemeData(color: Colors.black);
          }),
        ),

        child: NavigationBar(
          destinations: const <NavigationDestination>[
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
            NavigationDestination(icon: Icon(Icons.share), label: 'Share'),
          ],
          selectedIndex: _selectedIndex,
          elevation: 2.0,
          onDestinationSelected: (value) {
            setState(() {
              _selectedIndex = value;
              _controller.jumpToPage(value);
            });
          },
        ),
      ),
    );
  }
}

/*
bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: 'Share'),
        ],
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
*/

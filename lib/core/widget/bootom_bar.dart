import 'package:book_app/features/home/presentation/View/home_view.dart';
import 'package:book_app/features/profile/presentation/view/profile_view.dart';
import 'package:book_app/features/search/presentation/view/search_view.dart';

import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  change_item(int value) {
    print(value);
    setState(() {
      currentIndex = value;
    });
  }

  List pages = [
    const HomeView(),
    const SearchView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        backgroundColor: const Color(0xff100B20),
        currentIndex: currentIndex,
        onTap: change_item,
        selectedItemColor: const Color(0xffEF8262),
        unselectedItemColor: Colors.white,
      ),
    );
  }
}

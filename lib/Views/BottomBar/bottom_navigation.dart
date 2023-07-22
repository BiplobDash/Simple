import 'package:better_half/Views/BottomBar/bottom_nav_provider.dart';
import 'package:better_half/Views/BottomBar/home.dart';
import 'package:better_half/Views/BottomBar/profile.dart';
import 'package:better_half/Views/BottomBar/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  final List<Widget> _tabs = [
    HomeTab(),
    SearchTab(),
    ProfileTab(),
  ];
  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomNavigationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar Example'),
      ),
      body: Consumer<BottomNavigationProvider>(
        builder: (context, provider, _) {
          return _tabs[provider.currentIndex];
        },
      ),
      bottomNavigationBar: Consumer<BottomNavigationProvider>(
        builder: (context, provider, _) {
          return BottomNavigationBar(
            currentIndex: provider.currentIndex,
            onTap: (index) {
              provider.updateIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}

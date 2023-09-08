import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:qr_scan/presentation/screens/main_screen.dart';
import 'package:qr_scan/presentation/widgets/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TabsScreen();
}

class _TabsScreen extends State<TabsScreen> {
  //for bottom navigation tab
  int _selectedTabIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  MaterialColor? getIconColor(int tabIndex) {
    return _selectedTabIndex == tabIndex ? Colors.blue : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const MainScreen();

    switch (_selectedTabIndex) {
      case 0:
        activePage = const MainScreen();
        break;
      case 1:
        activePage = const MainScreen();

        break;
      default:
        activePage = const MainScreen();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        // Avatar icon using leading
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(12, 1, 0, 1),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent, // transparent background
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/icons/avatar.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),

        // Name text using title
        title: const Text(
          'Person Name',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        // Ring icon on the right using actions
        actions: const [
          Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          SizedBox(
              width: 8.0), // For some spacing between the icon and the edge
        ],
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _selectPage,
          currentIndex: _selectedTabIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/union.svg',
                  height: 25, width: 25, color: getIconColor(0)),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/shopping.svg',
                  height: 25, width: 25, color: getIconColor(1)),
              label: 'Покупки',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/wallet.svg',
                  height: 25, width: 25, color: getIconColor(2)),
              label: 'Платежи',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/chat.svg',
                  height: 25, width: 25, color: getIconColor(3)),
              label: 'Чат',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/union.svg',
                  height: 25, width: 25, color: getIconColor(4)),
              label: 'Бонусы',
            ),
          ]),
    );
  }
}

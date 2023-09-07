import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text('test'),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _selectPage,
          currentIndex: _selectedTabIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home), // A built-in Flutter icon
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop), // A built-in Flutter icon
              label: 'Покупки',
            ),
            BottomNavigationBarItem(
              icon:
                  Icon(Icons.account_balance_wallet), // A built-in Flutter icon
              label: 'Платежи',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.textsms_rounded), // A built-in Flutter icon
              label: 'Чат',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.redeem_rounded), // A built-in Flutter icon
              label: 'Бонусы',
            ),
          ]),
    );
  }
}

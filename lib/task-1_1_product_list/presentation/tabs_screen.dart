import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'cheque_screen.dart';
import 'empty_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 3;
  // bool _isBottomSheetVisible = true;

  final List<Widget> _pages = const [
    EmptyScreen(),
    EmptyScreen(),
    EmptyScreen(),
    ChequeScreen(id: 56),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: SizedBox(
        height: 83,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon:
                    SvgPicture.asset('assets/images/shopping_list/catalog.svg'),
                label: "Каталог"),
            BottomNavigationBarItem(
                icon:
                    SvgPicture.asset('assets/images/shopping_list/search.svg'),
                label: "Поиск"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                    'assets/images/shopping_list/shopping_card.svg'),
                label: "Корзина"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/shopping_list/person_outline.svg',
                ),
                label: "Личное"),
          ],
          selectedFontSize: 10,
          iconSize: 24,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../models/meal.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritedMeals;

  TabsScreen(this.favoritedMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIdx = 0;

  @override
  void initState() {
    _pages = [
      {
        'tab': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'tab': FavoritesScreen(widget.favoritedMeals),
        'title': 'Your Favorites',
      },
    ];
    super.initState();
  }

  void _selectPage(int idx) {
    setState(() {
      _selectedPageIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIdx]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIdx]['tab'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIdx,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

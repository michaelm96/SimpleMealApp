import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilter;

  FiltersScreen(
    this.currentFilter,
    this.saveFilters,
  );
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilter['gluten'];
    _lactoseFree = widget.currentFilter['lactose'];
    _vegan = widget.currentFilter['vegan'];
    _vegetarian = widget.currentFilter['vegetarian'];
    super.initState();
  }

  Widget _switcherListTile(bool boolean, String txt, Function updateValue) {
    return SwitchListTile(
      value: boolean,
      onChanged: updateValue,
      title: Text(txt),
      subtitle: Text('Only include $txt meals'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () {
            final selectedFilters = {
              'gluten': _glutenFree,
              'vegetarian': _vegetarian,
              'vegan': _vegan,
              'lactose': _lactoseFree,
            };
            widget.saveFilters(selectedFilters);
          },
        ),
      ]),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _switcherListTile(_glutenFree, 'Gluten Free', (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _switcherListTile(_vegetarian, 'Vegetarian', (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              _switcherListTile(_vegan, 'Vegan', (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
              _switcherListTile(_lactoseFree, 'Lactose Free', (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}

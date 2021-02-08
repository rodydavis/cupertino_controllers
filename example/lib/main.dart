import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tabs/master_detail_controller.dart';

import 'tabs/table_view_controller.dart';

import 'package:flutter/foundation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoControllersApp(),
    );
  }
}

class CupertinoControllersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text("Table"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers),
            title: Text("Mater Detail"),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        final pages = [
          _Page(title: "Table View", child: TableViewScreen()),
          _Page(title: "Master Detail", child: MasterDetailScreen()),
        ];
        return CupertinoTabView(
          builder: (BuildContext context) {
            return pages[index]?.child;
          },
          defaultTitle: pages[index]?.title,
        );
        ;
      },
    );
  }
}

class _Page {
  final Widget child;
  final String title;

  _Page({
    this.title,
    this.child,
  });
}

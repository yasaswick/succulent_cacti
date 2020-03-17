import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:succulentcactus/db/firebasedb.dart';
import 'package:succulentcactus/model/succulent.dart';
import 'package:succulentcactus/widgets/succulent_grid.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Firebasedb _firebasedb = Firebasedb();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Succulent>>.value(
          value: _firebasedb.succulentList(),
          child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.info))
          ],), 
        tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
        builder: (BuildContext context) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
            middle: Text('Page 1 of tab $index'),
            ),
            child: Center(
              child: CupertinoButton(
                child: const Text('Next page'),
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute<void>(
                      builder: (BuildContext context) {
                        return CupertinoPageScaffold(
                          navigationBar: CupertinoNavigationBar(
                            middle: Text('Page 2 of tab $index'),
                          ),
                          child: SucculentGrid()
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          );
        },
      );
  },),
    );
      
  }
}
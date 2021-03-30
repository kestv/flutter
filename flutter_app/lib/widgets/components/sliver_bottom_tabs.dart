import 'package:flutter/material.dart';

class SliverBottomTabs {
  static PreferredSize getTabs() {
    return PreferredSize(
      preferredSize: Size(0, 50),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: TabBar(
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                25.0,
              ),
              color: Colors.lightBlue),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          tabs: [
            Tab(icon: Icon(Icons.apps)),
            Tab(icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}

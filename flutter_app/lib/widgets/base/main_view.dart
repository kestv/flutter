import 'package:flutter/material.dart';
import 'package:flutter_app/static/user_info.dart';
import 'package:flutter_app/views/home_page.dart';
import 'package:flutter_app/widgets/components/drawer/drawer_tile.dart';
import 'package:flutter_app/widgets/components/profile/top_container.dart';
import 'package:flutter_app/widgets/components/tournaments/organiser/tournaments_view.dart';

class MainView extends StatefulWidget {
  final Widget widget;
  final PreferredSize bottom;
  MainView({this.widget, this.bottom});
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [
                  SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: SliverAppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 50,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Stack(children: [
                              TopContainer(),
                            ]),
                          ),
                          pinned: true,
                          expandedHeight: 150 +
                              (widget.bottom != null
                                  ? widget.bottom.preferredSize.height
                                  : 0.0),
                          bottom: widget.bottom ??
                              PreferredSize(
                                  child: Container(),
                                  preferredSize: Size(0, 0))))
                ];
              },
              body: Padding(
                  padding: EdgeInsets.only(
                      top: 80 +
                          (widget.bottom != null
                              ? widget.bottom.preferredSize.height
                              : 0.0)),
                  child: widget.widget))),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
                height: 100,
                child: DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Drawer Header',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.lightBlue,
                      Colors.blue,
                      Colors.deepPurple,
                    ],
                  )),
                )),
            DrawerTile(
              widget: HomePage(),
              icon: Icons.emoji_events,
              name: 'Tournaments',
            ),
            Divider(),
            UserInfo.user.isOrganiser
                ? DrawerTile(
                    widget: MyTournamentsView(),
                    icon: Icons.person_pin,
                    name: 'My Tournaments',
                  )
                : Container(),
            DrawerTile(
              widget: HomePage(),
              icon: Icons.person,
              name: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

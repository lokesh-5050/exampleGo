// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// This sample app shows an app with two screens.
///
/// The first route '/' is mapped to [HomeScreen], and the second route
/// '/details' is mapped to [DetailsScreen].
///
/// The buttons use context.go() to navigate to each destination. On mobile
/// devices, each destination is deep-linkable and on the web, can be navigated
/// to using the address bar.
void main() => runApp(const MyApp());

/// The route configuration.
final GoRouter _router = GoRouter(
  initialLocation: '/home1',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(branches: [
      StatefulShellBranch(routes: [
        GoRoute(path: '/home1',builder: (context, state) => Home1(),)
      ]),
      StatefulShellBranch(routes: [
        GoRoute(path: '/home2',builder: (context, state) => Home2())
      ]),
    ],

    builder: (context, state, navigationShell) => HomeDashBoard(child: navigationShell),

    ),


  ],
);

/// The main app.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

/// The home dashboard
class HomeDashBoard extends StatefulWidget {
  final StatefulNavigationShell? child;
   HomeDashBoard({super.key,this.child});

  @override
  State<HomeDashBoard> createState() => _HomeDashBoardState();
}

class _HomeDashBoardState extends State<HomeDashBoard> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard"),),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          if(value == 0){
            setState(() {
              index = value;
            });
            widget.child!.goBranch(0);
          }else{
            setState(() {
              index=value;
            });
          widget.child!.goBranch(1);

          }
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.add),label: "Home1"),
        BottomNavigationBarItem(icon: Icon(Icons.dangerous_sharp),label: "Home2"),
      ]),
    );
  }
}

//HomeScreen1
class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) => ListTile(title: Text("Home1")),);
  }
}

//Homescreen2
class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) => ListTile(title: Text("Home2")),);
  }
}

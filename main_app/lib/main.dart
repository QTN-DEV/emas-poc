import 'package:flutter/material.dart';
import 'package:main_app/pages/home.dart';
import 'package:main_app/pages/info.dart';

void main() {
  runApp(const BruneiSuperApp());
}

class BruneiSuperApp extends StatelessWidget {
  const BruneiSuperApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brunei Super App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: BNMainTabContainer(),
    );
  }
}

class BNMainTabContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BNMainTabContainerState();
}

class BNMainTabContainerState extends State<BNMainTabContainer> with TickerProviderStateMixin {
  List<Widget> pages = [
    BNHomePage(),
    BNInfoPage(),
    BNHomePage(),
    BNHomePage(),
    BNHomePage(),
  ];
  List<NavigationDestination> tabs = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      label: "Utama",
    ),
    NavigationDestination(
      icon: Icon(Icons.newspaper_outlined),
      label: "Maklumat",
    ),
    NavigationDestination(
      icon: Icon(Icons.home),
      label: "TD123",
    ),
    NavigationDestination(
      icon: Icon(Icons.history_outlined),
      label: "Transaksi",
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outlined),
      label: "Akaun",
    ),
  ];
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[tabIndex],
      bottomNavigationBar: NavigationBar(
        destinations: tabs,
        selectedIndex: tabIndex,
        onDestinationSelected: (int newIndex) {
          tabIndex = newIndex;
          setState(() {});
        },
      ),
    );
  }
}
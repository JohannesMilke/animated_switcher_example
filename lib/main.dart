import 'package:animated_switcher_example/page/animated_switcher_basic_page.dart';
import 'package:animated_switcher_example/page/animated_switcher_advanced_page.dart';
import 'package:animated_switcher_example/page/animated_switcher_icon_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Animated Switcher';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          primarySwatch: Colors.teal,
        ),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 2;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: buildPages(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Text('AnimatedSwitcher'),
              title: Text('Basic'),
            ),
            BottomNavigationBarItem(
              icon: Text('AnimatedSwitcher'),
              title: Text('Advanced'),
            ),
            BottomNavigationBarItem(
              icon: Text('AnimatedSwitcher'),
              title: Text('Transform'),
            ),
          ],
          onTap: (int index) => setState(() => this.index = index),
        ),
      );

  Widget buildPages() {
    switch (index) {
      case 0:
        return AnimatedSwitcherBasicPage();
      case 1:
        return AnimatedSwitcherAdvancedPage();
      case 2:
        return AnimatedSwitcherIconPage();
      default:
        return Container();
    }
  }
}

import 'package:animated_switcher_example/main.dart';
import 'package:flutter/material.dart';

class AnimatedSwitcherIconPage extends StatefulWidget {
  @override
  _AnimatedSwitcherIconPageState createState() =>
      _AnimatedSwitcherIconPageState();
}

class _AnimatedSwitcherIconPageState extends State<AnimatedSwitcherIconPage> {
  bool flag = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        body: Stack(
          children: [
            Image.asset('assets/photo3.jpg', fit: BoxFit.cover),
            buildPlay(),
          ],
        ),
      );

  Widget buildPlay() => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() => flag = !flag),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 1500),
          child: flag
              ? Container(key: Key('1'), color: Colors.red.withOpacity(0.3))
              : Container(
                  key: Key('2'),
                  color: Colors.blue.withOpacity(0.3),
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
      );
}

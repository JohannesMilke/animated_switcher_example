import 'package:animated_switcher_example/main.dart';
import 'package:flutter/material.dart';

class AnimatedSwitcherBasicPage extends StatefulWidget {
  @override
  _AnimatedSwitcherBasicPageState createState() =>
      _AnimatedSwitcherBasicPageState();
}

class _AnimatedSwitcherBasicPageState extends State<AnimatedSwitcherBasicPage> {
  bool flag = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        body: Center(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 1500),
            child: flag
                ? Container(
                    key: Key('1'),
                    color: Colors.orange,
                    width: 200,
                    height: 200,
                  )
                : Container(
                    key: Key('2'),
                    color: Colors.blue,
                    width: 200,
                    height: 200,
                  ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward_ios),
          onPressed: () => setState(() => flag = !flag),
        ),
      );
}

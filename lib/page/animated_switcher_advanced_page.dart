import 'package:animated_switcher_example/main.dart';
import 'package:flutter/material.dart';

class AnimatedSwitcherAdvancedPage extends StatefulWidget {
  @override
  _AnimatedSwitcherAdvancedPageState createState() =>
      _AnimatedSwitcherAdvancedPageState();
}

class _AnimatedSwitcherAdvancedPageState
    extends State<AnimatedSwitcherAdvancedPage> {
  int index = 0;

  final widgets = [
    Image.asset('assets/photo1.jpg', fit: BoxFit.cover, key: Key('1')),
    Image.asset('assets/photo2.jpg', fit: BoxFit.cover, key: Key('2')),
    Image.asset('assets/photo3.jpg', fit: BoxFit.cover, key: Key('3')),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        body: Center(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 2000),
            reverseDuration: Duration(milliseconds: 5000),
            transitionBuilder: (child, animation) => ScaleTransition(
              child: SizedBox.expand(child: child),
              scale: animation,
            ),
            // switchInCurve: Curves.bounceIn,
            // switchOutCurve: Curves.bounceOut,
            // switchInCurve: Curves.easeIn,
            // switchOutCurve: Curves.easeOut,
            child: widgets[index],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward_ios),
          onPressed: () {
            final isLastIndex = index == widgets.length - 1;

            setState(() => index = isLastIndex ? 0 : index + 1);
          },
        ),
      );
}

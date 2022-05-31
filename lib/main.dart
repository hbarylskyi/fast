import 'package:fast/FastSettingsState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'FastSettingsState.dart';
import 'FastingScreen.dart';
import 'SetupScreen.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (_) => FastSettingsState(), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(initialPage: 0);
    final pageView = PageView(
      children: [FastingScreen(), SetupScreen()],
      onPageChanged: (page) => {
        if (page == 1) {context.read<FastSettingsState>().swipedRight()}
      },
      controller: pageController,
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.hardEdge,
      pageSnapping: true,
      physics: const ClampingScrollPhysics(),
    );

    return MaterialApp(
      home: pageView,
    );
  }
}

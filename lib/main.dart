import 'package:flutter/material.dart';
import 'package:sample_animation/screens/date_selection_screen.dart';
import 'package:sample_animation/utils/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Styles.themeData(context),
      home: const DateSelectionScreen(),
    );
  }
}

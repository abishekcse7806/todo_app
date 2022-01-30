import 'package:flutter/material.dart';

import 'constants/colors.dart';
import 'constants/navigation.dart';
import 'constants/strings.dart';
import 'constants/themes.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kTextToDoApp,
      color: kprimaryColor,
      theme: lightTheme,
      darkTheme: lightTheme,
      routes: routes,
      initialRoute: activePageID,
      debugShowCheckedModeBanner: false,
    );
  }
}

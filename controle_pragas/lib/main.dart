import 'package:controle_pragas/theme.dart';
import 'package:flutter/material.dart';

import 'app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.theme,
      home: HomePage(),
    );
  }
}


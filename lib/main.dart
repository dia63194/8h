import 'package:flutter/material.dart';
import 'theme.dart';
import 'router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Site_Project',
      theme: mainTheme,
      routes: routes,
    );
  }
}

void main() {
  runApp(MyApp());
}

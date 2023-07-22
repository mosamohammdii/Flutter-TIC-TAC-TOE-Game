import 'package:flutter/material.dart';
import 'package:flutter_application/screens/home_page.dart';

import 'screens/quiz_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "bykan"),
      home: Scaffold(
        
        body: QizePage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:newsapp/views/country_selection.dart';
import 'package:newsapp/views/sign_in.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: SignIn(),
    );
  }
}


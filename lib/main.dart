import 'package:flutter/material.dart';
import 'package:grocery_app/login_page.dart';

void main() {
  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery App',
      // ignore: prefer_const_constructors
      home: LoginPage(),
    );
  }

  
}



import 'package:flutter/material.dart';
import 'package:flutter_shopping_bloc_tutorial/Home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.teal,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

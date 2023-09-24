import 'package:flutter/material.dart';
import 'package:yogapractice/drawer.dart';
import 'package:yogapractice/views/home.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home()
    );
  }
}



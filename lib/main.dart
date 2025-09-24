import 'package:flutter/material.dart';
import 'views/selection_screen.dart';

void main() {
  runApp(const FatecApp());
}

class FatecApp extends StatelessWidget {
  const FatecApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fatec Acesso',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SelectionScreen(),
    );
  }
}

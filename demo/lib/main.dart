import 'package:demo/presentation/screen/home_screen.dart';
import 'package:demo/presentation/screen/main_screen.dart';
import 'package:demo/presentation/widget/popular_books.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book-Booking',
      home: SafeArea(
        child: Scaffold(
          body: MainScreen(),
        ),
      ),
    );
  }
  
}
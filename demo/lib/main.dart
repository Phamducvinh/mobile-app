import 'package:book_booking/models/books.dart';
import 'package:book_booking/presentation/screen/details/detail_page.dart';
import 'package:book_booking/presentation/screen/home/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     List<Books> popularBooks = Books.generatePopularBooks();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book-Booking',
      home: SafeArea(
        child: Scaffold(
          // body: MainScreen(),
          body: DetailPage(books: popularBooks[0]),
        ),
      ),
    );
  }
}
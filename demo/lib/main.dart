import 'package:book_booking/app/constants/constants.dart';
import 'package:book_booking/app/notifier/app_notifier.dart';
import 'package:book_booking/models/books.dart';
import 'package:book_booking/presentation/screen/details/detail_page.dart';
import 'package:book_booking/presentation/screen/home/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppNotifier())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: textTheme),
        title: 'Book-Booking',
        home: const SafeArea(
          child: Scaffold(
            body: MainScreen(),
            // body: DetailPage(books: popularBooks[0]),
            // body: SignInScreen()
          ),
        ),
      ),
    );
  }
}
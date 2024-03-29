import 'package:book_booking/app/constants/constants.dart';
import 'package:book_booking/app/notifier/app_notifier.dart';
import 'package:book_booking/models/books.dart';
import 'package:book_booking/presentation/screen/details/detail_page.dart';
import 'package:book_booking/presentation/screen/home/main_screen.dart';
import 'package:book_booking/presentation/screen/login_screen/signin.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("wishListId");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AppNotifier())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: textTheme),
        title: 'Book-Booking',
        home: const SafeArea(
          child: Scaffold(
            //body: MainScreen(),
            // body: DetailPage(books: popularBooks[0]),
            body: LoginScreen(),
          ),
        ),
        routes: {
          '/home': (context) =>
              MainScreen(), // Đăng ký màn hình MainScreen với đường dẫn '/home'
        },
      ),
    );
  }
}

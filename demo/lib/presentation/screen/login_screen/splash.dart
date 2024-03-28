import 'package:book_booking/presentation/screen/home/main_screen.dart';
import 'package:flutter/material.dart';

class SplashLogin extends StatefulWidget {
  final Widget? child;
  const SplashLogin({super.key, this.child});

  @override
  State<SplashLogin> createState() => _SplashLoginState();
}

class _SplashLoginState extends State<SplashLogin> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
          (route) => false);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "welcome",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}

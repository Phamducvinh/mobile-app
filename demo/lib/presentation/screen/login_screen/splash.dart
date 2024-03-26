



import 'package:flutter/material.dart';

class SplashLogin extends StatefulWidget{
  final Widget? child;
  const SplashLogin({super.key, this.child});

  @override
  State<SplashLogin> createState() => _SplashLoginState();
}

class _SplashLoginState extends State<SplashLogin>{
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
      Duration(seconds: 3),(){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget.child!), (route) =>false );
      }
    );
    super.initState();
  }

  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text(
          "welcome to ", 
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:book_booking/presentation/widget/form_container_widget.dart';
import 'package:book_booking/presentation/screen/login_screen/signin.dart'; 
import 'package:book_booking/presentation/screen/home/main_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _userNameTextController = TextEditingController(); // Thêm controller cho User name
    TextEditingController _passwordTextController = TextEditingController();
    TextEditingController _emailTextController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              FormContainerWidget(
                hintText: "User name",
                isPasswordField: false,
                controller: _userNameTextController, // Truyền controller vào FormContainerWidget
              ),
              SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                hintText: "Email",
                isPasswordField: false,
                controller: _emailTextController,
              ),
              SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                hintText: "Password",
                isPasswordField: true,
                controller: _passwordTextController,
              ),
              SizedBox(height: 45),
              TextButton(
                onPressed: () {
                  FirebaseAuth.instance.
                  createUserWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text)
                  .then((value){
                    print("Created New Account");
                    Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> MainScreen()));
                    }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                    });
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(143, 148, 251, 1),
                        Color.fromRGBO(143, 148, 251, .6),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"), 
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()), 
                      );
                    },
                    child: Text(
                      "Sign In", 
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
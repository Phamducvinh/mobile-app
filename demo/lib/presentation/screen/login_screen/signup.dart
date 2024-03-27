import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:book_booking/presentation/widget/form_container_widget.dart';
import 'package:book_booking/presentation/screen/login_screen/signin.dart';
import 'package:book_booking/presentation/screen/home/main_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _userNameTextController = TextEditingController();
    TextEditingController _passwordTextController = TextEditingController();
    TextEditingController _emailTextController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/login_screen/background.png'),
                    fit: BoxFit.fill)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: FadeInUp(
                        duration: const Duration(seconds: 1),
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/login_screen/light-1.png'))),
                        )),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: FadeInUp(
                        duration: const Duration(milliseconds: 1200),
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/login_screen/light-2.png'))),
                        )),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: FadeInUp(
                        duration: const Duration(milliseconds: 1300),
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/login_screen/clock.png'))),
                        )),
                    ),
                    Positioned(
                      child: FadeInUp(
                        duration: const Duration(milliseconds: 1600),
                        child: Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: const Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    )
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      FormContainerWidget(
                        hintText: "User name",
                        isPasswordField: false,
                        controller: _userNameTextController, 
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormContainerWidget(
                        hintText: "Email",
                        isPasswordField: false,
                        controller: _emailTextController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormContainerWidget(
                        hintText: "Password",
                        isPasswordField: true,
                        controller: _passwordTextController,
                      ),
                      const SizedBox(height: 45),
                      TextButton(
                        onPressed: () async {
                          try {
                            // Tạo tài khoản người dùng mới bằng email và mật khẩu
                            UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text,
                            );

                            // Nếu tạo tài khoản thành công, lưu thông tin người dùng vào Firestore
                            if (userCredential.user != null) {
                              UserModel newUser = UserModel(
                                _userNameTextController.text,
                                _emailTextController.text,
                                _passwordTextController.text,
                              );
                              await newUser.saveToFirestore();

                              // Chuyển hướng người dùng đến màn hình chính sau khi đăng ký thành công
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const MainScreen()),
                              );
                            }
                          } catch (error) {
                            print("Error: $error");
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error: $error'),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 133, 234, 241),
                                Color.fromARGB(255, 51, 223, 235),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Sign Up",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                              );
                            },
                            child: const Text(
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
            ],
          ),
        ),
      ),
    );
  }
}

class UserModel {
  final String? username;
  final String? email;
  final String? password;

  UserModel(this.username, this.email, this.password);

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['username'],
      map['email'],
      map['password'],
    );
  }

  Future<void> saveToFirestore() async {
    try {
      final CollectionReference users = FirebaseFirestore.instance.collection('users');
      final Map<String, dynamic> userData = toMap();
      await users.add(userData);
    } catch (error) {
      throw error;
    }
  }
}

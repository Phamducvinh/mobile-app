import 'package:animate_do/animate_do.dart';
import 'package:book_booking/presentation/screen/login_screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:book_booking/presentation/screen/login_screen/signup.dart';
import 'package:book_booking/presentation/widget/form_container_widget.dart';
import 'package:book_booking/presentation/screen/home/main_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String? _name;
  String? get name => _name;

  String? _email;
  String? get email => _email;

  String? _imageUrl;
  String? get imageUrl => _imageUrl;

  void _signInWithGoogle() async {
    try {
      // Đăng xuất tài khoản trước khi đăng nhập tài khoản mới
      await _googleSignIn.signOut();

      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        // Đăng nhập vào Firebase
        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);
        final User userDetails = userCredential.user!;

        // Lưu thông tin người dùng
        setState(() {
          _name = userDetails.displayName;
          _email = userDetails.email;
          _imageUrl = userDetails.photoURL;
        });

        // Chuyển hướng đến màn hình chính
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      }
    } catch (e) {
      print("Error signing in with Google: $e");
      // Xử lý các trường hợp lỗi
    }
  }

  @override
  Widget build(BuildContext context) {
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
                                "Login",
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
                        controller: _emailTextController,
                        hintText: "Email",
                        isPasswordField: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FormContainerWidget(
                        controller: _passwordTextController,
                        hintText: "Password",
                        isPasswordField: true,
                      ),
                      const SizedBox(height: 45),
                      TextButton(
                        onPressed: () async {
                          // Kiểm tra xem liệu cả hai trường email và password có được điền vào không
                          if (_emailTextController.text.isEmpty ||
                              _passwordTextController.text.isEmpty) {
                            // Hiển thị thông báo lỗi nếu một trong hai trường email hoặc password không được điền vào
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Lỗi đăng nhập'),
                                  content: Text(
                                      'Vui lòng điền vào cả email và mật khẩu.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                            return; // Thoát khỏi hàm onPressed
                          }

                          // Tiếp tục với quá trình đăng nhập nếu cả hai trường email và password được điền vào
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .signInWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text,
                            );
                            // Đăng nhập thành công
                            // Chuyển hướng đến Màn hình chính (MainScreen)
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SplashLogin()),
                            );
                          } catch (e) {
                            // Xử lý lỗi đăng nhập
                            print('Lỗi khi đăng nhập: $e');
                            String errorMessage = 'Đã xảy ra lỗi';
                            if (e is FirebaseAuthException) {
                              if (e.code == 'user-not-found') {
                                errorMessage =
                                    'Không tìm thấy người dùng với email này';
                              } else if (e.code == 'wrong-password') {
                                errorMessage = 'Mật khẩu không đúng';
                              } else if (e.code == 'invalid-email') {
                                errorMessage = 'Địa chỉ email không hợp lệ';
                              }
                            }

                            // Hiển thị thông báo lỗi
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Lỗi đăng nhập'),
                                  content: Text(errorMessage),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
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
                              "Login",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Image.asset(
                                  "assets/images/login_screen/google_icon.webp"), // Thay đổi đường dẫn hình ảnh tùy theo vị trí của tệp ảnh Google
                              onPressed: _signInWithGoogle,
                            ),
                          ),
                          SizedBox(width: 55),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Image.asset(
                                  "assets/images/login_screen/facebook_icon.png"), // Thay đổi đường dẫn hình ảnh tùy theo vị trí của tệp ảnh Facebook
                              onPressed: () {
                                // Xử lý sự kiện khi nhấn nút Facebook
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpScreen()),
                                (route) => false,
                              );
                            },
                            child: const Text(
                              "Sign Up",
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

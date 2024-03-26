import 'package:book_booking/presentation/screen/home/main_screen.dart';
import 'package:book_booking/presentation/screen/login_screen/signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Thêm import cho Firestore
import 'package:book_booking/presentation/screen/login_screen/profile_screen.dart'; // Thêm import cho ProfileScreen

class DrawerWidget extends StatefulWidget{
  const DrawerWidget({Key? key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late User? _user;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    // Lấy thông tin người dùng hiện tại
    _user = FirebaseAuth.instance.currentUser;
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Logout Confirmation',
            style: Theme.of(context).textTheme.headline2,
          ),
          content: Text(
            'Are you sure you want to logout?',
            style: Theme.of(context).textTheme.headline4,  
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false, // Remove all routes from stack
                  );
                }).catchError((error) {
                  print("Error during signout: $error");
                });
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(182, 239, 243, 1),
              ),
              accountName: _user != null ? Text(_user!.displayName ?? "") : null,
              accountEmail: _user != null ? Text(_user!.email ?? "") : null,
              currentAccountPicture: Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/categories/anh6.png')
                ),
              ),
            ),
          ),
          ListTile(
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const MainScreen()),
              );
            },
            leading: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text(
              'Home',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          ListTile(
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const ProfileScreen()), // Chuyển hướng đến ProfileScreen để hiển thị thông tin người dùng
              );
            },
            leading: const Icon(
              Icons.person,
              color: Colors.black,
            ),
            title: Text(
              'My Account',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          ListTile(
            onTap: (){

            },
            leading: const Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            title: Text(
              'My Wish List',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          ListTile(
  onTap: () {
    _showLogoutConfirmationDialog(context); // Hiển thị hộp thoại xác nhận đăng xuất
  },
  leading: const Icon(
    Icons.exit_to_app,
    color: Colors.black,
  ),
  title: Text(
    'Log out',
    style: Theme.of(context).textTheme.headline2,
  ),
),

        ],
      ),
    );
  }
}

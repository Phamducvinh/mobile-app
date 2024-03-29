import 'package:book_booking/presentation/screen/wish_list/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:book_booking/presentation/screen/home/main_screen.dart';
import 'package:book_booking/presentation/screen/login_screen/signin.dart';
import 'package:book_booking/presentation/screen/login_screen/profile_screen.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String errorLink =
      "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";
  late User? _user;
  String? _name;
  String? _email;
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      String? email = currentUser.email;
      String? displayName = currentUser.displayName;

      if (email != null && displayName != null) {
        setState(() {
          _name = displayName;
          _email = email;
          _imageUrl = currentUser.photoURL;
        });
      } else {
        final QuerySnapshot userData = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: currentUser.email)
            .get();

        if (userData.docs.isNotEmpty) {
          setState(() {
            _name = userData.docs.first['username'];
            _email = currentUser.email;
            _imageUrl = currentUser.photoURL;
          });
        }
      }
    }
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Logout Confirmation',
            style: Theme.of(context).textTheme.headline6,
          ),
          content: Text(
            'Are you sure you want to logout?',
            style: Theme.of(context).textTheme.subtitle1,
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
                  setState(() {
                    _name = null;
                    _email = null;
                    _imageUrl = null;
                  });
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false,
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
              accountName: Text(
                _name ?? "",
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(fontSize: 18),
              ),
              accountEmail: Text(
                _email ?? "",
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(fontSize: 18),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: _imageUrl != null
                    ? NetworkImage(_imageUrl!)
                    : NetworkImage(errorLink),
                // AssetImage('assets/images/categories/anh6.png'),
              ),
            ),
          ),
          ListTile(
            onTap: () {
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WishListScreen()));
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
              _showLogoutConfirmationDialog(context);
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

import 'package:book_booking/presentation/screen/home/main_screen.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget{
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  // Function to show the confirmation dialog
  Future<void> _showLogoutConfirmationDialog() async {
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
                // // Perform logout and navigate to SignInScreen
                // FirebaseAuth.instance.signOut().then((value) {
                //   print("Signed Out");
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => SignInScreen()),
                //   );
                // });
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
                'Viet Nguyen Duc', 
                style: Theme.of(context).textTheme.headline2,
              ), 
              accountEmail: Text(
                'viet2k3nguyen@gmail.com',
                style: Theme.of(context).textTheme.headline4,
              ),
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
              // Navigator.push(
              //   context, 
              //   MaterialPageRoute(builder: (context) => CategoriesScreen()),
              // );
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
            onTap: (){

            },
            leading: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: Text(
              'Settings',
            style: Theme.of(context).textTheme.headline2,
            ),
          ),
          ListTile(
            onTap: (){
            _showLogoutConfirmationDialog();
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
import 'package:book_booking/presentation/screen/home/categories_screen.dart';
import 'package:book_booking/presentation/screen/home/home_screen.dart';
import 'package:book_booking/presentation/screen/home/main_screen.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget{
  const DrawerWidget({super.key});

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
                MaterialPageRoute(builder: (context) => MainScreen()),
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
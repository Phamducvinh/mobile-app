import 'dart:io';
import 'dart:typed_data';

import 'package:book_booking/presentation/screen/login_screen/setstate/setProfile.dart';
import 'package:book_booking/presentation/screen/login_screen/setstate/setSetting.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _imageUrl;
  late User? _user;
  late String _userName = "";
  late String _userEmail = "";

  Uint8List? _image;
  File? selectedImage;

  bool light = true;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    _user = FirebaseAuth.instance.currentUser;
    if (_user != null) {
      if (_user!.providerData[0].providerId == "password") {
        // Đăng nhập bằng email và password
        QuerySnapshot userData = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: _user!.email)
            .get();

        if (userData.docs.isNotEmpty) {
          setState(() {
            _userName = userData.docs.first['username'];
            _userEmail = _user!.email ?? "";
            _imageUrl = _user!.photoURL;
          });
        }
      } else if (_user!.providerData[0].providerId == "google.com") {
        // Đăng nhập bằng Google
        setState(() {
          _userName = _user!.displayName ?? "";
          _userEmail = _user!.email ?? "";
          _imageUrl = _user!.photoURL;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Material(
              elevation: 3,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 40,
                                backgroundImage: MemoryImage(_image!))
                            : const CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    'https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c')),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name: $_userName',
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                // const SizedBox(height: 20),
                                Text(
                                  'Email: $_userEmail',
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 40, 40, 40),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10)),
                        onPressed: () {
                          showEditProfile(context);
                        },
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.history,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Reading History',
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(color: Colors.black),
                    ),
                  ],
                )),
            const SizedBox(
              height: 2,
            ),
            TextButton(
                onPressed: () {
                  showSetting(context);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Setting',
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(color: Colors.black),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void showEditProfile(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: const Color.fromARGB(200, 0, 0, 0),
        isScrollControlled: true,
        useRootNavigator: true,
        context: context,
        builder: (builder) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.15,
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return ProfileModal(
                  updateProfileImage: updateProfileImage,
                );
              },
            ),
          );
        });
  }

  void updateProfileImage(Uint8List? newImage) {
    setState(() {
      _image = newImage;
    });
  }

  void showSetting(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: const Color.fromARGB(200, 0, 0, 0),
      context: context,
      builder: (builder) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SettingsModal(); // Sử dụng SettingsModal ở đây
            },
          ),
        );
      },
    );
  }
}

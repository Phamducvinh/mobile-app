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
    // Lấy thông tin người dùng hiện tại
    _user = FirebaseAuth.instance.currentUser;

    if (_user != null) {
      // Lấy dữ liệu người dùng từ Firestore
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(_user!.uid)
          .get();

      setState(() {
        //_userName = userData['username'];
        _userEmail = _user!.email!;
      });
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
                                backgroundImage: AssetImage(
                                    'assets/images/categories/anh6.png'),
                              ),
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
                          'Chỉnh sửa',
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
                      'Lịch sử đọc sách',
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
                      'Cài đặt',
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

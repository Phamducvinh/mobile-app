import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart'; // Import thư viện Firestore

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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 40, backgroundImage: MemoryImage(_image!))
                    : const CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            AssetImage('assets/images/categories/anh6.png'),
                      ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
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
                    backgroundColor: const Color.fromARGB(255, 40, 40, 40),
                    padding: const EdgeInsets.symmetric(horizontal: 10)),
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
    );
  }

  void showEditProfile(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Color.fromARGB(200, 0, 0, 0),
        isScrollControlled: true,
        useRootNavigator: true,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.15,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(0),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey, // Màu sắc của đường viền dưới
                          width: 1.0, // Độ rộng của đường viền dưới
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Chỉnh sửa hồ sơ',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 80,
                                backgroundImage: MemoryImage(_image!))
                            : const CircleAvatar(
                                radius: 80,
                                backgroundImage: AssetImage(
                                    'assets/images/categories/anh6.png'),
                              ),
                        Positioned(
                            bottom: 0,
                            left: 110,
                            child: IconButton(
                              onPressed: () {
                                showImagePickerOption(context);
                              },
                              icon: const Icon(
                                Icons.add_a_photo,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.blue[100],
        context: context,
        builder: (buider) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                            ),
                            Text('Gallery')
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                            ),
                            Text('Camera')
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}

// ignore_for_file: file_names
import 'dart:io';

import 'package:finance_mobile_app/UserProfile/Utils/userPreferences.dart';
import 'package:finance_mobile_app/providers/user_provider.dart';
import 'package:finance_mobile_app/widgets/SignUp.dart';

import 'package:finance_mobile_app/widgets/UserProfileWidgets/Textfield_widget.dart';
import 'package:finance_mobile_app/widgets/UserProfileWidgets/user_profile_widget.dart';
import 'package:finance_mobile_app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TabBarMenu extends StatefulWidget {
  late UserProvider userProvider;
  TabBarMenu({Key? key, required this.userProvider}) : super(key: key);

  @override
  State<TabBarMenu> createState() => _TabBarMenuState();
}

class _TabBarMenuState extends State<TabBarMenu> {
  File? imagePiece;

  Future pickImage(ImageSource source) async {
    try {
      final imagePiece = await ImagePicker().pickImage(source: source);

      if (imagePiece == null) {
        return;
      }
      final imageTemporary = File(imagePiece.path);
      setState(() {
        this.imagePiece = imageTemporary;
      });
    } on Platform catch (e) {
      print("Failed to pick image: $e");
    }
  }

  // void uploadImage(Image image) async {
  //   await imagePiece != null
  //       ? Image.file(
  //           imagePiece!,
  //           width: 100,
  //           height: 120,
  //           fit: BoxFit.cover,
  //         )
  //       : ClipRRect(
  //           borderRadius: BorderRadius.circular(20),
  //           child: Image.asset(
  //             'assets/Orange.jpeg',
  //             height: 120,
  //             width: 100,
  //           ),
  //         );
  //   await FireStoreDB.addImage(imagePiece!);
  // }

  Widget buildEditButton(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 0,
          child: IconButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    height: 120,
                    width: 140,
                    color: login_color,
                    child: Wrap(
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(
                            Icons.photo,
                            color: Colors.white,
                          ),
                          title: const Text(
                            "Pick from Gallery",
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          onTap: () => {
                            pickImage(ImageSource.gallery),
                          },
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.photo_camera,
                            color: Colors.white,
                          ),
                          title: const Text(
                            "Pick from Camera",
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          onTap: () => {
                            pickImage(ImageSource.camera),
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.add_a_photo,
                size: 20,
                color: Colors.white,
              )),
        ),
      );

  final user = UserPreference.myUser;
  final user2 = SignUp.userName;

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentData;
    const color = login_color;
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 20,
          ),
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: imagePiece != null
                  ? Image.file(
                      imagePiece!,
                      width: 100,
                      height: 120,
                      fit: BoxFit.cover,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/Orange.jpeg',
                        height: 120,
                        width: 100,
                      ),
                    ),
              // ProfileWidget(
              //   image: user.image,
              //   onClicked: () async {},
              // ),
            ),
            const SizedBox(
              height: 4,
            ),
            TextFieldWidget(
              label: "Full Name",
              text: userData.userName,
              onClicked: (name) {},
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
              label: "Email",
              text: userData.email,
              onClicked: (email) {},
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
              label: "About",
              text: user.about,
              maxLines: 5,
              onClicked: (about) {},
            ),
            const SizedBox(
              height: 18,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: signup_color,
              ),
              onPressed: () {},
              child: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 20,
                  color: login_color,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 20 * 7,
          right: 20 * 7,
          child: buildEditButton(color),
        ),
      ],
    );
  }
}

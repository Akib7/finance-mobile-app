import 'dart:io';

import 'package:finance_mobile_app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

class ProfileWidget extends StatefulWidget {
  final String image;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.image,
    required this.onClicked,
  }) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  File? imagePiece;

  Future pickImage() async {
    try {
      final imagePiece =
          await ImagePicker().pickImage(source: ImageSource.gallery);

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

  Future pickImage2() async {
    try {
      final imagePiece =
          await ImagePicker().pickImage(source: ImageSource.camera);

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
                            pickImage(),
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
                            pickImage2(),
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
  @override
  Widget build(BuildContext context) {
    const color = login_color;
    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 0,
            child: buildEditButton(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final imagePath = NetworkImage(widget.image);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: imagePath,
          fit: BoxFit.cover,
          height: 128,
          width: 100,
          child: InkWell(
            onTap: widget.onClicked,
          ),
        ),
      ),
    );
  }
}

Widget buildCircle({
  required Widget child,
  required double all,
  required Color color,
}) =>
    ClipOval(
      child: Container(
        height: 40,
        width: 40,
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ),
    );

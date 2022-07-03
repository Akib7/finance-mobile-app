// ignore_for_file: file_names

import 'package:finance_mobile_app/widgets/constants.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  // final Color textColor;
  final ValueChanged<String> onClicked;
  const TextFieldWidget({
    Key? key,
    required this.label,
    required this.text,
    required this.onClicked,
    this.maxLines = 1,
    // this.textColor = Colors.white,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(
      text: widget.text,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          style: const TextStyle(
            color: Colors.white,
          ),
          controller: controller,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            fillColor: login_color,
            hoverColor: signup_color,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

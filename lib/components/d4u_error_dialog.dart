import 'package:flutter/material.dart';
import 'd4u_text.dart';

class D4uErrorDialog extends StatelessWidget {
  D4uErrorDialog({
    Key? key,
    this.title = '',
    this.content = '',
  }) : super(key: key);

  String title;
  String? content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: D4uText(
        text: title,
        fontSize: 13,
        maxLines: 1,
      ),
      content: D4uText(
        text: content,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        maxLines: 3,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Understand"),
        ),
      ],
    );
  }
}

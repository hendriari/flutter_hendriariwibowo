import 'package:flutter/material.dart';

Future deleteContact(context, String content,
    {required Function() onPressed}) async {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text('Hapus $content '),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text(
            'Hapus',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ),
  );
}

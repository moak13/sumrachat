import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  final VoidCallback? onTap;
  const SendButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoButton(
        child: const Text(
          'Send',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        onPressed: onTap,
      );
    }
    return IconButton(
      onPressed: onTap,
      icon: const Icon(
        Icons.send,
        color: Colors.blue,
      ),
    );
  }
}

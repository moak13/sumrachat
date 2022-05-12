import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  final String message;
  final bool? isMe;
  const MessageTile({
    Key? key,
    required this.message,
    this.isMe = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe == true ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isMe == true ? Colors.blue : Colors.grey.shade300,
          borderRadius: isMe == true
              ? const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
        ),
        child: Text(
          message,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: isMe == true ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

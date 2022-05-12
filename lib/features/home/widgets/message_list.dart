import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  final String fullName;
  final String image;
  final String lastMessage;
  final VoidCallback? onTap;
  final bool hasSeen;
  const MessageList({
    Key? key,
    required this.fullName,
    required this.image,
    required this.lastMessage,
    this.onTap,
    this.hasSeen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 78,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 16,
          ),
          child: Row(
            children: [
              Image.asset(
                image,
                height: 68,
                width: 68,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      lastMessage,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.circle_outlined,
                size: 12,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

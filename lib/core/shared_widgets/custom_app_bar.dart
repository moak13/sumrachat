import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 100,
        padding: const EdgeInsets.only(
          left: 10,
          right: 5,
          top: 5,
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/png/user_1.png',
              height: 40,
              width: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                actions?.length ?? 0,
                (index) => actions!.elementAt(index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

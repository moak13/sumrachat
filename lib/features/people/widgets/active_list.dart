import 'package:flutter/material.dart';

import '../../../core/shared_widgets/custom_icon_button.dart';

class ActiveList extends StatelessWidget {
  final String fullName;
  final String image;
  final bool? isActive;
  final VoidCallback? onTap;
  const ActiveList({
    Key? key,
    required this.fullName,
    required this.image,
    this.isActive,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 60,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
            left: 16,
            right: 11,
          ),
          child: ListTile(
            leading: Image.asset(
              image,
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  fullName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                CustomIconButton(
                  icon: 'assets/png/wave.png',
                  onTap: () {},
                ),
              ],
            ),
            subtitle: Column(
              children: [
                const SizedBox(
                  height: 13,
                ),
                Container(
                  height: 1,
                  // width: double.infinity,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

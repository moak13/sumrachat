import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String icon;
  final Color? backgroundColor;
  final Color? itemColor;
  final IconData? iconData;
  final VoidCallback? onTap;
  const CustomIconButton({
    Key? key,
    required this.icon,
    this.iconData,
    this.onTap,
    this.backgroundColor,
    this.itemColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (icon.isNotEmpty) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            child: Image.asset(icon),
          ),
        ),
      );
    }
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor ?? Colors.grey[300],
          ),
          child: Icon(
            iconData,
            color: itemColor ?? Colors.black,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StatusList extends StatelessWidget {
  final String image;
  final String name;
  final IconData? iconData;
  final bool? isActive;
  final VoidCallback? onTap;
  const StatusList({
    Key? key,
    required this.image,
    required this.name,
    this.isActive = false,
    this.onTap,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (iconData != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 100,
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 52,
                  width: 52,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                  child: Icon(
                    iconData,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 100,
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SvgPicture.asset(
              //   image,
              //   height: 52,
              //   width: 52,
              //   fit: BoxFit.cover,
              // ),
              Image.asset(
                image,
                height: 52,
                width: 52,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                name,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

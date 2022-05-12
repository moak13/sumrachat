import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String? placeholder;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final bool isNotSearch;
  const CustomSearchBar({
    Key? key,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.placeholder,
    this.isNotSearch = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          bottom: 8,
          left: 10,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        hintText: placeholder,
        suffixIcon: !isNotSearch
            ? Icon(
                Icons.search,
                color: Colors.grey[400],
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

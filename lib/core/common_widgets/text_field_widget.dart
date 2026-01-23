import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback? onSuffixTap;
  final IconData? suffixIcon;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.onSuffixTap,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xfff3f3f3),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(fontSize: 16, color: Colors.black),
          decoration: InputDecoration(
            isCollapsed: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),

            // Optional Suffix Icon
            suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: Icon(suffixIcon, color: Colors.grey, size: 20),
                    onPressed: onSuffixTap,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

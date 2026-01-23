import 'package:flutter/material.dart';

class CodeTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback onSendCode;

  const CodeTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onSendCode,
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
      child: Row(
        children: [
          // TextField
          Expanded(
            child: Center(
              child: TextField(
                controller: controller,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                textAlignVertical: TextAlignVertical.center,

                decoration: const InputDecoration(
                  isCollapsed: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  hintText: "Code",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
          ),

          // Divider line
          Container(
            height: 22,
            width: 1.5,
            color: Colors.grey,
            margin: const EdgeInsets.symmetric(horizontal: 10),
          ),

          // Send Code button
          TextButton(
            onPressed: onSendCode,
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: const Text(
              "Send code",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

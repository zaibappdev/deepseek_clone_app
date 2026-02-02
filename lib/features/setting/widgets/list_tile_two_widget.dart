import 'package:flutter/material.dart';

class ListTileTwoWidget extends StatefulWidget {
  final IconData leadingIcon;
  final String title;
  final String trailingText;
  final IconData trailingIcon;
  final VoidCallback onTap;

  const ListTileTwoWidget({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.trailingText,
    required this.trailingIcon,
    required this.onTap,
  });

  @override
  State<ListTileTwoWidget> createState() => _ListTileTwoWidgetState();
}

class _ListTileTwoWidgetState extends State<ListTileTwoWidget> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 700),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        decoration: BoxDecoration(
          color: _isPressed ? Colors.grey[100] : Colors.transparent,
          // tap color
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(widget.leadingIcon, size: 22),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              widget.trailingText,
              style: TextStyle(fontSize: 15, color: Colors.grey[700]),
            ),
            SizedBox(width: 8),
            Icon(widget.trailingIcon, size: 20),
          ],
        ),
      ),
    );
  }
}

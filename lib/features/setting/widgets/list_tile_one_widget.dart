import 'package:flutter/material.dart';

class ListTileOneWidget extends StatefulWidget {
  final IconData leadingIcon;
  final String title;
  final IconData trailingIcon;
  final VoidCallback onTap;

  const ListTileOneWidget({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.trailingIcon,
    required this.onTap,
  });

  @override
  State<ListTileOneWidget> createState() => _ListTileOneWidgetState();
}

class _ListTileOneWidgetState extends State<ListTileOneWidget> {
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
            Icon(widget.trailingIcon, size: 20),
          ],
        ),
      ),
    );
  }
}

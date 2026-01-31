import 'package:flutter/material.dart';

class SelectAbleWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final bool openPage; // = true only for items that should open page 1

  const SelectAbleWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.openPage = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: openPage ? onTap : null, // Today/Tomorrow won't trigger page open
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE9F1FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            SizedBox(width: 4), // START spacing like your screenshot
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.blue : Colors.black87,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

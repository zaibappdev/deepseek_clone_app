import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final String? iconPath;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? textColor;

  const ElevatedButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.iconPath,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.white,
          shadowColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(color: Colors.black12, width: 1.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconPath != null) ...[
              Image.asset(iconPath!, height: 24),
              const SizedBox(width: 8),
            ],
            Flexible(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 18,
                  color: textColor ?? Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

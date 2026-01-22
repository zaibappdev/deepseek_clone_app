import 'package:flutter/material.dart';

class MainScreenContentWidget extends StatelessWidget {
  final double screenX;
  final bool isOpen;
  final VoidCallback onMenuTap;
  final Widget? child; // Custom children for body

  const MainScreenContentWidget({
    super.key,
    required this.screenX,
    required this.isOpen,
    required this.onMenuTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 135),
      transform: Matrix4.identity()..translate(screenX),
      child: Material(
        elevation: screenX > 0 ? 16 * (screenX / 250) : 0,
        shadowColor: Colors.black.withOpacity(0.3),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: onMenuTap,
            ),
            title: const Text(
              "New Chat",
              style: TextStyle(color: Colors.black),
            ),
            toolbarHeight: 30,
          ),
          body:
              child ??
              const Center(
                child: Text("Main Screen", style: TextStyle(fontSize: 22)),
              ),
        ),
      ),
    );
  }
}

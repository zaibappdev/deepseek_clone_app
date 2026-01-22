import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final double menuX;
  final double drawerWidth;

  const DrawerWidget({super.key, required this.menuX, required this.drawerWidth});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      left: menuX,
      top: 0,
      bottom: 0,
      child: Container(
        width: drawerWidth,
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text("Menu 1", style: TextStyle(fontSize: 22, color: Colors.black)),
            SizedBox(height: 20),
            Text("Menu 2", style: TextStyle(fontSize: 22, color: Colors.black)),
            SizedBox(height: 20),
            Text("Menu 3", style: TextStyle(fontSize: 22, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}

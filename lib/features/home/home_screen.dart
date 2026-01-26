import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  double maxSlide = 0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      value: 0.0,
      // closed by default
      lowerBound: 0.0,
      upperBound: 1.0,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // Close Page 1
  void closePage1() {
    if (controller.value > 0.0) {
      controller.animateTo(0.0, curve: Curves.easeOutCubic);
    }
  }

  @override
  Widget build(BuildContext context) {
    maxSlide = MediaQuery.of(context).size.width * 0.65;

    return Scaffold(
      body: Stack(
        children: [
          // -----------------
          // PAGE 1 (BEHIND)
          // -----------------
          AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              final drag = controller.value;
              return Transform.translate(
                offset: Offset(maxSlide * drag, 0),
                child: Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      "Page 1 (Behind)",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              );
            },
          ),

          // -----------------
          // PAGE 2 (FRONT)
          // -----------------
          AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              final drag = controller.value;

              return Transform.translate(
                offset: Offset(maxSlide * drag, 0),
                child: Stack(
                  children: [
                    // Page 2 main container
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: const Center(
                        child: Text(
                          "Page 2 (Front)",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),

                    // Shadow only on Page 2
                    Opacity(
                      opacity: drag,
                      child: Container(color: Colors.black.withOpacity(0.4)),
                    ),

                    // Transparent GestureDetector to catch taps
                    Positioned.fill(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: closePage1,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          // -----------------
          // Drag Gesture (both pages)
          // -----------------
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onHorizontalDragUpdate: (details) {
              controller.value += details.delta.dx / maxSlide;
              controller.value = controller.value.clamp(0.0, 1.0);
            },
            onHorizontalDragEnd: (details) {
              final velocity = details.primaryVelocity ?? 0;

              if (velocity.abs() >= 300) {
                // fast swipe fling
                controller.fling(velocity: velocity.sign);
              } else {
                // slow drag open/close
                if (controller.value > 0.5) {
                  controller.animateTo(1.0, curve: Curves.easeOutCubic);
                } else {
                  controller.animateTo(0.0, curve: Curves.easeOutCubic);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

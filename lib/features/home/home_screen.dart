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

  void closePage1() {
    controller.animateTo(0.0, curve: Curves.easeOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    maxSlide = MediaQuery.of(context).size.width * 0.65;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ==========================
          // PAGE 1 (Background)
          // ==========================
          AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              final drag = controller.value;

              // PAGE 1: Slide from left → right when opening
              // And right → left when closing
              return Transform.translate(
                offset: Offset(-maxSlide + (maxSlide * drag), 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 40, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Item 1",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Item 2", style: TextStyle(fontSize: 24)),
                      SizedBox(height: 20),
                      Text("Item 3", style: TextStyle(fontSize: 24)),
                      SizedBox(height: 20),
                      Text("Item 4", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                ),
              );
            },
          ),

          // ==========================
          // PAGE 2 (Front)
          // ==========================
          AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              final drag = controller.value;

              // PAGE 2: Slide from right → left when opening
              return Transform.translate(
                offset: Offset(maxSlide * drag, 0),
                child: Stack(
                  children: [
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

                    // Shadow grows with drag
                    Opacity(
                      opacity: drag,
                      child: Container(color: Colors.black12),
                    ),

                    // Tap to close
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

          // ==========================
          // DRAG GESTURE
          // ==========================
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onHorizontalDragUpdate: (details) {
              controller.value += details.delta.dx / maxSlide;
              controller.value = controller.value.clamp(0.0, 1.0);
            },
            onHorizontalDragEnd: (details) {
              final velocity = details.primaryVelocity ?? 0;

              if (velocity.abs() >= 300) {
                controller.fling(velocity: velocity.sign);
              } else {
                controller.animateTo(
                  controller.value > 0.5 ? 1.0 : 0.0,
                  curve: Curves.easeOutCubic,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

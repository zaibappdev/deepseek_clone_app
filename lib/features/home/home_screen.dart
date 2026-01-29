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
          // PAGE 1 (Background)
          AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              final drag = controller.value;

              return Transform.translate(
                offset: Offset(-maxSlide + (maxSlide * drag), 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 40, left: 8, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --------- SCROLLABLE TEXT LIST ----------
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Today",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 8),

                              Text(
                                "Item 1",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              SizedBox(height: 8),

                              Text(
                                "Item 1",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              SizedBox(height: 8),

                              Text(
                                "Tomorrow",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // --------- FIXED BOTTOM ROW ----------
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 80,
                          color: Colors.white,
                          child: Row(
                            children: const [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.person, color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "you*****673@gmail.com",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          // Page 2
          AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              final drag = controller.value;

              // Close page keyboard when open page 1
              if (drag > 0) {
                FocusScope.of(context).unfocus();
              }

              return Transform.translate(
                offset: Offset(maxSlide * drag, 0),
                child: Stack(
                  children: [
                    // PAGE 2 CONTENT
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const SizedBox(height: 100),
                            const Text(
                              "Page 2 (Front)",
                              style: TextStyle(fontSize: 30),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),

                    // Text Field
                    Positioned(
                      bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                      left: 16,
                      right: 16,
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1.5,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: TextField(
                            maxLines: 6,
                            minLines: 1,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type something...",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // SHADOW + TAP-TO-CLOSE (ENABLED ONLY WHEN DRAG > 0)
                    if (drag > 0)
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: closePage1,
                        child: Opacity(
                          opacity: drag,
                          child: Container(color: Colors.black12),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),

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

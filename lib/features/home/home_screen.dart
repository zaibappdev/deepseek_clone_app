import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller; // ← animation controller
  double maxSlide = 0;
  int selectedIndex = -1; // ← selected item index
  final double sidePadding = 10; // ← side padding

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      // ← init animation controller
      vsync: this,
      value: 0.0,
      lowerBound: 0.0,
      upperBound: 1.0,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    controller.dispose(); // ← dispose controller
    super.dispose();
  }

  void closePage1() {
    controller.animateTo(0.0, curve: Curves.easeOutCubic); // ← close page 1
  }

  @override
  Widget build(BuildContext context) {
    maxSlide =
        MediaQuery.of(context).size.width * 0.65; // ← calculate max slide

    return Scaffold(
      backgroundColor: Colors.white, // ← scaffold background
      body: Stack(
        children: [
          // ← PAGE 1
          AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              final drag = controller.value; // ← drag value
              return Transform.translate(
                offset: Offset(-maxSlide + (maxSlide * drag), 0),
                // ← slide animation
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  // ← full width
                  height: MediaQuery.of(context).size.height,
                  // ← full height
                  color: Colors.white,
                  // ← background color
                  padding: const EdgeInsets.only(top: 40, left: 8, right: 20),
                  // ← padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // ← alignment
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          // ← scrollable content
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Today",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              // ← section title
                              const SizedBox(height: 8),

                              // ← spacing
                              GestureDetector(
                                // ← ITEM 1
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 0;
                                  });
                                  controller.animateTo(
                                    0.0,
                                    curve: Curves.easeOutCubic,
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: selectedIndex == 0
                                        ? Colors.blue.withOpacity(0.10)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: const Text(
                                    "Item 1",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 8),

                              // ← spacing
                              GestureDetector(
                                // ← ITEM 2
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 1;
                                  });
                                  controller.animateTo(
                                    0.0,
                                    curve: Curves.easeOutCubic,
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: selectedIndex == 1
                                        ? Colors.blue.withOpacity(0.10)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: const Text(
                                    "Item 2",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 8),
                              // ← spacing
                              const Text(
                                "Tomorrow",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              // ← section title
                              const SizedBox(height: 8),

                              // ← spacing
                              GestureDetector(
                                // ← ITEM 3
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 2;
                                  });
                                  controller.animateTo(
                                    0.0,
                                    curve: Curves.easeOutCubic,
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: selectedIndex == 2
                                        ? Colors.blue.withOpacity(0.10)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: const Text(
                                    "Item 3",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        // ← bottom fixed row
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
                              // ← avatar
                              SizedBox(width: 10),
                              Text(
                                "you*****673@gmail.com",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              // ← email
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

          // ← PAGE 2
          AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              final drag = controller.value; // ← drag value
              if (drag > 0)
                FocusScope.of(context).unfocus(); // ← close keyboard

              return Transform.translate(
                offset: Offset(maxSlide * drag, 0), // ← slide animation
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                    ), // ← full page container

                    Container(
                      // ← top app bar
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            // ← menu icon
                            onTap: () {
                              controller.animateTo(
                                1.0,
                                curve: Curves.easeOutCubic,
                              );
                            },
                            child: const Icon(Icons.menu, size: 26),
                          ),
                          const Text(
                            "New Chat",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // ← title
                          const Icon(Icons.add_circle_outline, size: 26),
                          // ← action icon
                        ],
                      ),
                    ),

                    Positioned.fill(
                      // ← body content
                      top: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/logo/deepseek_logo.png",
                            height: 42,
                          ),
                          // ← logo
                          const SizedBox(height: 10),
                          const Text(
                            "How can I help you?",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // ← heading
                        ],
                      ),
                    ),

                    AnimatedPositioned(
                      // ← bottom input bar
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOut,
                      left: 16,
                      right: 16,
                      bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1.5,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 5,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const TextField(
                                maxLines: 6,
                                minLines: 1,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Type a message or hold to speak",
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                // ← input actions
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        // ← camera button
                                        height: 28,
                                        width: 68,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(Icons.camera_alt, size: 16),
                                            SizedBox(width: 4),
                                            Text(
                                              "Think",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        // ← mic button
                                        height: 28,
                                        width: 68,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(Icons.mic, size: 16),
                                            SizedBox(width: 4),
                                            Text(
                                              "Search",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        // ← send button
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                        ),
                                        child: const Icon(Icons.send, size: 16),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        // ← attachment button
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.attachment,
                                          size: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    if (drag > 0) // ← shadow overlay
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
            // ← horizontal drag
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

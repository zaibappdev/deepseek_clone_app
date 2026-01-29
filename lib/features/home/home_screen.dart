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
                                "Nav 2025",
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
                                "Item 1",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
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

          // PAGE 2 (Front)
          AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              final drag = controller.value;

              return Transform.translate(
                offset: Offset(maxSlide * drag, 0),
                child: Stack(
                  children: [
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

                            // --------- BOTTOM NAV BAR (INLINE) ----------
                            SizedBox(
                              height: 120,
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.bottomCenter,
                                children: [
                                  // Main bottom bar
                                  Container(
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(24),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 10,
                                          offset: const Offset(0, -2),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        // Think Button
                                        InkWell(
                                          onTap: () {
                                            print('Think tapped');
                                          },
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 8,
                                            ),
                                            child: Row(
                                              children: const [
                                                Icon(
                                                  Icons.auto_awesome,
                                                  size: 22,
                                                ),
                                                SizedBox(width: 8),
                                                Text(
                                                  'Think',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        // Search Button
                                        InkWell(
                                          onTap: () {
                                            print('Search tapped');
                                          },
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 8,
                                            ),
                                            child: Row(
                                              children: const [
                                                Icon(Icons.search, size: 22),
                                                SizedBox(width: 8),
                                                Text(
                                                  'Search',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        const SizedBox(width: 80),
                                        // Space for center button

                                        // Plus Button
                                        InkWell(
                                          onTap: () {
                                            print('Add tapped');
                                          },
                                          customBorder: const CircleBorder(),
                                          child: const Padding(
                                            padding: EdgeInsets.all(12),
                                            child: Icon(Icons.add, size: 26),
                                          ),
                                        ),

                                        // Voice Button
                                        InkWell(
                                          onTap: () {
                                            print('Voice tapped');
                                          },
                                          customBorder: const CircleBorder(),
                                          child: const Padding(
                                            padding: EdgeInsets.all(12),
                                            child: Icon(
                                              Icons.graphic_eq_rounded,
                                              size: 26,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Center floating button
                                  Positioned(
                                    bottom: 45,
                                    child: Container(
                                      width: 65,
                                      height: 65,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFFE8B4F7),
                                            Color(0xFFB4A4F7),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.purple.withOpacity(
                                              0.3,
                                            ),
                                            blurRadius: 15,
                                            offset: const Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {
                                            print('Center button tapped');
                                          },
                                          customBorder: const CircleBorder(),
                                          child: const Center(
                                            child: Icon(
                                              Icons.psychology_outlined,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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

          // DRAG GESTURE
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

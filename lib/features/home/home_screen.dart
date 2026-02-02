import 'package:deepseek_clone_app/routes/navigation_services.dart';
import 'package:flutter/material.dart';

import '../../routes/app_paths.dart';

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
          // PAGE 1
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
                  padding: const EdgeInsets.only(top: 40, left: 5, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 135),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  // same as item text
                                  child: Text(
                                    "Today",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),

                                buildItem(
                                  title: "Junaid Jamel",
                                  index: 0,
                                  selectedIndex: selectedIndex,
                                  onTap: () {
                                    setState(() => selectedIndex = 0);
                                    controller.animateTo(0.0);
                                  },
                                ),

                                buildItem(
                                  title: "Threads",
                                  index: 1,
                                  selectedIndex: selectedIndex,
                                  onTap: () {
                                    setState(() => selectedIndex = 1);
                                    controller.animateTo(0.0);
                                  },
                                ),

                                buildItem(
                                  title:
                                      "Flutter Developers Community (moderated)",
                                  index: 2,
                                  selectedIndex: selectedIndex,
                                  onTap: () {
                                    setState(() => selectedIndex = 2);
                                    controller.animateTo(0.0);
                                  },
                                ),

                                const SizedBox(height: 15),

                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  // same as item text
                                  child: Text(
                                    "Tomorrow",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),

                                buildItem(
                                  title: "About me",
                                  index: 3,
                                  selectedIndex: selectedIndex,
                                  onTap: () {
                                    setState(() => selectedIndex = 3);
                                    controller.animateTo(0.0);
                                  },
                                ),

                                const SizedBox(height: 15),

                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  // same as item text
                                  child: Text(
                                    "Dec 2025",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),

                                buildItem(
                                  title: "Mobile App Development Guidance…",
                                  index: 4,
                                  selectedIndex: selectedIndex,
                                  highlightColor: Colors.blue.withOpacity(0.12),
                                  onTap: () {
                                    setState(() => selectedIndex = 4);
                                    controller.animateTo(0.0);
                                  },
                                ),

                                buildItem(
                                  title: "Portfolio",
                                  index: 5,
                                  selectedIndex: selectedIndex,
                                  onTap: () {
                                    setState(() => selectedIndex = 5);
                                    controller.animateTo(0.0);
                                  },
                                ),

                                const SizedBox(height: 15),

                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  // same as item text
                                  child: Text(
                                    "Nov 2025",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),

                                buildItem(
                                  title: "Client",
                                  index: 6,
                                  selectedIndex: selectedIndex,
                                  onTap: () {
                                    setState(() => selectedIndex = 6);
                                    controller.animateTo(0.0);
                                  },
                                ),

                                buildItem(
                                  title: "Creating AI Powered Mobile App C…",
                                  index: 7,
                                  selectedIndex: selectedIndex,
                                  onTap: () {
                                    setState(() => selectedIndex = 7);
                                    controller.animateTo(0.0);
                                  },
                                ),

                                buildItem(
                                  title: "Zaibappdev Upwork",
                                  index: 8,
                                  selectedIndex: selectedIndex,
                                  onTap: () {
                                    setState(() => selectedIndex = 8);
                                    controller.animateTo(0.0);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // BOTTOM PROFILE ROW
                      GestureDetector(
                        onTap: () {
                          NavigationServices.push(AppPaths.settings);
                        },
                        child: Container(
                          height: 80,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
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

          // PAGE 2
          AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              final drag = controller.value;
              if (drag > 0) {
                FocusScope.of(context).unfocus();
              }

              return Transform.translate(
                offset: Offset(maxSlide * drag, 0),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                    ),

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
                          const Icon(Icons.add_circle_outline, size: 26),
                          // ← action icon
                        ],
                      ),
                    ),

                    Positioned.fill(
                      top: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/logo/deepseek_logo.png",
                            height: 42,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "How can I help you?",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    AnimatedPositioned(
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

// Helper widget
Widget buildItem({
  required String title,
  required int index,
  required int selectedIndex,
  Color highlightColor = const Color(0xFFE3EAFD),
  required VoidCallback onTap,
}) {
  final bool isSelected = index == selectedIndex;

  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: onTap,
    child: SizedBox(
      height: 30,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          if (isSelected)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: highlightColor,
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

          // TEXT, ALWAYS ALIGNED LEFT
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}

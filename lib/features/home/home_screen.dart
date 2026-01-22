import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double drawerWidth = 250;
  double screenX = 0; // Main screen slide
  double menuX = -250; // Drawer slide
  bool isOpen = false;

  void openDrawer() {
    setState(() {
      screenX = drawerWidth - 20;
      menuX = 0;
      isOpen = true;
    });
  }

  void closeDrawer() {
    setState(() {
      screenX = 0;
      menuX = -drawerWidth;
      isOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // Body
      body: GestureDetector(
        // Drag update (finger swipe)
        onHorizontalDragUpdate: (details) {
          setState(() {
            screenX += details.delta.dx;
            menuX += details.delta.dx;

            // Clamp drawer and screen positions
            if (screenX < 0) screenX = 0;
            if (screenX > drawerWidth - 20) screenX = drawerWidth - 20;

            if (menuX < -drawerWidth) menuX = -drawerWidth;
            if (menuX > 0) menuX = 0;
          });
        },

        // Drag end (finger lift) - decide open/close based on distance + speed
        onHorizontalDragEnd: (details) {
          final velocity = details.primaryVelocity ?? 0;

          if (velocity > 500) {
            // Fast swipe right → open drawer
            openDrawer();
          } else if (velocity < -500) {
            // Fast swipe left → close drawer
            closeDrawer();
          } else {
            // Slow swipe → check screenX threshold
            if (screenX > drawerWidth / 2) {
              openDrawer();
            } else {
              closeDrawer();
            }
          }
        },

        // Tap on main screen to close drawer
        onTap: () {
          if (isOpen) closeDrawer();
        },

        child: Stack(
          children: [
            // Drawer (slides in)
            AnimatedPositioned(
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
                    Text(
                      "Menu 1",
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Menu 2",
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Menu 3",
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),

            // Main screen with dynamic shadow
            AnimatedContainer(
              duration: const Duration(milliseconds: 135),
              transform: Matrix4.identity()..translate(screenX),
              child: Material(
                elevation: screenX > 0 ? 16 * (screenX / drawerWidth) : 0,
                shadowColor: Colors.black.withOpacity(0.3),
                child: Scaffold(
                  backgroundColor: Colors.white,

                  // App Bar
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    leading: IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black),
                      onPressed: () {
                        isOpen ? closeDrawer() : openDrawer();
                      },
                    ),
                    title: const Text(
                      "New Chat",
                      style: TextStyle(color: Colors.black),
                    ),
                    toolbarHeight: 30,
                  ),

                  // Body
                  body: const Center(
                    child: Text("Main Screen", style: TextStyle(fontSize: 22)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'custom_widgets/custom_drawer.dart';
// import 'custom_widgets/main_screen_content.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   double drawerWidth = 250;
//   double screenX = 0;
//   double menuX = -250;
//   bool isOpen = false;
//
//   void openDrawer() {
//     setState(() {
//       screenX = drawerWidth - 20;
//       menuX = 0;
//       isOpen = true;
//     });
//   }
//
//   void closeDrawer() {
//     setState(() {
//       screenX = 0;
//       menuX = -drawerWidth;
//       isOpen = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: GestureDetector(
//         onHorizontalDragUpdate: (details) {
//           setState(() {
//             screenX += details.delta.dx;
//             menuX += details.delta.dx;
//
//             if (screenX < 0) screenX = 0;
//             if (screenX > drawerWidth - 20) screenX = drawerWidth - 20;
//
//             if (menuX < -drawerWidth) menuX = -drawerWidth;
//             if (menuX > 0) menuX = 0;
//           });
//         },
//         onHorizontalDragEnd: (details) {
//           final velocity = details.primaryVelocity ?? 0;
//
//           if (velocity > 500) {
//             openDrawer();
//           } else if (velocity < -500) {
//             closeDrawer();
//           } else {
//             if (screenX > drawerWidth / 2) openDrawer();
//             else closeDrawer();
//           }
//         },
//         onTap: () {
//           if (isOpen) closeDrawer();
//         },
//         child: Stack(
//           children: [
//             // Custom drawer widget
//             CustomDrawer(menuX: menuX, drawerWidth: drawerWidth),
//
//             // Main screen widget
//             MainScreenContent(
//               screenX: screenX,
//               isOpen: isOpen,
//               onMenuTap: () => isOpen ? closeDrawer() : openDrawer(),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: const [
//                   Text("Custom Child 1", style: TextStyle(fontSize: 22)),
//                   SizedBox(height: 20),
//                   Text("Custom Child 2", style: TextStyle(fontSize: 18)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:deepseek_clone_app/features/setting/widgets/list_tile_one_widget.dart';
import 'package:deepseek_clone_app/features/setting/widgets/list_tile_two_widget.dart';
import 'package:flutter/material.dart';
import '../../routes/app_paths.dart';
import '../../routes/navigation_services.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        automaticallyImplyLeading: false,
        automaticallyImplyActions: false,
        centerTitle: true,

        // Leading Button
        leading: Padding(
          padding: const EdgeInsets.only(left: 22),
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              NavigationServices.go(AppPaths.home);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ),
          ),
        ),

        // Text
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Container(
              height: 95,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTileOneWidget(
                    leadingIcon: Icons.person,
                    title: "Account Settings",
                    trailingIcon: Icons.chevron_right,
                    onTap: () {},
                  ),

                  ListTileOneWidget(
                    leadingIcon: Icons.font_download_sharp,
                    title: "Data Controls",
                    trailingIcon: Icons.chevron_right,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // App Section
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "App",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Container(
              height: 138,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTileTwoWidget(
                    leadingIcon: Icons.settings,
                    title: "Language",
                    trailingText: "English",
                    trailingIcon: Icons.chevron_right,
                    onTap: () {},
                  ),

                  ListTileTwoWidget(
                    leadingIcon: Icons.settings,
                    title: "Appearance",
                    trailingText: "System",
                    trailingIcon: Icons.chevron_right,
                    onTap: () {},
                  ),

                  ListTileOneWidget(
                    leadingIcon: Icons.font_download_sharp,
                    title: "Font size",
                    trailingIcon: Icons.chevron_right,
                    onTap: () {},
                  ),

                  // ListTile(
                  //   leading: const Icon(Icons.person),
                  //   title: const Text("Profile"),
                  //   trailing: Icon(Icons.arrow_forward_ios_outlined),
                  //   onTap: () {},
                  // ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Audio Section
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Audio",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Container(
              height: 46,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTileOneWidget(
                    leadingIcon: Icons.mic_none_outlined,
                    title: "Main Language",
                    trailingIcon: Icons.chevron_right,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Select the primary language you use for voice input to achieve better recognition results",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // About Section
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "About",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Container(
              height: 92,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTileOneWidget(
                    leadingIcon: Icons.info_outline_rounded,
                    title: "Check for updates",
                    trailingIcon: Icons.chevron_right,
                    onTap: () {},
                  ),
                  ListTileOneWidget(
                    leadingIcon: Icons.mic_none_outlined,
                    title: "Service agreement",
                    trailingIcon: Icons.chevron_right,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              height: 46,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTileOneWidget(
                    leadingIcon: Icons.question_mark_outlined,
                    title: "Help & Feedback",
                    trailingIcon: Icons.chevron_right,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              height: 46,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTileOneWidget(
                    leadingIcon: Icons.logout_outlined,
                    title: "Log out",
                    trailingIcon: Icons.chevron_right,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Center(
              child: Text("AI-generated, for reference only. Use legally."),
            ),
          ],
        ),
      ),
    );
  }
}

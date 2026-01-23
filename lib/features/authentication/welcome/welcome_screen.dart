import 'package:flutter/material.dart';
import 'package:deepseek_clone_app/core/common_widgets/elevated_button_widget.dart';
import 'package:deepseek_clone_app/core/common_widgets/animated_widget.dart';
import 'package:deepseek_clone_app/features/authentication/welcome/widgets/circular_check_box_widget.dart';
import '../../../routes/app_paths.dart';
import '../../../routes/navigation_services.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),

        child: Column(
          children: [
            const Spacer(),

            // Logo & Text
            FadeIn(
              delay: 0.2,
              child: Column(
                children: [
                  Image.asset("assets/logo/deepseek_logo.png", height: 52),
                  const SizedBox(height: 8),
                  Image.asset(
                    "assets/logo/deepseek_name.png",
                    height: 42,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),

            const Spacer(),

            // BOTTOM AUTH SECTION
            FadeIn(
              delay: 1.0,
              child: Column(
                children: [
                  ElevatedButtonWidget(
                    text: "Continue with Google",
                    iconPath: "assets/icons/google.png",
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),

                  ElevatedButtonWidget(
                    text: "Continue with Password",
                    iconPath: "assets/icons/lock.png",
                    onTap: () {
                      NavigationServices.push(AppPaths.signIn);
                    },
                  ),
                  const SizedBox(height: 12),

                  ElevatedButtonWidget(text: "Sign Up", onTap: () {
                    NavigationServices.push(AppPaths.signUp);
                  }),
                  const SizedBox(height: 18),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircularCheckboxWidget(
                        initialValue: false,
                        onChanged: (value) {},
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "I confirm that I have read and agree to DeepSeek Terms of Use and Privacy Policy.",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

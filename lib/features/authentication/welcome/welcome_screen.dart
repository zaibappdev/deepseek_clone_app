import 'package:deepseek_clone_app/core/common_widgets/elevated_button_widget.dart';
import 'package:deepseek_clone_app/core/common_widgets/animated_widget.dart';
import 'package:deepseek_clone_app/features/authentication/welcome/widgets/circular_check_box_widget.dart';
import 'package:flutter/material.dart';

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

      // Body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Logo & text
            FadeIn(
              delay: 0.5,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/logo/deepseek_logo.png", height: 42),
                    const SizedBox(height: 6),
                    Image.asset(
                      "assets/logo/deepseek_name.png",
                      height: 42,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),

            /// Auth Forms
            const SizedBox(height: 20),

            // Continue with Google
            FadeIn(
              delay: 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButtonWidget(
                    text: "Continue with Google",
                    iconPath: "assets/icons/google.png",
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Continue with Password
            FadeIn(
              delay: 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButtonWidget(
                    text: "Continue with Password",
                    iconPath: "assets/icons/lock.png",
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // SignUp
            FadeIn(
              delay: 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ElevatedButtonWidget(text: "Sign up", onTap: () {})],
              ),
            ),

            const SizedBox(height: 20),

            // Terms & Conditions
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
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

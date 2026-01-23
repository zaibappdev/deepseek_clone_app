import 'package:flutter/material.dart';
import '../../../core/common_widgets/app_bar_widget.dart';
import '../../../core/common_widgets/elevated_button_widget.dart';
import '../../../routes/app_paths.dart';
import '../../../routes/navigation_services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // App Bar
      appBar: AppBarWidget(
        onBack: () {
          NavigationServices.go(AppPaths.welcome);
        },
        onContact: () {},
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Sign up",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Email
            Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xfff3f3f3),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontSize: 16, color: Colors.black),

                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Password
            Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xfff3f3f3),
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                controller: passwordController,
                obscureText: _obscurePassword,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Password",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.visibility_off,
                      color: Colors.grey,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Confirm Password
            Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xfff3f3f3),
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                controller: confirmController,
                obscureText: _obscurePassword,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Confirm Password",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Code
            Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xfff3f3f3),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: codeController,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Code",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                  ),
                  // vertical line
                  Container(
                    height: 20,
                    width: 2,
                    color: Colors.grey.shade400,
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Send code",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Sign up Button
            ElevatedButtonWidget(
              backgroundColor: Colors.blue,
              text: "Sign up",
              textColor: Colors.white,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

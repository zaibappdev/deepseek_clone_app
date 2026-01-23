import 'package:deepseek_clone_app/core/common_widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import '../../../core/common_widgets/elevated_button_widget.dart';
import '../../../routes/app_paths.dart';
import '../../../routes/navigation_services.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Log in with password",
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
                    hintText: "Email / +92 Phone number",
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

            TextButton(
              onPressed: () {},
              child: const Text(
                "Forget Password?",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Sign up Button
            ElevatedButtonWidget(
              backgroundColor: Colors.blue,
              text: "Log in",
              textColor: Colors.white,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

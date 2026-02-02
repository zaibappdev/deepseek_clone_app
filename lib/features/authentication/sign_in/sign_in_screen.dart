import 'package:deepseek_clone_app/core/common_widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import '../../../core/common_widgets/elevated_button_widget.dart';
import '../../../core/common_widgets/text_field_widget.dart';
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
            TextFieldWidget(
              hintText: "Email / +92 Phone number",
              controller: emailController,
            ),

            const SizedBox(height: 16),

            // Password
            TextFieldWidget(
              hintText: "Password",
              controller: passwordController,
              obscureText: _obscurePassword,
              suffixIcon: _obscurePassword
                  ? Icons.visibility_off
                  : Icons.visibility,
              onSuffixTap: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),

            TextButton(
              onPressed: () {
                NavigationServices.go(AppPaths.resetPassword);
              },
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
              onTap: () {
                NavigationServices.push(AppPaths.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}

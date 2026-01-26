import 'package:flutter/material.dart';
import '../../../core/common_widgets/app_bar_widget.dart';
import '../../../core/common_widgets/code_text_field_widget.dart';
import '../../../core/common_widgets/elevated_button_widget.dart';
import '../../../core/common_widgets/text_field_widget.dart';
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
            TextFieldWidget(hintText: "Email", controller: emailController),

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

            const SizedBox(height: 16),

            // Confirm Password
            TextFieldWidget(
              hintText: "Confirm Password",
              controller: confirmController,
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

            const SizedBox(height: 16),

            // Code
            CodeTextFieldWidget(
              controller: codeController,
              hintText: "Code",
              onSendCode: () {},
            ),

            const SizedBox(height: 30),

            // Sign up Button
            ElevatedButtonWidget(
              backgroundColor: Colors.blue,
              text: "Sign up",
              textColor: Colors.white,
              onTap: () {
                NavigationServices.push(AppPaths.signIn);
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../core/common_widgets/app_bar_widget.dart';
import '../../../core/common_widgets/code_text_field_widget.dart';
import '../../../core/common_widgets/elevated_button_widget.dart';
import '../../../core/common_widgets/text_field_widget.dart';
import '../../../routes/app_paths.dart';
import '../../../routes/navigation_services.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // App Bar
      appBar: AppBarWidget(
        onBack: () {
          NavigationServices.push(AppPaths.signIn);
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
                "Reset Password",
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
              text: "Continue",
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

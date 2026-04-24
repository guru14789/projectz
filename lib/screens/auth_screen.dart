import 'package:flutter/material.dart';
import '../widgets/components.dart';
import '../theme/app_theme.dart';

class AuthScreen extends StatelessWidget {
  final VoidCallback onDone;
  const AuthScreen({super.key, required this.onDone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double hPadding = constraints.maxWidth > 500 ? (constraints.maxWidth - 400) / 2 : 32;
          
          return Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(child: Text('🐼', style: TextStyle(fontSize: 48))),
                  const SizedBox(height: 40),
                  Text('Welcome back!', style: AppTextStyles.displayLarge),
                  const SizedBox(height: 8),
                  Text('Sign in to continue to WorkPanda',
                      style: AppTextStyles.bodyLarge),
                  const SizedBox(height: 48),
                  const AppInput(
                      placeholder: 'college email', icon: Icons.email_outlined),
                  const SizedBox(height: 16),
                  const AppInput(
                      placeholder: 'password',
                      icon: Icons.lock_outline,
                      obscure: true),
                  const SizedBox(height: 32),
                  AppButton(label: 'Sign In', fullWidth: true, onTap: onDone),
                  const SizedBox(height: 24),
                  Center(
                    child: Text('Forgot Password?', style: AppTextStyles.labelBold),
                  ),
                  const SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('New here? ', style: AppTextStyles.bodyMedium),
                      Text('Create Account', style: AppTextStyles.labelBold),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

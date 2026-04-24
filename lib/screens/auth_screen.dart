import 'package:flutter/material.dart';
import '../widgets/components.dart';
import '../theme/app_theme.dart';

class AuthScreen extends StatelessWidget {
  final VoidCallback onDone;
  const AuthScreen({super.key, required this.onDone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const Spacer(),
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
      ),
    );
  }
}

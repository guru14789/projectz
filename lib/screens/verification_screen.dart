import 'package:flutter/material.dart';
import '../widgets/components.dart';
import '../theme/app_theme.dart';

class VerificationScreen extends StatelessWidget {
  final VoidCallback onDone;
  const VerificationScreen({super.key, required this.onDone});

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
              Text('Verification', style: AppTextStyles.displayLarge),
              const SizedBox(height: 8),
              Text('We sent a code to your college email.',
                  style: AppTextStyles.bodyLarge),
              const SizedBox(height: 48),
              const AppInput(placeholder: '000 000', icon: Icons.security),
              const SizedBox(height: 40),
              AppButton(
                  label: 'Verify & Continue', fullWidth: true, onTap: onDone),
              const SizedBox(height: 32),
              Center(
                child:
                    Text('Resend Code (45s)', style: AppTextStyles.bodyMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

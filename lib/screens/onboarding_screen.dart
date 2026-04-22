import 'package:flutter/material.dart';
import '../widgets/components.dart';
import '../theme/app_theme.dart';

class OnboardingScreen extends StatelessWidget {
  final VoidCallback onDone;
  const OnboardingScreen({super.key, required this.onDone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text('Welcome to', style: AppTextStyles.headingMedium),
              Text('WorkPanda', style: AppTextStyles.displayLarge),
              Text('student marketplace', style: AppTextStyles.headingMedium.copyWith(fontWeight: FontWeight.w400)),
              
              const Spacer(),
              
              // Central Sketch Illustration
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 280, height: 280,
                      decoration: BoxDecoration(
                        color: AppColors.grayBg,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.black, width: 2),
                      ),
                    ),
                    const Text('🐼', style: TextStyle(fontSize: 140)),
                    Positioned(
                      bottom: 0, right: 20,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.black, width: 2),
                        ),
                        child: const Icon(Icons.school_outlined, size: 32),
                      ),
                    ),
                  ],
                ),
              ),
              
              const Spacer(),
              
              Center(
                child: AppButton(
                  label: 'Get started',
                  onTap: onDone,
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

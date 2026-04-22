import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onDone;
  const SplashScreen({super.key, required this.onDone});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), widget.onDone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.black, width: 3),
              ),
              child: const Text('🐼', style: TextStyle(fontSize: 80)),
            ),
            const SizedBox(height: 32),
            Text(
              'WORKPANDA',
              style: AppTextStyles.displayLarge.copyWith(letterSpacing: 2),
            ),
            const SizedBox(height: 8),
            const Text(
              'GIGS FOR STUDENTS',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 12,
                color: AppColors.black,
                letterSpacing: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

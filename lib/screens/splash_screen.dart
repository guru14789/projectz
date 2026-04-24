import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/panda_loader.dart';

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
    // Slightly longer delay for the beautiful animation
    Future.delayed(const Duration(seconds: 4), widget.onDone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PandaLoader(size: 140),
            const SizedBox(height: 60),
            Image.asset(
              'assets/images/logo.png',
              width: 200,
              errorBuilder: (ctx, _, __) => Text(
                'WORKPANDA',
                style: AppTextStyles.displayLarge.copyWith(letterSpacing: 2),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'GIGS FOR STUDENTS',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 10,
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

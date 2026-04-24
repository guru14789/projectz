import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/components.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onSettings;
  const ProfileScreen({super.key, required this.onSettings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('PROFILE', style: AppTextStyles.labelBold.copyWith(letterSpacing: 4)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: AppColors.black),
            onPressed: onSettings,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            _buildProfileAvatar(),
            const SizedBox(height: 48),
            _buildProfessionalStats(),
            const SizedBox(height: 56),
            _buildProfileMenu(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return Column(
      children: [
        Container(
          width: 140,
          height: 140,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.black, width: 1.5),
          ),
          child: const CircleAvatar(
            backgroundColor: AppColors.black,
            child: PandaLogo(size: 80),
          ),
        ).animate().scale(duration: 800.ms, curve: Curves.easeOutBack),
        const SizedBox(height: 24),
        Text(
          'SURESH KUMAR',
          style: AppTextStyles.displayLarge.copyWith(fontSize: 24, letterSpacing: 1),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.offWhite,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColors.silver),
          ),
          child: Text(
            'ANNA UNIVERSITY · YEAR 3',
            style: AppTextStyles.labelBold.copyWith(fontSize: 9, color: AppColors.slate),
          ),
        ),
      ],
    );
  }

  Widget _buildProfessionalStats() {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _statTile('12', 'GIGS COMPLETED'),
          const VerticalDivider(),
          _statTile('4.9', 'RATING'),
          const VerticalDivider(),
          _statTile('₹15k', 'EST. REVENUE'),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms);
  }

  Widget _statTile(String value, String label) {
    return Column(
      children: [
        Text(value, style: AppTextStyles.headingLarge.copyWith(fontSize: 20)),
        const SizedBox(height: 4),
        Text(label, style: AppTextStyles.labelBold.copyWith(fontSize: 8, color: AppColors.slate)),
      ],
    );
  }

  Widget _buildProfileMenu() {
    return Column(
      children: [
        _profileMenuItem('My Portfolio', Icons.grid_view_rounded),
        _profileMenuItem('Verified Status', Icons.verified_user_outlined),
        _profileMenuItem('Billing History', Icons.receipt_long_outlined),
        _profileMenuItem('Support Center', Icons.help_outline_rounded),
        const SizedBox(height: 16),
        _profileMenuItem('LOGOUT', Icons.logout_rounded, isDestructive: true),
      ],
    );
  }

  Widget _profileMenuItem(String title, IconData icon, {bool isDestructive = false}) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isDestructive ? Colors.red.withOpacity(0.1) : AppColors.black.withOpacity(0.05)
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.02),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon, 
              size: 20, 
              color: isDestructive ? Colors.red : AppColors.black
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title.toUpperCase(),
                style: AppTextStyles.labelBold.copyWith(
                  fontSize: 11,
                  color: isDestructive ? Colors.red : AppColors.black,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded, 
              size: 16, 
              color: isDestructive ? Colors.red.withOpacity(0.3) : AppColors.slate
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 600.ms).slideX(begin: 0.1, end: 0);
  }
}

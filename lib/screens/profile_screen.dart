import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onSettings;
  const ProfileScreen({super.key, required this.onSettings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEAE6), // Ivory
      appBar: AppBar(
        backgroundColor: const Color(0xFFEDEAE6),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'PROFILE',
          style: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: Colors.black,
            letterSpacing: 4,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.black),
            onPressed: onSettings,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildProfileHeader(),
            const SizedBox(height: 48),
            _buildStats(),
            const SizedBox(height: 48),
            _buildMenu(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black.withOpacity(0.05), width: 1),
          ),
          child: const CircleAvatar(
            backgroundColor: Color(0xFF111111),
            child: Text('🐾', style: TextStyle(fontSize: 48)),
          ),
        ).animate().scale(duration: 600.ms, curve: Curves.easeOutBack),
        const SizedBox(height: 24),
        Text(
          'SURESH KUMAR',
          style: GoogleFonts.outfit(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: Colors.black,
            letterSpacing: 1,
            height: 1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'ANNA UNIVERSITY · YEAR 3',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.black.withOpacity(0.4),
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.black.withOpacity(0.03)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _statItem('12', 'GIGS'),
          _divider(),
          _statItem('4.9', 'RATING'),
          _divider(),
          _statItem('₹15k', 'EARNED'),
        ],
      ),
    ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1, end: 0);
  }

  Widget _divider() => Container(width: 1, height: 30, color: Colors.black12);

  Widget _statItem(String value, String label) {
    return Column(
      children: [
        Text(value, style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.black)),
        Text(label, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w800, color: Colors.black38, letterSpacing: 1)),
      ],
    );
  }

  Widget _buildMenu() {
    return Column(
      children: [
        _menuItem('My Gigs', Icons.assignment_outlined),
        _menuItem('Verification Status', Icons.verified_user_outlined),
        _menuItem('Support & FAQs', Icons.help_outline_rounded),
        _menuItem('Logout', Icons.logout_rounded, isDestructive: true),
      ],
    );
  }

  Widget _menuItem(String title, IconData icon, {bool isDestructive = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 22, color: isDestructive ? Colors.redAccent : Colors.black),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: isDestructive ? Colors.redAccent : Colors.black,
              ),
            ),
          ),
          Icon(Icons.chevron_right, size: 18, color: Colors.black.withOpacity(0.2)),
        ],
      ),
    ).animate().fadeIn(delay: 500.ms).slideX(begin: 0.1, end: 0);
  }
}

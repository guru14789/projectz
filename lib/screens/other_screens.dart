import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/components.dart';

// ─── CHAT SCREEN ────────────────────────────────────────────────
class ChatScreen extends StatelessWidget {
  final VoidCallback onBack;
  const ChatScreen({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        leading:
            IconButton(icon: const Icon(Icons.arrow_back), onPressed: onBack),
        title: const Text('CHAT'),
        elevation: 0,
        backgroundColor: const Color(0xFF111111),
      ),
      body: const Center(
          child: Text('Messages Coming Soon', style: TextStyle(color: Colors.white))),
    );
  }
}


// ─── SETTINGS SCREEN ────────────────────────────────────────────
class SettingsScreen extends StatelessWidget {
  final VoidCallback onBack;
  const SettingsScreen({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Settings'),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back), onPressed: onBack)),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _settingItem('Account Settings'),
          _settingItem('Privacy & Security'),
          _settingItem('Payment Methods'),
          _settingItem('Help & Support'),
          const SizedBox(height: 40),
          AppButton(
              label: 'Log Out', primary: false, fullWidth: true, onTap: () {}),
        ],
      ),
    );
  }

  Widget _settingItem(String label) => Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.black, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style:
                    const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
            const Icon(Icons.chevron_right),
          ],
        ),
      );
}

// ─── APPLICATIONS SCREEN ────────────────────────────────────────
class ApplicationsScreen extends StatelessWidget {
  final VoidCallback onBack;
  const ApplicationsScreen({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Applications'),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back), onPressed: onBack)),
      body: const Center(child: Text('No applications yet.')),
    );
  }
}

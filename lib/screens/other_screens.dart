import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/components.dart';

// ─── WALLET SCREEN ──────────────────────────────────────────────
class WalletScreen extends StatelessWidget {
  WalletScreen({super.key});

  final _txns = [
    {'type': 'credit', 'desc': 'Payment for Logo Design', 'amount': '+₹768', 'time': 'Today, 2:30 PM', 'status': 'completed'},
    {'type': 'debit', 'desc': 'Job Escrow – Python Help', 'amount': '-₹300', 'time': 'Yesterday, 11:00 AM', 'status': 'locked'},
    {'type': 'credit', 'desc': 'PDF Conversion Task', 'amount': '+₹48', 'time': 'Yesterday, 9:15 AM', 'status': 'completed'},
    {'type': 'withdrawal', 'desc': 'Withdrawal to UPI', 'amount': '-₹500', 'time': 'Dec 18, 4:00 PM', 'status': 'completed'},
    {'type': 'credit', 'desc': 'Research References Task', 'amount': '+₹115', 'time': 'Dec 17, 1:30 PM', 'status': 'completed'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: _buildHeader()),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverToBoxAdapter(child: Text('Recent Transactions', style: AppTextStyles.headingMedium)),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverList(delegate: SliverChildBuilderDelegate(
            (ctx, i) => _TxnRow(txn: _txns[i]),
            childCount: _txns.length,
          )),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 40)),
      ]),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 56, 24, 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Wallet', style: AppTextStyles.headingLarge),
        const SizedBox(height: 20),

        // Balance card
        AppCard(
          padding: 24,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('AVAILABLE BALANCE', style: AppTextStyles.labelBold),
            const SizedBox(height: 8),
            Text('₹1,240', style: AppTextStyles.displayLarge),
            const SizedBox(height: 16),
            const Row(children: [
               Expanded(child:  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('In Escrow', style: TextStyle(color: AppColors.subtle, fontSize: 12)),
                Text('₹300', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
              ])),
              Expanded(child:  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Total Earned', style: TextStyle(color: AppColors.subtle, fontSize: 12)),
                Text('₹4,820', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
              ])),
            ]),
          ]),
        ),
        const SizedBox(height: 20),
      ]),
    );
  }
}

class _TxnRow extends StatelessWidget {
  final Map<String, String> txn;
  const _TxnRow({required this.txn});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.black, width: 1))),
      child: Row(children: [
        Container(width: 40, height: 40, decoration: BoxDecoration(color: AppColors.grayBg, border: Border.all(color: AppColors.black, width: 1.5), borderRadius: BorderRadius.circular(10)),
          child: const Icon(Icons.arrow_downward_rounded, size: 18, color: AppColors.black)),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(txn['desc']!, style: AppTextStyles.labelBold),
          Text(txn['time']!, style: AppTextStyles.bodyMedium),
        ])),
        Text(txn['amount']!, style: AppTextStyles.headingMedium),
      ]),
    );
  }
}

// ─── CHAT SCREEN ────────────────────────────────────────────────
class ChatScreen extends StatelessWidget {
  final VoidCallback onBack;
  const ChatScreen({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: onBack),
        title: Text('Chat', style: AppTextStyles.headingMedium),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Divider(height: 2, color: AppColors.black, thickness: 2),
        ),
      ),
      body: Center(child: Text('Messages Coming Soon', style: AppTextStyles.bodyLarge)),
    );
  }
}

// ─── DISCOVER SCREEN ────────────────────────────────────────────
class DiscoverScreen extends StatelessWidget {
  final VoidCallback onJobTap;
  const DiscoverScreen({super.key, required this.onJobTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover', style: AppTextStyles.headingLarge),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const AppInput(placeholder: 'Search university gigs', icon: Icons.search),
          const SizedBox(height: 24),
          JobListCard(title: 'Exam Prep Help', budget: '1500', emoji: '📖', college: 'BIT Mesra', onTap: onJobTap),
          JobListCard(title: 'Poster Design', budget: '800', emoji: '🎨', college: 'Symbiosis Pune', onTap: onJobTap),
        ],
      ),
    );
  }
}

// ─── PROFILE SCREEN ─────────────────────────────────────────────
class ProfileScreen extends StatelessWidget {
  final VoidCallback onSettings;
  const ProfileScreen({super.key, required this.onSettings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Profile', style: AppTextStyles.headingLarge),
                  IconButton(icon: const Icon(Icons.settings), onPressed: onSettings),
                ],
              ),
              const SizedBox(height: 24),
              AppCard(
                child: Row(
                  children: [
                    const PandaLogo(size: 80),
                    const SizedBox(width: 20),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Arjun Sharma', style: AppTextStyles.headingMedium),
                        Text('IIT Madras · 3rd Year', style: AppTextStyles.bodyMedium),
                      ],
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Text('Skills', style: AppTextStyles.headingMedium),
              const SizedBox(height: 12),
              const Wrap(spacing: 8, runSpacing: 8, children: [
                 _SkillBadge(label: 'Design'),
                 _SkillBadge(label: 'Figma'),
                 _SkillBadge(label: 'Coding'),
              ]),
              const SizedBox(height: 32),
              AppButton(label: 'Share Portfolio', fullWidth: true, onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillBadge extends StatelessWidget {
  final String label;
  const _SkillBadge({required this.label});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: AppColors.white,
      border: Border.all(color: AppColors.black, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
  );
}

// ─── SETTINGS SCREEN ────────────────────────────────────────────
class SettingsScreen extends StatelessWidget {
  final VoidCallback onBack;
  const SettingsScreen({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: onBack)),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _settingItem('Account Settings'),
          _settingItem('Privacy & Security'),
          _settingItem('Payment Methods'),
          _settingItem('Help & Support'),
          const SizedBox(height: 40),
          AppButton(label: 'Log Out', primary: false, fullWidth: true, onTap: () {}),
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
        Text(label, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
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
      appBar: AppBar(title: const Text('Applications'), leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: onBack)),
      body: const Center(child: Text('No applications yet.')),
    );
  }
}

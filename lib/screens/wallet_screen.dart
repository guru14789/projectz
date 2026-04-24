import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/components.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('WALLET', style: AppTextStyles.labelBold.copyWith(letterSpacing: 4)),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline_rounded, color: AppColors.black),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            _buildBalanceCard(),
            const SizedBox(height: 56),
            Text(
              'RECENT TRANSACTIONS',
              style: AppTextStyles.labelBold.copyWith(fontSize: 10, color: AppColors.slate),
            ),
            const SizedBox(height: 24),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              separatorBuilder: (c, i) => const Divider(height: 1, color: AppColors.silver),
              itemBuilder: (c, i) => _buildTransactionRow(i),
            ),
            const SizedBox(height: 48),
            AppButton(
              label: 'WITHDRAW FUNDS',
              fullWidth: true,
              onTap: () {},
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.2),
            blurRadius: 40,
            offset: const Offset(0, 20),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AVAILABLE BALANCE',
            style: AppTextStyles.labelBold.copyWith(fontSize: 10, color: AppColors.white.withOpacity(0.5)),
          ),
          const SizedBox(height: 16),
          Text(
            '₹5,420.00',
            style: AppTextStyles.displayLarge.copyWith(color: AppColors.white, fontSize: 44),
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.trending_up_rounded, color: AppColors.white, size: 16),
                const SizedBox(width: 8),
                Text(
                  '+12% THIS SEMESTER',
                  style: AppTextStyles.labelBold.copyWith(fontSize: 9, color: AppColors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn().slideY(begin: 0.1, end: 0);
  }

  Widget _buildTransactionRow(int i) {
    final titles = ['Note Taking Gig', 'Library Helper', 'Weekly Withdrawal', 'API Review'];
    final dates = ['24 APR', '22 APR', '20 APR', '18 APR'];
    final amounts = ['+₹450', '+₹1,200', '-₹2,000', '+₹800'];
    final isNegative = i == 2;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.offWhite,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.silver),
            ),
            child: Icon(
              isNegative ? Icons.north_east_rounded : Icons.south_west_rounded,
              size: 20,
              color: AppColors.black,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titles[i], style: AppTextStyles.headingMedium.copyWith(fontSize: 16)),
                const SizedBox(height: 4),
                Text(dates[i], style: AppTextStyles.labelBold.copyWith(fontSize: 10, color: AppColors.slate)),
              ],
            ),
          ),
          Text(
            amounts[i],
            style: AppTextStyles.headingMedium.copyWith(
              fontSize: 16,
              color: isNegative ? AppColors.slate : AppColors.black,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: (i * 100).ms);
  }
}

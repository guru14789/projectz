import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111111),
        elevation: 0,
        title: Text(
          'WALLET',
          style: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: const Color(0xFFEDEAE6),
            letterSpacing: 4,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'TOTAL BALANCE',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: const Color(0xFFEDEAE6).withOpacity(0.5),
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '₹5,420.00',
              style: GoogleFonts.outfit(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: const Color(0xFFEDEAE6),
                letterSpacing: -1,
              ),
            ).animate().fadeIn().slideX(begin: -0.1, end: 0),
            const SizedBox(height: 48),
            Text(
              'RECENT TRANSACTIONS',
              style: GoogleFonts.outfit(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: const Color(0xFFEDEAE6).withOpacity(0.5),
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                separatorBuilder: (c, i) => const Divider(color: Colors.white12, height: 1),
                itemBuilder: (c, i) => _buildTransactionItem(i),
              ),
            ),
            const SizedBox(height: 24),
            _buildWithdrawButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem(int i) {
    final titles = ['Note Taking Gig', 'Library Helper', 'Withdrawal', 'API Review'];
    final dates = ['24 Apr', '22 Apr', '20 Apr', '18 Apr'];
    final amounts = ['+₹450', '+₹1,200', '-₹2,000', '+₹800'];
    final isNegative = i == 2;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isNegative ? Icons.arrow_outward_rounded : Icons.south_west_rounded,
              color: const Color(0xFFEDEAE6),
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titles[i], style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                Text(dates[i], style: GoogleFonts.inter(fontSize: 12, color: Colors.white.withOpacity(0.4))),
              ],
            ),
          ),
          Text(
            amounts[i],
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: isNegative ? Colors.redAccent : const Color(0xFFEDEAE6),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: (i * 100).ms);
  }

  Widget _buildWithdrawButton() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFEDEAE6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          'WITHDRAW FUNDS',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w900,
            fontSize: 14,
            color: Colors.black,
            letterSpacing: 2,
          ),
        ),
      ),
    ).animate().scale(delay: 500.ms, curve: Curves.easeOutBack);
  }
}

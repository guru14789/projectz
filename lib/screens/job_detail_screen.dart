import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/components.dart';
import '../theme/app_theme.dart';

class JobDetailScreen extends StatefulWidget {
  final VoidCallback onBack;
  const JobDetailScreen({super.key, required this.onBack});

  @override
  State<JobDetailScreen> createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  bool _isApplying = false;

  void _handleApply() async {
    setState(() => _isApplying = true);
    await Future.delayed(const Duration(milliseconds: 1500));
    if (!mounted) return;
    setState(() => _isApplying = false);
    _showSuccessDialog();
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: AppColors.black, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const PandaLogo(size: 80),
              const SizedBox(height: 32),
              Text(
                'APPLICATION SENT',
                style: AppTextStyles.labelBold.copyWith(fontSize: 14, letterSpacing: 4),
              ),
              const SizedBox(height: 16),
              Text(
                'The company has been notified.\nYou will receive a response within 24 hours.',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMedium,
              ),
              const SizedBox(height: 40),
              AppButton(
                label: 'CONTINUE',
                fullWidth: true,
                onTap: () {
                  Navigator.pop(context);
                  widget.onBack();
                },
              ),
            ],
          ),
        ).animate().scale(curve: Curves.easeOutBack),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: widget.onBack,
        ),
        title: Text('DETAILS', style: AppTextStyles.labelBold.copyWith(letterSpacing: 4)),
        actions: [
          IconButton(icon: const Icon(Icons.bookmark_border_rounded, size: 24), onPressed: () {}),
          const SizedBox(width: 16),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double hPadding = constraints.maxWidth > 800 ? (constraints.maxWidth - 700) / 2 + 32 : 32;
          
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: hPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                _buildHeader(),
                const SizedBox(height: 48),
                _buildInfoGrid(),
                const SizedBox(height: 48),
                _buildDetailSection('DESCRIPTION', 
                  'We are seeking a detail-oriented student to curriculum curated academic resources. You will be responsible for synthesizing lecture materials into high-impact visual summaries for your department. Knowledge of Figma or equivalent tools is a plus.'),
                const SizedBox(height: 48),
                _buildDetailSection('REQUIREMENTS', 
                  '• Currently enrolled in a 2nd year or above program\n• Excellent organizational skills\n• Strong command over analytical writing\n• Ability to meet fast-paced semester deadlines'),
                const SizedBox(height: 120),
              ],
            ),
          );
        }
      ),
      bottomNavigationBar: _buildActionPanel(),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            'FEATURED GIG',
            style: AppTextStyles.labelBold.copyWith(color: AppColors.white, fontSize: 10),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Editorial Synthesis\n& Research',
          style: AppTextStyles.displayLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'IIT MADRAS · CHENNAI',
          style: AppTextStyles.labelBold.copyWith(color: AppColors.slate, fontSize: 11),
        ),
      ],
    ).animate().fadeIn().slideY(begin: 0.1, end: 0);
  }

  Widget _buildInfoGrid() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.silver),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _infoItem('BUDGET', '₹800/hr'),
          _infoItem('DURATION', '2 WEEKS'),
          _infoItem('APPLICANTS', '14'),
        ],
      ),
    );
  }

  Widget _infoItem(String label, String value) {
    return Column(
      children: [
        Text(label, style: AppTextStyles.labelBold.copyWith(fontSize: 10, color: AppColors.slate)),
        const SizedBox(height: 8),
        Text(value, style: AppTextStyles.headingMedium.copyWith(fontSize: 16)),
      ],
    );
  }

  Widget _buildDetailSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.labelBold.copyWith(fontSize: 12)),
        const SizedBox(height: 16),
        Text(content, style: AppTextStyles.bodyLarge.copyWith(color: AppColors.charcoal)),
      ],
    );
  }

  Widget _buildActionPanel() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.black.withOpacity(0.05))),
      ),
      child: AppButton(
        label: 'APPLY FOR THIS GIG',
        fullWidth: true,
        loading: _isApplying,
        onTap: _handleApply,
      ),
    );
  }
}

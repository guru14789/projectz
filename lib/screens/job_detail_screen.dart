import 'package:flutter/material.dart';
import '../widgets/components.dart';
import '../theme/app_theme.dart';

class JobDetailScreen extends StatelessWidget {
  final VoidCallback onBack;
  const JobDetailScreen({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: onBack),
        title: Text('Gig Details', style: AppTextStyles.headingMedium),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Center(child: Text('🐾', style: TextStyle(fontSize: 100))),
            const SizedBox(height: 24),
            Text('Academic gig "Note Taking"', style: AppTextStyles.displayLarge.copyWith(fontSize: 28)),
            const SizedBox(height: 8),
            Text('₹400 budget · IIT Madras', style: AppTextStyles.bodyLarge),
            const SizedBox(height: 32),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description', style: AppTextStyles.labelBold),
                  const SizedBox(height: 8),
                  Text(
                    'Looking for a student who attended the ML lecture today to share their notes. Handwritten or digital both are fine.',
                    style: AppTextStyles.bodyLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text('About the Poster', style: AppTextStyles.headingMedium),
            const SizedBox(height: 12),
            AppCard(
               outlined: false,
               child: Row(
                children: [
                  const PandaLogo(size: 40),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Suresh Kumar', style: AppTextStyles.labelBold),
                      Text('4.9 ratings · 12 gigs posted', style: AppTextStyles.bodyMedium),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(top: BorderSide(color: AppColors.black, width: 2)),
        ),
        child: SafeArea(child: AppButton(label: 'Apply for Gig', fullWidth: true, onTap: () {})),
      ),
    );
  }
}

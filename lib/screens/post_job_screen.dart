import 'package:flutter/material.dart';
import '../widgets/components.dart';
import '../theme/app_theme.dart';

class PostJobScreen extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onPosted;
  const PostJobScreen({super.key, required this.onBack, required this.onPosted});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.close), onPressed: onBack),
        title: Text('Post a Gig', style: AppTextStyles.headingMedium),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What do you need help with?', style: AppTextStyles.headingLarge),
            const SizedBox(height: 32),
            const AppInput(placeholder: 'Gig title (e.g. Logo Design)', icon: Icons.title),
            const SizedBox(height: 16),
            const AppInput(placeholder: 'Budget (₹)', icon: Icons.currency_rupee),
            const SizedBox(height: 16),
            const AppInput(placeholder: 'Category', icon: Icons.category_outlined),
            const SizedBox(height: 16),
            const AppCard(
              padding: 0,
              child: TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Describe the gig details...',
                  contentPadding: EdgeInsets.all(16),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text('Urgency', style: AppTextStyles.labelBold),
            const SizedBox(height: 12),
            Row(
              children: [
                _urgencyItem('Low', true),
                const SizedBox(width: 12),
                _urgencyItem('Medium', false),
                const SizedBox(width: 12),
                _urgencyItem('Urgent', false),
              ],
            ),
            const SizedBox(height: 60),
            AppButton(label: 'Post to Campus', fullWidth: true, onTap: onPosted),
          ],
        ),
      ),
    );
  }

  Widget _urgencyItem(String label, bool active) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: active ? AppColors.black : AppColors.white,
          border: Border.all(color: AppColors.black, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: active ? AppColors.white : AppColors.black,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}

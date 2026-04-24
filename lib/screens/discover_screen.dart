import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class DiscoverScreen extends StatelessWidget {
  final VoidCallback onJobTap;
  const DiscoverScreen({super.key, required this.onJobTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('DISCOVER', style: AppTextStyles.labelBold.copyWith(letterSpacing: 4)),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded, color: AppColors.black),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: _buildSearchBar(),
            ),
            const SizedBox(height: 40),
            _buildCategories(),
            const SizedBox(height: 48),
            _buildSectionHeader('TRENDING GIGS'),
            const SizedBox(height: 24),
            _buildMasonryGrid(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.black.withOpacity(0.05)),
      ),
      child: TextField(
        style: const TextStyle(color: AppColors.black),
        decoration: InputDecoration(
          hintText: 'Search for campus gigs...',
          hintStyle: GoogleFonts.inter(color: AppColors.slate.withOpacity(0.3), fontSize: 16),
          icon: const Icon(Icons.search, color: AppColors.black, size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    ).animate().fadeIn().slideY(begin: 0.1, end: 0);
  }

  Widget _buildCategories() {
    final categories = ['ALL', 'DESIGN', 'CODE', 'WRITING', 'LABS'];
    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (c, i) => const SizedBox(width: 12),
        itemBuilder: (c, i) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(
            color: i == 0 ? AppColors.black : AppColors.white,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColors.black, width: 1),
          ),
          child: Center(
            child: Text(
              categories[i],
              style: AppTextStyles.labelBold.copyWith(
                fontSize: 10,
                color: i == 0 ? AppColors.white : AppColors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        title,
        style: AppTextStyles.labelBold.copyWith(fontSize: 10, color: AppColors.slate),
      ),
    );
  }

  Widget _buildMasonryGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: 4,
        itemBuilder: (c, i) => _buildDiscoveryCard(i),
      ),
    );
  }

  Widget _buildDiscoveryCard(int i) {
    final titles = ['UI Design', 'API Helper', 'Report Prep', 'Lab Assistant'];
    final colleges = ['IIT Madras', 'Anna Univ', 'MU Campus', 'Sathyabama'];
    final emojies = ['✨', '⚙️', '📝', '🧪'];

    return GestureDetector(
      onTap: onJobTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: i % 3 == 0 ? AppColors.black : AppColors.white,
          borderRadius: BorderRadius.circular(32),
          border: i % 3 != 0 ? Border.all(color: AppColors.black.withOpacity(0.1)) : null,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.04),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(emojies[i], style: const TextStyle(fontSize: 28)),
            const Spacer(),
            Text(
              titles[i],
              style: AppTextStyles.headingMedium.copyWith(
                fontSize: 16,
                color: i % 3 == 0 ? AppColors.white : AppColors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              colleges[i].toUpperCase(),
              style: AppTextStyles.labelBold.copyWith(
                fontSize: 9, 
                color: i % 3 == 0 ? AppColors.white.withOpacity(0.5) : AppColors.slate
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: (i * 100).ms).scale(begin: const Offset(0.9, 0.9));
  }
}

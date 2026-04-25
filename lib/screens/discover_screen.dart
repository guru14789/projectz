import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/components.dart';

class DiscoverScreen extends StatelessWidget {
  final VoidCallback onJobTap;
  const DiscoverScreen({super.key, required this.onJobTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        final double hPadding =
            constraints.maxWidth > 900 ? (constraints.maxWidth - 850) / 2 : 0;
        final int crossAxisCount = constraints.maxWidth > 900
            ? 4
            : (constraints.maxWidth > 600 ? 3 : 2);

        return Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: hPadding),
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
                    _buildFeaturedSection(),
                    const SizedBox(height: 56),
                    _buildSectionHeader('TRENDING GIGS'),
                    const SizedBox(height: 24),
                    _buildMasonryGrid(crossAxisCount),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 20),
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('DISCOVER',
              style: AppTextStyles.labelBold.copyWith(letterSpacing: 4, fontSize: 13)),
          IconButton(
            icon: const Icon(Icons.filter_list_rounded, color: AppColors.black),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.black.withValues(alpha: 0.05)),
      ),
      child: TextField(
        style: const TextStyle(color: AppColors.black),
        decoration: InputDecoration(
          hintText: 'Search for campus gigs...',
          hintStyle: GoogleFonts.inter(
              color: AppColors.slate.withValues(alpha: 0.3), fontSize: 16),
          icon: const Icon(Icons.search, color: AppColors.black, size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    ).animate().fadeIn().slideY(begin: 0.1, end: 0);
  }

  Widget _buildCategories() {
    final categories = [
      {'label': 'ALL', 'icon': Icons.grid_view_rounded},
      {'label': 'DESIGN', 'icon': Icons.palette_outlined},
      {'label': 'CODE', 'icon': Icons.code_rounded},
      {'label': 'WRITING', 'icon': Icons.edit_note_rounded},
      {'label': 'LABS', 'icon': Icons.science_outlined},
    ];
    
    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (c, i) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final isFirst = index == 0;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: isFirst ? AppColors.black : AppColors.white,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: isFirst ? AppColors.black : AppColors.silver,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(categories[index]['icon'] as IconData, 
                  size: 14, 
                  color: isFirst ? AppColors.white : AppColors.black),
                const SizedBox(width: 8),
                Text(
                  categories[index]['label'] as String,
                  style: AppTextStyles.labelBold.copyWith(
                    fontSize: 10,
                    color: isFirst ? AppColors.white : AppColors.black,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeaturedSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('CURATED FOR YOU'),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                image: const NetworkImage('https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?q=80&w=2564&auto=format&fit=crop'),
                fit: BoxFit.cover,
                opacity: 0.4,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text('VERIFIED PARTNER', style: AppTextStyles.labelBold.copyWith(fontSize: 8, color: AppColors.white)),
                ),
                const SizedBox(height: 24),
                Text('Editorial Lead\nfor IIT Madras', style: AppTextStyles.displayLarge.copyWith(color: AppColors.white, fontSize: 32, height: 1.1)),
                const SizedBox(height: 16),
                Text('Assist the research department in building the next generation of academic journals.', 
                  style: AppTextStyles.bodyMedium.copyWith(color: AppColors.silver.withValues(alpha: 0.7))),
                const SizedBox(height: 32),
                AppButton(
                  label: 'VIEW DETAILS',
                  primary: false,
                  onTap: onJobTap,
                ),
              ],
            ),
          ).animate().fadeIn(duration: 800.ms).scale(begin: const Offset(0.98, 0.98)),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        title,
        style: AppTextStyles.labelBold
            .copyWith(fontSize: 11, color: AppColors.slate, letterSpacing: 3),
      ),
    );
  }

  Widget _buildMasonryGrid(int crossAxisCount) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          final titles = ['Design Review', 'Lab Assistant', 'Case Study', 'Web Support', 'Data Mining', 'UI Audit'];
          final emojis = ['🎨', '🧪', '📊', '🌐', '🔍', '📱'];
          return _buildGridCard(titles[index], emojis[index]);
        },
      ),
    );
  }

  Widget _buildGridCard(String title, String emoji) {
    return GestureDetector(
      onTap: onJobTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.offWhite,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: AppColors.black.withValues(alpha: 0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 32)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title.toUpperCase(), 
                  style: AppTextStyles.labelBold.copyWith(fontSize: 12, height: 1.2)),
                const SizedBox(height: 8),
                Text('₹400 / HR', 
                  style: AppTextStyles.bodyMedium.copyWith(color: AppColors.slate, fontWeight: FontWeight.bold, fontSize: 10)),
              ],
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1, end: 0);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/components.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onJobTap;
  final VoidCallback onPostTap;
  const HomeScreen(
      {super.key, required this.onJobTap, required this.onPostTap});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isLarge = constraints.maxWidth > 900;
        final double hPadding = isLarge ? (constraints.maxWidth - 900) / 2 + 40 : 24;

        return Scaffold(
          backgroundColor: AppColors.white,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _buildAppBar(hPadding),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: hPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      _buildWelcomeText(),
                      const SizedBox(height: 32),
                      _buildSearchField(),
                      const SizedBox(height: 48),
                      _buildSectionHeader('CURATED OPPORTUNITIES'),
                      const SizedBox(height: 24),
                      _buildFeaturedList(constraints.maxWidth),
                      const SizedBox(height: 48),
                      _buildSectionHeader('INDUSTRIES'),
                      const SizedBox(height: 24),
                      _buildCategoryChips(),
                      const SizedBox(height: 48),
                      _buildSectionHeader('ACTIVE FEED'),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: hPadding),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    JobListCard(title: 'Library Curator', budget: '₹450/hr', emoji: '📚', college: 'Anna University', onTap: onJobTap),
                    JobListCard(title: 'Panda Researcher', budget: '₹1.2k', emoji: '🐼', college: 'MU Campus', onTap: onJobTap),
                    JobListCard(title: 'Draft Assistant', budget: '₹800', emoji: '🖋️', college: 'IIT Madras', onTap: onJobTap),
                    JobListCard(title: 'Lab Assistant', budget: '₹500', emoji: '🧪', college: 'Sathyabama', onTap: onJobTap),
                    const SizedBox(height: 100),
                  ]),
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  Widget _buildAppBar(double hPadding) {
    return SliverAppBar(
      backgroundColor: AppColors.white.withOpacity(0.9),
      floating: true,
      pinned: true,
      elevation: 0,
      centerTitle: false,
      title: Text(
        'WORKPANDA',
        style: AppTextStyles.labelBold.copyWith(letterSpacing: 4),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: hPadding),
          child: const CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.black,
            child: Text('SK', style: TextStyle(color: AppColors.white, fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good Morning,',
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.slate),
        ),
        Text(
          'FIND YOUR FOCUS',
          style: AppTextStyles.displayLarge,
        ),
      ],
    ).animate().fadeIn().slideX(begin: -0.1, end: 0);
  }

  Widget _buildSearchField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.black.withOpacity(0.05)),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search gigs, companies, roles...',
          hintStyle: GoogleFonts.inter(color: AppColors.slate.withOpacity(0.4), fontSize: 14),
          icon: const Icon(Icons.search, color: AppColors.black, size: 20),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.labelBold.copyWith(color: AppColors.slate, fontSize: 10)),
        const Icon(Icons.arrow_right_alt, size: 20, color: AppColors.slate),
      ],
    );
  }

  Widget _buildFeaturedList(double screenWidth) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: 3,
        separatorBuilder: (c, i) => const SizedBox(width: 20),
        itemBuilder: (c, i) => _buildPremiumCard(i, screenWidth),
      ),
    );
  }

  Widget _buildPremiumCard(int index, double screenWidth) {
    final titles = ['UX DESIGN', 'ML RESEARCH', 'COPYWRITING'];
    final emojies = ['✨', '🧬', '✍️'];
    
    return Container(
      width: screenWidth < 600 ? 300 : 400,
      decoration: BoxDecoration(
        color: index % 2 == 0 ? AppColors.black : AppColors.white,
        borderRadius: BorderRadius.circular(40),
        border: index % 2 != 0 ? Border.all(color: AppColors.black, width: 1.5) : null,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 15),
          )
        ],
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(emojies[index % emojies.length], style: const TextStyle(fontSize: 32)),
              Icon(
                Icons.arrow_outward_rounded, 
                color: index % 2 == 0 ? AppColors.white : AppColors.black
              ),
            ],
          ),
          const Spacer(),
          Text(
            titles[index % titles.length],
            style: AppTextStyles.headingLarge.copyWith(
              color: index % 2 == 0 ? AppColors.white : AppColors.black,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'High payout student gig available at Anna University.',
            style: AppTextStyles.bodyMedium.copyWith(
              color: index % 2 == 0 ? AppColors.white.withOpacity(0.6) : AppColors.charcoal,
              fontSize: 12
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: (index * 200).ms).scale(begin: const Offset(0.95, 0.95));
  }

  Widget _buildCategoryChips() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _industryChip('Research'),
        _industryChip('Creative'),
        _industryChip('Tech'),
        _industryChip('Writing'),
        _industryChip('Logistics'),
      ],
    );
  }

  Widget _industryChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.black, width: 1),
      ),
      child: Text(
        label.toUpperCase(),
        style: AppTextStyles.labelBold.copyWith(fontSize: 10),
      ),
    );
  }
}

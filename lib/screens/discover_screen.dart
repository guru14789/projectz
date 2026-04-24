import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscoverScreen extends StatelessWidget {
  final VoidCallback onJobTap;
  const DiscoverScreen({super.key, required this.onJobTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111111),
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios_new, color: Color(0xFFEDEAE6), size: 20),
        title: Text(
          'DISCOVER',
          style: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: const Color(0xFFEDEAE6),
            letterSpacing: 4,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune_rounded, color: Color(0xFFEDEAE6)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildSearchBar(),
            const SizedBox(height: 32),
            _buildCategories(),
            const SizedBox(height: 40),
            _buildGrid(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search for campus gigs...',
          hintStyle: GoogleFonts.inter(color: Colors.white.withOpacity(0.3), fontSize: 14),
          icon: const Icon(Icons.search, color: Colors.white30, size: 20),
          border: InputBorder.none,
        ),
      ),
    ).animate().fadeIn().slideY(begin: 0.1, end: 0);
  }

  Widget _buildCategories() {
    final categories = ['All', 'Design', 'Code', 'Writing', 'Labs'];
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (c, i) => const SizedBox(width: 12),
        itemBuilder: (c, i) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: i == 0 ? const Color(0xFFEDEAE6) : Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: const Color(0xFFEDEAE6).withOpacity(0.3)),
          ),
          child: Text(
            categories[i],
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: i == 0 ? Colors.black : const Color(0xFFEDEAE6),
            ),
          ),
        ),
      ),
    ).animate().fadeIn(delay: 200.ms);
  }

  Widget _buildGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: 4,
      itemBuilder: (c, i) => _buildJobCard(i),
    );
  }

  Widget _buildJobCard(int i) {
    final titles = ['UI Design', 'API Helper', 'Report Prep', 'Lab Assistant'];
    final emojies = ['🎨', '⚙️', '📝', '🧪'];
    return GestureDetector(
      onTap: onJobTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1D1D1D),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(emojies[i], style: const TextStyle(fontSize: 28)),
            const Spacer(),
            Text(
              titles[i],
              style: GoogleFonts.outfit(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '₹600/hr',
              style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFFEDEAE6).withOpacity(0.6)),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: (i * 100).ms).scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1));
  }
}

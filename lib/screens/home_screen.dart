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
    return Scaffold(
      backgroundColor: const Color(0xFF111111), // Midnight Black
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildSearchSection(),
                  const SizedBox(height: 40),
                  _buildSectionHeader('FEATURED GIGS'),
                  const SizedBox(height: 20),
                  _buildFeaturedCarousel(),
                  const SizedBox(height: 40),
                  _buildSectionHeader('CATEGORIES'),
                  const SizedBox(height: 20),
                  _buildCategoryGrid(),
                  const SizedBox(height: 40),
                  _buildSectionHeader('LIVE JOB FEED'),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildJobCard('Library Curator', '₹450/hr', '📚', 'Anna University'),
                _buildJobCard('Panda Researcher', '₹1.2k', '🐼', 'MU Campus'),
                _buildJobCard('Draft Assistant', '₹800', '🖋️', 'IIT Madras'),
                _buildJobCard('Lab Assistant', '₹500', '🧪', 'Sathyabama'),
                const SizedBox(height: 100),
              ]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPostTap,
        backgroundColor: const Color(0xFFEDEAE6), // Ivory
        child: const Icon(Icons.add_rounded, color: Colors.black, size: 30),
      ).animate().scale(delay: 1.seconds, duration: 500.ms, curve: Curves.easeOutBack),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      backgroundColor: const Color(0xFF111111),
      floating: true,
      pinned: true,
      expandedHeight: 80,
      centerTitle: false,
      title: Text(
        'WORKPANDA',
        style: GoogleFonts.outfit(
          fontSize: 16,
          fontWeight: FontWeight.w900,
          color: const Color(0xFFEDEAE6),
          letterSpacing: 4,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFFEDEAE6),
            child: const Text('SK', style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1D1D),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'What are you looking for?',
          hintStyle: GoogleFonts.inter(color: Colors.white.withOpacity(0.4), fontSize: 14),
          icon: const Icon(Icons.search, color: Colors.white, size: 20),
          border: InputBorder.none,
        ),
      ),
    ).animate().fadeIn(duration: 600.ms).moveX(begin: -20, end: 0);
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.outfit(
        fontSize: 12,
        fontWeight: FontWeight.w900,
        color: const Color(0xFFEDEAE6).withOpacity(0.5),
        letterSpacing: 2,
      ),
    );
  }

  Widget _buildFeaturedCarousel() {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: 3,
        separatorBuilder: (c, i) => const SizedBox(width: 16),
        itemBuilder: (c, i) => _buildFeaturedCard(i),
      ),
    );
  }

  Widget _buildFeaturedCard(int index) {
    final titles = ['GRAPHIC DESIGN', 'NOTE TAKING', 'DATA ENTRY'];
    final emojies = ['🎨', '📝', '💻'];
    final colors = [const Color(0xFFEDEAE6), const Color(0xFFD4E157), const Color(0xFF64B5F6)];

    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: colors[index % colors.length],
        borderRadius: BorderRadius.circular(32),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(emojies[index % emojies.length], style: const TextStyle(fontSize: 32)),
              const Icon(Icons.arrow_outward_rounded, color: Colors.black),
            ],
          ),
          const Spacer(),
          Text(
            titles[index % titles.length],
            style: GoogleFonts.outfit(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: Colors.black,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'High payout student gig available at Anna University.',
            style: GoogleFonts.inter(fontSize: 12, color: Colors.black.withOpacity(0.6)),
          ),
        ],
      ),
    ).animate().scale(delay: (index * 100).ms, duration: 400.ms);
  }

  Widget _buildCategoryGrid() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _categoryChip('Academic', Icons.school_outlined),
        _categoryChip('Delivery', Icons.delivery_dining_outlined),
        _categoryChip('Drafting', Icons.edit_note_outlined),
        _categoryChip('Tech', Icons.code_off_outlined),
        _categoryChip('Events', Icons.event_available_outlined),
      ],
    );
  }

  Widget _categoryChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1D1D),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: const Color(0xFFEDEAE6)),
          const SizedBox(width: 8),
          Text(label, style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFFEDEAE6), fontWeight: FontWeight.w600)),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.2, end: 0);
  }

  Widget _buildJobCard(String title, String budget, String emoji, String college) {
    return GestureDetector(
      onTap: onJobTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1D1D1D),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFF2D2D2D),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(child: Text(emoji, style: const TextStyle(fontSize: 24))),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                  Text(college, style: GoogleFonts.inter(fontSize: 12, color: Colors.white.withOpacity(0.5))),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(budget, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w900, color: const Color(0xFFEDEAE6))),
                const SizedBox(height: 4),
                const Icon(Icons.chevron_right, color: Colors.white30, size: 18),
              ],
            ),
          ],
        ),
      ),
    ).animate().fadeIn().moveY(begin: 20, end: 0);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class OnboardingScreen extends StatefulWidget {
  final VoidCallback onDone;
  const OnboardingScreen({super.key, required this.onDone});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  String _selectedStyle = 'VOLUMINOUS GIGS';
  bool _showMore = false;

  final Map<String, Map<String, dynamic>> _styleData = {
    'VOLUMINOUS GIGS': {
      'icon': Icons.auto_awesome_outlined,
      'desc': 'Curated student gigs for your vertical. Projects throughout your semester will lighten things up for effortless portfolio growth.',
    },
    'STREAK JOBS': {
      'icon': Icons.bolt_outlined,
      'desc': 'Fast-paced sequential tasks. Maintain your streak to unlock high-priority campus projects and premium rewards.',
    },
    'BOUNCY PROJECTS': {
      'icon': Icons.blur_on_outlined,
      'desc': 'Dynamic, short-term creative bursts. Perfect for students looking for quick earnings and varied experiences.',
    },
    'LONG PIXIE': {
      'icon': Icons.linear_scale_outlined,
      'desc': 'Deep-dive internships and long-term commitments. Build solid relationships with premium campus partners.',
    },
    'SOLO RUNS': {
      'icon': Icons.person_outline,
      'desc': 'Independent freelance gigs. Handle the entire project from start to finish on your own terms.',
    },
    'TEAM GIGS': {
      'icon': Icons.group_outlined,
      'desc': 'Collaborative multi-student projects. Work with friends to tackle larger, more complex campus operations.',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: PageView(
        controller: _pageController,
        onPageChanged: (i) => setState(() => _currentPage = i),
        physics: const ClampingScrollPhysics(),
        children: [
          _buildWelcomeScreen(),
          _buildChooseScreen(),
          _buildDetailScreen(),
        ],
      ),
    );
  }

  // ─── SCREEN 1: WELCOME (HIGH-CONTRAST B&W) ─────────────────────
  Widget _buildWelcomeScreen() {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: AppColors.white,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Spacer(),
                    Hero(
                      tag: 'mascot',
                      child: Image.asset('assets/images/download.gif', width: 280),
                    ).animate().scale(duration: 800.ms, curve: Curves.easeOutBack),
                    const Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(40, 60, 40, 40),
                  decoration: const BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'WORKPANDA',
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: AppColors.slate,
                          letterSpacing: 8,
                        ),
                      ).animate().fadeIn(delay: 400.ms),
                      const SizedBox(height: 24),
                      Text(
                        'THE STUDENT\nGIG ECONOMY',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.outfit(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: AppColors.white,
                          height: 1.1,
                        ),
                      ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2, end: 0),
                      const SizedBox(height: 16),
                      Text(
                        'Professional opportunities curated for\nthe modern student lifestyle.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: AppColors.white.withOpacity(0.4),
                          height: 1.6,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => _pageController.nextPage(
                            duration: 600.ms, curve: Curves.easeInOutExpo),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.keyboard_arrow_right,
                              size: 40, color: AppColors.black),
                        ),
                      ).animate().scale(delay: 1.seconds),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─── SCREEN 2: CHOOSE STYLE (EDITORIAL GRID) ───────────────────
  Widget _buildChooseScreen() {
    return Container(
      color: AppColors.black,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.grid_view_rounded, color: AppColors.white, size: 28),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white.withOpacity(0.2)),
                  shape: BoxShape.circle,
                ),
                child: const Center(child: Icon(Icons.close, color: AppColors.white, size: 20)),
              )
            ],
          ),
          const SizedBox(height: 48),
          Text(
            'DEFINE YOUR\nWORK STYLE',
            style: GoogleFonts.outfit(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: AppColors.white,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 60),
              physics: const BouncingScrollPhysics(),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.85,
                children: [
                  _buildGridCard('VOLUMINOUS\nGIGS', Icons.auto_awesome_outlined),
                  _buildGridCard('STREAK\nJOBS', Icons.bolt_outlined),
                  _buildGridCard('BOUNCY\nPROJECTS', Icons.blur_on_outlined),
                  _buildGridCard('LONG\nPIXIE', Icons.linear_scale_outlined),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridCard(String title, IconData icon) {
    bool isSelected = _selectedStyle == title.replaceAll('\n', ' ');
    return GestureDetector(
      onTap: () {
        setState(() => _selectedStyle = title.replaceAll('\n', ' '));
        _pageController.nextPage(duration: 600.ms, curve: Curves.easeInOutExpo);
      },
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : AppColors.charcoal,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: AppColors.white.withOpacity(0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.outfit(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: isSelected ? AppColors.black : AppColors.white,
                  letterSpacing: 1.5),
            ),
            const Spacer(),
            Center(
              child: Icon(icon, size: 56, color: isSelected ? AppColors.black : AppColors.white),
            ),
            const Spacer(),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 200.ms).scale(begin: const Offset(0.9, 0.9));
  }

  // ─── SCREEN 3: PROFESSIONAL DETAIL ─────────────────────────────
  Widget _buildDetailScreen() {
    final data = _styleData[_selectedStyle] ?? _styleData['VOLUMINOUS GIGS']!;
    return Container(
      color: AppColors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                          onPressed: () => _pageController.previousPage(
                              duration: 600.ms, curve: Curves.easeInOutExpo),
                        ),
                        const Spacer(),
                        const Icon(Icons.share_outlined, size: 20),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Image.asset('assets/images/download.gif', width: 260),
                  const Spacer(),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.55),
              padding: const EdgeInsets.fromLTRB(40, 60, 40, 80),
              decoration: const BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _selectedStyle,
                    style: GoogleFonts.outfit(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: AppColors.white,
                      height: 1.1,
                      letterSpacing: -1,
                    ),
                  ).animate().fadeIn().slideX(begin: 0.1, end: 0),
                  const SizedBox(height: 16),
                  Container(
                    width: 40,
                    height: 2,
                    color: AppColors.white,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    data['desc'],
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: AppColors.white.withOpacity(0.5),
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 60),
                  GestureDetector(
                    onTap: widget.onDone,
                    child: Container(
                      height: 72,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          'ENTER WORKPANDA',
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                            color: AppColors.black,
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                    ),
                  ).animate().fadeIn(delay: 400.ms).scale(),
                ],
              ),
            ).animate().slideY(begin: 0.3, end: 0, duration: 600.ms, curve: Curves.easeOutQuart),
          ],
        ),
      ),
    );
  }
}

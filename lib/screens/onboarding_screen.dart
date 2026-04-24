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

  // Bamboo Green Accent
  static const Color bambooGreen = Color(0xFF2E7D32); // Deep Bamboo Green
  static const Color bambooLight = Color(0xFF81C784); // Light Bamboo Green

  final Map<String, Map<String, dynamic>> _styleData = {
    'VOLUMINOUS GIGS': {
      'icon': Icons.auto_awesome_outlined,
      'desc': 'Student gigs for you. Projects throughout your semester will lighten things up for weightless portfolio growth.',
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
      backgroundColor: Colors.black,
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

  // ─── SCREEN 1: WELCOME (BLACK, WHITE, GREEN) ───────────────────
  Widget _buildWelcomeScreen() {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.55,
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 48),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: bambooGreen.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.search, size: 24, color: bambooGreen),
                      ),
                    ),
                    const Spacer(),
                    Hero(
                      tag: 'mascot',
                      child: Image.asset('assets/images/download.gif', width: 260),
                    ).animate().scale(duration: 600.ms, curve: Curves.easeOutBack),
                    const Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(40, 60, 40, 40),
                  decoration: const BoxDecoration(
                    color: Color(0xFF111111),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'WELCOME, ',
                              style: GoogleFonts.outfit(
                                fontSize: 28,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                letterSpacing: 2,
                              ),
                            ),
                            TextSpan(
                              text: 'PANDA',
                              style: GoogleFonts.outfit(
                                fontSize: 28,
                                fontWeight: FontWeight.w900,
                                color: bambooLight,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'WorkPanda is the final tip off\nwhether or not a student really\nknows themselves.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.5),
                          height: 1.6,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => _pageController.nextPage(
                            duration: 500.ms, curve: Curves.ease),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            color: bambooGreen,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.keyboard_arrow_right,
                              size: 40, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ).animate().fadeIn(),
      ),
    );
  }

  // ─── SCREEN 2: CHOOSE FLOW (GRID STYLE) ──────────────────────────
  Widget _buildChooseScreen() {
    return Container(
      color: const Color(0xFF111111),
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.menu, color: bambooLight),
              Row(
                children: [
                  const Icon(Icons.notifications_none, color: Colors.white),
                  const SizedBox(width: 16),
                  Icon(Icons.favorite, color: bambooLight.withOpacity(0.8)),
                ],
              )
            ],
          ),
          const SizedBox(height: 40),
          Text(
            'CHOOSE\nWORK STYLE',
            style: GoogleFonts.outfit(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.85,
                    children: [
                      _buildGridCard('VOLUMINOUS GIGS', Icons.auto_awesome_outlined),
                      _buildGridCard('STREAK JOBS', Icons.bolt_outlined),
                      _buildGridCard('BOUNCY PROJECTS', Icons.blur_on_outlined),
                      _buildGridCard('LONG PIXIE', Icons.linear_scale_outlined),
                      if (_showMore) ...[
                        _buildGridCard('SOLO RUNS', Icons.person_outline),
                        _buildGridCard('TEAM GIGS', Icons.group_outlined),
                      ]
                    ],
                  ),
                  const SizedBox(height: 32),
                  if (!_showMore)
                    GestureDetector(
                      onTap: () => setState(() => _showMore = true),
                      child: Column(
                        children: [
                          Text(
                            'MORE',
                            style: GoogleFonts.outfit(
                              color: bambooLight,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2,
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_down, color: bambooLight, size: 16),
                        ],
                      ).animate().fadeIn().moveY(begin: -10, end: 0),
                    ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridCard(String title, IconData icon) {
    bool isSelected = _selectedStyle == title;
    return GestureDetector(
      onTap: () {
        setState(() => _selectedStyle = title);
        _pageController.nextPage(duration: 500.ms, curve: Curves.ease);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? bambooLight : Colors.white,
          borderRadius: BorderRadius.circular(32),
          border: isSelected ? Border.all(color: Colors.white, width: 2) : null,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: GoogleFonts.outfit(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: isSelected ? Colors.white : Colors.black,
                    letterSpacing: 0.5),
              ),
            ),
            const Spacer(),
            Icon(icon, size: 64, color: isSelected ? Colors.white : Colors.black),
            const Spacer(),
          ],
        ),
      ),
    ).animate().scale(delay: 100.ms, curve: Curves.easeOutBack);
  }

  // ─── SCREEN 3: DETAIL (DYNAMIC STYLE) ─────────────────────────
  Widget _buildDetailScreen() {
    final data = _styleData[_selectedStyle] ?? _styleData['VOLUMINOUS GIGS']!;
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(Icons.keyboard_arrow_left, size: 32, color: bambooGreen),
                        onPressed: () => _pageController.previousPage(
                            duration: 500.ms, curve: Curves.ease),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Center(
                      child: Image.asset('assets/images/download.gif', width: 280),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.6),
              padding: const EdgeInsets.fromLTRB(40, 60, 40, 80),
              decoration: const BoxDecoration(
                color: Color(0xFF111111),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedStyle.replaceAll(' ', '\n'),
                        style: GoogleFonts.outfit(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          height: 1.1,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const Icon(Icons.bookmark, color: bambooLight, size: 28),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: List.generate(
                        5,
                        (index) => Icon(Icons.star,
                            size: 20,
                            color: index < 4
                                ? bambooLight
                                : Colors.white.withOpacity(0.2))),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    data['desc'],
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.5),
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 48),
                  GestureDetector(
                    onTap: widget.onDone,
                    child: Container(
                      height: 64,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [bambooGreen, bambooLight],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: bambooGreen.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'GET STARTED',
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).animate().slideY(begin: 0.3, end: 0, duration: 500.ms),
          ],
        ),
      ),
    );
  }
}

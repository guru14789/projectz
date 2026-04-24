import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
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

  final List<OnboardingData> _data = [
    OnboardingData(
      title: 'Unlock Your Potential',
      description: 'Discover thousands of student-friendly jobs tailored to your skills and schedule.',
      image: 'assets/images/logo.png',
    ),
    OnboardingData(
      title: 'Earn While You Learn',
      description: 'Gain valuable experience and build your resume while earning on your own terms.',
      image: 'assets/images/logo.png',
    ),
    OnboardingData(
      title: 'Join the Community',
      description: 'Connect with hundreds of students and employers in a trusted, secure environment.',
      image: 'assets/images/logo.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F171A),
      body: Stack(
        children: [
          // ─── AMBIENT BACKGROUND ──────────────────────────────────────
          _buildAmbientBackground(),

          // ─── CONTENT ────────────────────────────────────────────────
          PageView.builder(
            controller: _pageController,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemCount: _data.length,
            itemBuilder: (context, index) => _buildPage(_data[index]),
          ),

          // ─── BOTTOM NAV ─────────────────────────────────────────────
          _buildBottomNav(),
        ],
      ),
    );
  }

  Widget _buildAmbientBackground() {
    return Stack(
      children: [
        // Glowing Orbs
        Positioned(
          top: -100, right: -50,
          child: _GlowOrb(color: AppColors.softGreen.withOpacity(0.2), size: 300),
        ),
        Positioned(
          bottom: 100, left: -100,
          child: _GlowOrb(color: Colors.blue.withOpacity(0.1), size: 400),
        ),
        Positioned(
          top: 300, right: 100,
          child: _GlowOrb(color: AppColors.softGreen.withOpacity(0.05), size: 200),
        ),
      ],
    );
  }

  Widget _buildPage(OnboardingData item) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            
            // Image / Mascot with Glass Pedestal
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 240,
                  width: 240,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ).animate().scale(duration: 800.ms, curve: Curves.easeOutBack),
                
                // Glass Pedestal
                Transform.translate(
                  offset: const Offset(0, 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: 160,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white.withOpacity(0.2)),
                        ),
                      ),
                    ),
                  ),
                ).animate().fadeIn(delay: 400.ms),
              ],
            ),
  
            const SizedBox(height: 60),
  
            // Title
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                height: 1.1,
              ),
            ).animate().fadeIn(delay: 200.ms).moveY(begin: 20, end: 0),
  
            const SizedBox(height: 20),
  
            // Description
            Text(
              item.description,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 15,
                color: Colors.white.withOpacity(0.6),
                height: 1.6,
              ),
            ).animate().fadeIn(delay: 400.ms),
            
            const SizedBox(height: 180), // Space for bottom button
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Positioned(
      bottom: 60,
      left: 40,
      right: 40,
      child: Column(
        children: [
          // Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _data.length,
              (index) => Container(
                margin: const EdgeInsets.all(4),
                width: _currentPage == index ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? AppColors.softGreen : Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
              ).animate().scale(duration: 300.ms),
            ),
          ),
          const SizedBox(height: 40),

          // Glass Button
          GestureDetector(
            onTap: () {
              if (_currentPage < _data.length - 1) {
                _pageController.nextPage(duration: 500.ms, curve: Curves.easeOutQuart);
              } else {
                widget.onDone();
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.softGreen.withOpacity(0.8),
                        AppColors.softGreen.withOpacity(0.4),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.softGreen.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      _currentPage == _data.length - 1 ? 'Get Started' : 'Continue',
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Secondary Link
          Text(
            'Already have an account? Log In',
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  final Color color;
  final double size;
  const _GlowOrb({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, color.withOpacity(0)],
        ),
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final String image;
  OnboardingData({required this.title, required this.description, required this.image});
}

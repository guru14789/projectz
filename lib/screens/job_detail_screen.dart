import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/components.dart';

class JobDetailScreen extends StatefulWidget {
  final VoidCallback onBack;
  const JobDetailScreen({super.key, required this.onBack});

  @override
  State<JobDetailScreen> createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  bool _isApplying = false;

  void _handleApply() async {
    setState(() => _isApplying = true);
    
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    
    if (!mounted) return;
    setState(() => _isApplying = false);
    
    _showSuccessDialog();
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: const Color(0xFF111111),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('✅', style: TextStyle(fontSize: 48)),
              const SizedBox(height: 24),
              Text(
                'APPLICATION SENT',
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFFEDEAE6),
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Suresh has been notified of your interest. Check your messages soon!',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFFEDEAE6).withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  widget.onBack();
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDEAE6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      'BACK TO HOME',
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ).animate().scale(curve: Curves.easeOutBack, duration: 400.ms).fadeIn(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEAE6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEDEAE6),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: widget.onBack,
        ),
        title: Text(
          'GIG DETAILS',
          style: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: Colors.black,
            letterSpacing: 4,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            _buildTag(),
            const SizedBox(height: 16),
            Text(
              'Academic gig\n"Note Taking"',
              style: GoogleFonts.outfit(
                fontSize: 36,
                fontWeight: FontWeight.w900,
                color: Colors.black,
                height: 1.1,
                letterSpacing: -1,
              ),
            ).animate().fadeIn().slideY(begin: 0.1, end: 0),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  '₹400 budget',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '·',
                  style: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 20),
                ),
                const SizedBox(width: 8),
                Text(
                  'IIT Madras',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ).animate().fadeIn(delay: 200.ms),
            const SizedBox(height: 48),
            _buildSectionHeader('THE GIG'),
            const SizedBox(height: 16),
            Text(
              'Looking for a student who attended the ML lecture today to share their notes. Handwritten or digital both are fine. High quality screenshots or PDFs preferred.',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: Colors.black.withOpacity(0.7),
                height: 1.6,
              ),
            ).animate().fadeIn(delay: 400.ms),
            const SizedBox(height: 48),
            _buildSectionHeader('POSTED BY'),
            const SizedBox(height: 16),
            _buildPosterCard(),
            const SizedBox(height: 120),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomCTA(),
    );
  }

  Widget _buildTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        'ACADEMIC',
        style: GoogleFonts.outfit(
          fontSize: 10,
          fontWeight: FontWeight.w900,
          color: const Color(0xFFEDEAE6),
          letterSpacing: 2,
        ),
      ),
    ).animate().fadeIn().scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1));
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.outfit(
        fontSize: 12,
        fontWeight: FontWeight.w900,
        color: Colors.black.withOpacity(0.3),
        letterSpacing: 2,
      ),
    );
  }

  Widget _buildPosterCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFF111111),
            child: Text('🐾', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Suresh Kumar',
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '4.9 ratings · 12 gigs posted',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.4),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.verified_rounded, color: Colors.blue, size: 20),
        ],
      ),
    ).animate().fadeIn(delay: 600.ms);
  }

  Widget _buildBottomCTA() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEAE6),
        border: Border(top: BorderSide(color: Colors.black.withOpacity(0.05))),
      ),
      child: AppButton(
        label: 'APPLY NOW',
        fullWidth: true,
        onTap: () {},
      ),
    ).animate().slideY(begin: 1, end: 0, duration: 400.ms);
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

// ─── PANDA SKETCH LOGO ─────────────────────────────────────────
class PandaLogo extends StatelessWidget {
  final double size;
  const PandaLogo({super.key, this.size = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size * 0.15),
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.black, width: 2),
      ),
      child: Center(child: Text('🐼', style: TextStyle(fontSize: size * 0.5))),
    );
  }
}

// ─── SKETCH BUTTON ──────────────────────────────────────────────
class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool primary;
  final bool fullWidth;

  const AppButton({
    super.key,
    required this.label,
    this.onTap,
    this.primary = true,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: fullWidth ? double.infinity : null,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        decoration: BoxDecoration(
          color: primary ? const Color(0xFF111111) : const Color(0xFFEDEAE6),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 1.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: GoogleFonts.outfit(
                color: primary ? const Color(0xFFEDEAE6) : Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 14,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── SKETCH CARD ────────────────────────────────────────────────
class AppCard extends StatelessWidget {
  final Widget child;
  final double padding;
  final bool outlined;

  const AppCard({
    super.key,
    required this.child,
    this.padding = 20,
    this.outlined = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEAE6),
        borderRadius: BorderRadius.circular(24),
        border: outlined ? Border.all(color: AppColors.black, width: 1.5) : null,
      ),
      child: child,
    );
  }
}

// ─── SKETCH INPUT ───────────────────────────────────────────────
class AppInput extends StatelessWidget {
  final String placeholder;
  final IconData? icon;
  final bool obscure;

  const AppInput({
    super.key,
    required this.placeholder,
    this.icon,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F8F6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withOpacity(0.1), width: 1),
      ),
      child: TextField(
        obscureText: obscure,
        style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: GoogleFonts.inter(color: Colors.black.withOpacity(0.3), fontSize: 14),
          icon: icon != null
              ? Icon(icon, color: Colors.black, size: 20)
              : null,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

// ─── BOTTOM NAV ────────────────────────────────────────────────
class AppBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;
  const AppBottomNav(
      {super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.05), width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(0, Icons.home_filled),
          _navItem(1, Icons.explore_outlined),
          _navActionItem(2, Icons.add_rounded),
          _navItem(3, Icons.account_balance_wallet_outlined),
          _navItem(4, Icons.person_outline_rounded),
        ],
      ),
    );
  }

  Widget _navItem(int i, IconData icon) {
    final active = i == selectedIndex;
    return GestureDetector(
      onTap: () => onTap(i),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Icon(
          icon,
          size: 26,
          color: active ? const Color(0xFFEDEAE6) : const Color(0xFFEDEAE6).withOpacity(0.3),
        ),
      ),
    );
  }

  Widget _navActionItem(int i, IconData icon) {
    return GestureDetector(
      onTap: () => onTap(i),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Color(0xFFEDEAE6),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.add_rounded, color: Colors.black, size: 28),
      ),
    );
  }
}

// ─── JOB CARD ──────────────────────────────────────────────────
class JobListCard extends StatelessWidget {
  final String title;
  final String budget;
  final String emoji;
  final String college;
  final VoidCallback? onTap;

  const JobListCard({
    super.key,
    required this.title,
    required this.budget,
    required this.emoji,
    required this.college,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1D1D1D),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Row(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                  child: Text(emoji, style: const TextStyle(fontSize: 26))),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    college,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFFEDEAE6).withOpacity(0.4),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '₹$budget',
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFFEDEAE6),
                  ),
                ),
                const SizedBox(height: 4),
                Icon(Icons.favorite_border, size: 18, color: Colors.white.withOpacity(0.3)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// ─── PRESSABLE ─────────────────────────────────────────────────
class Pressable extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  const Pressable({super.key, required this.child, this.onTap});
  @override
  State<Pressable> createState() => _PressableState();
}

class _PressableState extends State<Pressable>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _opacity;
  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 80));
    _opacity = Tween(begin: 1.0, end: 0.75).animate(_ctrl);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _ctrl.forward(),
      onTapUp: (_) {
        _ctrl.reverse();
        widget.onTap?.call();
      },
      onTapCancel: () => _ctrl.reverse(),
      child: AnimatedBuilder(
        animation: _opacity,
        builder: (ctx, child) => Opacity(opacity: _opacity.value, child: child),
        child: widget.child,
      ),
    );
  }
}

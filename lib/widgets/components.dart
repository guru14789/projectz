import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// ─── PANDA SKETCH LOGO ─────────────────────────────────────────
class PandaLogo extends StatelessWidget {
  final double size;
  const PandaLogo({super.key, this.size = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size, height: size,
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
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          color: primary ? AppColors.black : AppColors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: AppColors.black, width: 2),
          boxShadow: [
            if (primary)
              const BoxShadow(color: Color(0x33000000), offset: Offset(0, 4), blurRadius: 0),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: primary ? AppColors.white : AppColors.black,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
            if (primary) ...[
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.white),
            ],
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
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: outlined ? Border.all(color: AppColors.black, width: 2) : null,
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.black, width: 2),
      ),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: AppTextStyles.bodyMedium,
          icon: icon != null ? Icon(icon, color: AppColors.black, size: 20) : null,
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
  const AppBottomNav({super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.black, width: 2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(0, Icons.home_filled),
          _navItem(1, Icons.search_rounded),
          _navItem(2, Icons.add_box_outlined),
          _navItem(3, Icons.wallet_rounded),
          _navItem(4, Icons.person_rounded),
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
        decoration: BoxDecoration(
          color: active ? AppColors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: active ? AppColors.white : AppColors.black),
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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.black, width: 2),
        ),
        child: Row(
          children: [
            Container(
              width: 50, height: 50,
              decoration: BoxDecoration(
                color: AppColors.grayBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.black, width: 1.5),
              ),
              child: Center(child: Text(emoji, style: const TextStyle(fontSize: 24))),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.headingMedium),
                  Text(college, style: AppTextStyles.bodyMedium),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('₹$budget', style: AppTextStyles.headingMedium),
                const Icon(Icons.favorite_border, size: 20),
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
class _PressableState extends State<Pressable> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _opacity;
  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 80));
    _opacity = Tween(begin: 1.0, end: 0.75).animate(_ctrl);
  }
  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _ctrl.forward(),
      onTapUp: (_) { _ctrl.reverse(); widget.onTap?.call(); },
      onTapCancel: () => _ctrl.reverse(),
      child: AnimatedBuilder(
        animation: _opacity,
        builder: (ctx, child) => Opacity(opacity: _opacity.value, child: child),
        child: widget.child,
      ),
    );
  }
}

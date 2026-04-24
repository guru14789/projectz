import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:math' as math;

class PandaLoader extends StatefulWidget {
  final double size;
  const PandaLoader({super.key, this.size = 120});

  @override
  State<PandaLoader> createState() => _PandaLoaderState();
}

class _PandaLoaderState extends State<PandaLoader>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _controller;

  final List<CardContent> _contents = [
    CardContent(icon: Icons.face, label: "Panda Blink", color: Colors.black),
    CardContent(
        icon: Icons.sentiment_satisfied_alt,
        label: "Panda Smile",
        color: Color(0xFF4CAF50)),
    CardContent(
        icon: Icons.timer_outlined, label: "Tasks", color: Colors.black),
    CardContent(
        icon: Icons.checklist_rounded,
        label: "Checklist",
        color: Color(0xFF4CAF50)),
    CardContent(
        icon: Icons.dashboard_customize_outlined,
        label: "UI Hints",
        color: Colors.black),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat();

    _controller.addListener(() {
      final newIndex =
          (_controller.value * _contents.length).floor() % _contents.length;
      if (newIndex != _currentIndex) {
        setState(() {
          _currentIndex = newIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background shadow/depth cards
          for (int i = 2; i > 0; i--)
            Transform.translate(
              offset: Offset(0, i * 4.0),
              child: Transform.scale(
                scale: 1.0 - (i * 0.05),
                child: _buildCard(null, i),
              ),
            ),

          // Flipping Card
          _buildFlippingCard(),
        ],
      )
          .animate(onPlay: (controller) => controller.repeat())
          .moveY(
              begin: 0,
              end: -10,
              duration: 1200.ms,
              curve: Curves.easeInOutSine)
          .then()
          .moveY(
              begin: -10,
              end: 0,
              duration: 1200.ms,
              curve: Curves.easeInOutSine),
    );
  }

  Widget _buildFlippingCard() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Calculate local progress within this card's flip cycle
        final double progress = (_controller.value * _contents.length) % 1.0;
        final bool isFlipping =
            progress > 0.7; // Start flipping at the end of the step

        final double flipAngle = isFlipping
            ? (progress - 0.7) / 0.3 * math.pi // Flip 180 degrees
            : 0.0;

        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002) // Perspective
            ..rotateX(-flipAngle),
          alignment: Alignment.center,
          child: _buildCard(_contents[_currentIndex % _contents.length], 0),
        );
      },
    );
  }

  Widget _buildCard(CardContent? content, int depth) {
    return Container(
      width: widget.size * 0.8,
      height: widget.size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05 + (depth * 0.02)),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: content == null
          ? null
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(content.icon,
                    size: widget.size * 0.4, color: content.color),
                const SizedBox(height: 8),
                Container(
                  width: widget.size * 0.4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: content.color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: widget.size * 0.25,
                  height: 4,
                  decoration: BoxDecoration(
                    color: content.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
    );
  }
}

class CardContent {
  final IconData icon;
  final String label;
  final Color color;
  CardContent({required this.icon, required this.label, required this.color});
}

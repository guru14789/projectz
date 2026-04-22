import 'package:flutter/material.dart';
import '../widgets/components.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onJobTap;
  final VoidCallback onPostTap;
  const HomeScreen({super.key, required this.onJobTap, required this.onPostTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header & Search
              Row(
                children: [
                   Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.black, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.menu, size: 24),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: AppInput(
                      placeholder: 'Discover student gigs...',
                      icon: Icons.search,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 32),
              
              // Top Highlight Card
              AppCard(
                padding: 0,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 160,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: AppColors.grayBg,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
                          ),
                          child: const Center(child: Text('🐾', style: TextStyle(fontSize: 80))),
                        ),
                        Positioned(
                          right: 16, bottom: 16,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(color: AppColors.black, shape: BoxShape.circle),
                            child: const Icon(Icons.favorite, color: AppColors.white, size: 20),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Academic gig "Note Taking"', style: AppTextStyles.headingMedium),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const CircleAvatar(radius: 12, backgroundColor: AppColors.black, child: Text('S', style: TextStyle(color: Colors.white, fontSize: 10))),
                              const SizedBox(width: 8),
                              Text('IIT Madras · 4.9 ratings', style: AppTextStyles.bodyMedium),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Categories / Facilities
              Text('Categories', style: AppTextStyles.headingMedium),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _categoryItem('Writing', Icons.edit_note),
                  _categoryItem('Delivery', Icons.delivery_dining),
                  _categoryItem('Coding', Icons.code),
                  _categoryItem('Design', Icons.brush),
                ],
              ),
              
              const SizedBox(height: 32),
              
              Text('Recent Gigs', style: AppTextStyles.headingMedium),
              const SizedBox(height: 16),
              
              // List of Jobs
              JobListCard(
                title: 'Library Assistance',
                budget: '400',
                emoji: '📚',
                college: 'Anna University',
                onTap: onJobTap,
              ),
              JobListCard(
                title: 'Data Entry Helper',
                budget: '1200',
                emoji: '💻',
                college: 'MU Campus',
                onTap: onJobTap,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPostTap,
        backgroundColor: AppColors.black,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }

  Widget _categoryItem(String label, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.black, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
      ],
    );
  }
}

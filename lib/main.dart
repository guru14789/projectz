import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme/app_theme.dart';
import 'widgets/components.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/verification_screen.dart';
import 'screens/home_screen.dart';
import 'screens/job_detail_screen.dart';
import 'screens/post_job_screen.dart';
import 'screens/discover_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/other_screens.dart';
import 'screens/active_gigs_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/company_profile_screen.dart';
import 'screens/submission_screen.dart';
import 'screens/portfolio_builder_screen.dart';
import 'screens/help_center_screen.dart';
import 'screens/rating_screen.dart';
import 'providers/navigation_provider.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase (Assuming default platform options are configured)
  // await Firebase.initializeApp(); 
  
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Color(0xFF111111),
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(const ProviderScope(child: WorkPandaApp()));
}

class WorkPandaApp extends StatelessWidget {
  const WorkPandaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkPanda',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const AppShell(),
    );
  }
}

// ─── APP FLOW ────────────────────────────────────────────────────
enum AppFlow { splash, onboarding, auth, verification, main }

class AppShell extends ConsumerStatefulWidget {
  const AppShell({super.key});
  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> {
  // Start directly on main for development; change to AppFlow.splash for production
  AppFlow _flow = AppFlow.main;

  void _setFlow(AppFlow flow) => setState(() => _flow = flow);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _buildFlow(),
    );
  }

  Widget _buildFlow() {
    switch (_flow) {
      case AppFlow.splash:
        return SplashScreen(
            key: const ValueKey('splash'),
            onDone: () => _setFlow(AppFlow.onboarding));
      case AppFlow.onboarding:
        return OnboardingScreen(
            key: const ValueKey('onboard'),
            onDone: () => _setFlow(AppFlow.auth));
      case AppFlow.auth:
        return AuthScreen(
            key: const ValueKey('auth'),
            onDone: () => _setFlow(AppFlow.verification));
      case AppFlow.verification:
        return VerificationScreen(
            key: const ValueKey('verify'),
            onDone: () => _setFlow(AppFlow.main));
      case AppFlow.main:
        return const MainNav(key: ValueKey('main'));
    }
  }
}

// ─── MAIN NAV ────────────────────────────────────────────────────

class MainNav extends ConsumerWidget {
  const MainNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navState = ref.watch(navigationProvider);
    final selectedIndex = _getNavIndex(navState.currentDestination);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          _buildScreen(navState.currentDestination, ref),
          if (navState.activeOverlay != null)
            _buildOverlay(navState.activeOverlay!, navState.overlayData, ref),
        ],
      ),
      bottomNavigationBar: AppBottomNav(
        selectedIndex: selectedIndex,
        onTap: (index) {
          if (index == 2) {
            ref.read(navigationProvider.notifier).openOverlay('post_job');
          } else {
            ref.read(navigationProvider.notifier).setDestination(_getNavDest(index));
          }
        },
      ),
    );
  }

  int _getNavIndex(NavDestination dest) {
    switch (dest) {
      case NavDestination.home: return 0;
      case NavDestination.explore: return 1;
      case NavDestination.active: return 2;
      case NavDestination.wallet: return 3;
      case NavDestination.profile: return 4;
    }
  }

  NavDestination _getNavDest(int index) {
    switch (index) {
      case 0: return NavDestination.home;
      case 1: return NavDestination.explore;
      case 2: return NavDestination.active;
      case 3: return NavDestination.wallet;
      case 4: return NavDestination.profile;
      default: return NavDestination.home;
    }
  }

  Widget _buildScreen(NavDestination dest, WidgetRef ref) {
    switch (dest) {
      case NavDestination.home:
        return HomeScreen(
          onJobTap: () => ref.read(navigationProvider.notifier).openOverlay('job_detail'),
          onPostTap: () => ref.read(navigationProvider.notifier).openOverlay('post_job'),
          onNotifications: () => ref.read(navigationProvider.notifier).openOverlay('notifications'),
        );
      case NavDestination.explore:
        return DiscoverScreen(
          onJobTap: () => ref.read(navigationProvider.notifier).openOverlay('job_detail'),
        );
      case NavDestination.active:
        return ActiveGigsScreen(
          onBack: () => ref.read(navigationProvider.notifier).setDestination(NavDestination.home),
          onSubmitTap: () => ref.read(navigationProvider.notifier).openOverlay('submission'),
        );
      case NavDestination.wallet:
        return const WalletScreen();
      case NavDestination.profile:
        return ProfileScreen(
          onSettings: () => ref.read(navigationProvider.notifier).openOverlay('help_center'), // using help center as proxy for now
          onActiveGigsTap: () => ref.read(navigationProvider.notifier).setDestination(NavDestination.active),
          onPortfolioTap: () => ref.read(navigationProvider.notifier).openOverlay('portfolio_builder'),
          onHelpTap: () => ref.read(navigationProvider.notifier).openOverlay('help_center'),
        );
    }
  }

  Widget _buildOverlay(String id, dynamic data, WidgetRef ref) {
    late Widget overlay;
    switch (id) {
      case 'job_detail':
        final jobData = (data as Map<String, dynamic>?) ??
            {
              'title': 'Editorial Synthesis',
              'budget': '₹800',
              'emoji': '🖋️',
              'college': 'IIT Madras',
            };
        overlay = JobDetailScreen(
          title: jobData['title'] as String,
          budget: jobData['budget'] as String,
          emoji: jobData['emoji'] as String,
          college: jobData['college'] as String,
          onBack: () => ref.read(navigationProvider.notifier).closeOverlay(),
          onCompanyTap: () =>
              ref.read(navigationProvider.notifier).openOverlay('company_profile'),
        );
        break;
      case 'post_job':
        overlay = PostJobScreen(
          onBack: () => ref.read(navigationProvider.notifier).closeOverlay(),
          onPosted: () {
            ref.read(navigationProvider.notifier).closeOverlay();
            ref.read(navigationProvider.notifier).setDestination(NavDestination.home);
          },
        );
        break;
      case 'notifications':
        overlay = NotificationsScreen(
          onBack: () => ref.read(navigationProvider.notifier).closeOverlay(),
        );
        break;
      case 'company_profile':
        overlay = CompanyProfileScreen(
          onBack: () => ref.read(navigationProvider.notifier).closeOverlay(),
        );
        break;
      case 'submission':
        overlay = SubmissionScreen(
          onBack: () => ref.read(navigationProvider.notifier).closeOverlay(),
        );
        break;
      case 'portfolio_builder':
        overlay = PortfolioBuilderScreen(
          onBack: () => ref.read(navigationProvider.notifier).closeOverlay(),
        );
        break;
      case 'help_center':
        overlay = HelpCenterScreen(
          onBack: () => ref.read(navigationProvider.notifier).closeOverlay(),
        );
        break;
      case 'rating':
        overlay = RatingScreen(
          onBack: () => ref.read(navigationProvider.notifier).closeOverlay(),
        );
        break;
      default:
        overlay = const SizedBox();
    }

    return Positioned.fill(
      child: GestureDetector(
        onTap: () => ref.read(navigationProvider.notifier).closeOverlay(), 
        child: Container(
          color: AppColors.black.withValues(alpha: 0.4), // Dimmed background
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: GestureDetector(
              onTap: () {}, // Prevent taps on the modal itself from closing it
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: const EdgeInsets.only(top: 60), // Editorial offset
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 40,
                        offset: Offset(0, -10),
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      overlay,
                      Positioned(
                        top: 24,
                        right: 24,
                        child: IconButton(
                          icon: const Icon(Icons.keyboard_arrow_down_rounded, 
                                          color: AppColors.black, size: 32),
                          onPressed: () => ref.read(navigationProvider.notifier).closeOverlay(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ).animate().slideY(begin: 1, end: 0, duration: 600.ms, curve: Curves.easeOutQuart);
  }
}

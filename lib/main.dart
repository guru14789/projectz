import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'widgets/components.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/verification_screen.dart';
import 'screens/home_screen.dart';
import 'screens/job_detail_screen.dart';
import 'screens/post_job_screen.dart';
import 'screens/other_screens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(WorkPandaApp());
}

class WorkPandaApp extends StatelessWidget {
  WorkPandaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkPanda',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: AppShell(),
    );
  }
}

// ─── APP FLOW ────────────────────────────────────────────────────
enum AppFlow { splash, onboarding, auth, verification, main }

class AppShell extends StatefulWidget {
  AppShell({super.key});
  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  AppFlow _flow = AppFlow.splash;

  void _setFlow(AppFlow flow) => setState(() => _flow = flow);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 400),
      transitionBuilder: (child, anim) => FadeTransition(opacity: anim, child: child),
      child: _buildFlow(),
    );
  }

  Widget _buildFlow() {
    switch (_flow) {
      case AppFlow.splash:
        return SplashScreen(key: ValueKey('splash'), onDone: () => _setFlow(AppFlow.onboarding));
      case AppFlow.onboarding:
        return OnboardingScreen(key: ValueKey('onboard'), onDone: () => _setFlow(AppFlow.auth));
      case AppFlow.auth:
        return AuthScreen(key: ValueKey('auth'), onDone: () => _setFlow(AppFlow.verification));
      case AppFlow.verification:
        return VerificationScreen(key: ValueKey('verify'), onDone: () => _setFlow(AppFlow.main));
      case AppFlow.main:
        return MainNav(key: ValueKey('main'));
    }
  }
}

// ─── MAIN NAV ────────────────────────────────────────────────────
enum MainScreen { home, discover, wallet, profile }

class MainNav extends StatefulWidget {
  MainNav({super.key});
  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  MainScreen _tab = MainScreen.home;
  bool _showJobDetail = false;
  bool _showPostJob = false;
  bool _showChat = false;
  bool _showSettings = false;
  bool _showApplications = false;

  int get _navIndex {
    switch (_tab) {
      case MainScreen.home: return 0;
      case MainScreen.discover: return 1;
      case MainScreen.wallet: return 3;
      case MainScreen.profile: return 4;
    }
  }

  void _onNavTap(int i) {
    if (i == 2) {
      setState(() => _showPostJob = true);
      return;
    }
    final screens = [MainScreen.home, MainScreen.discover, MainScreen.home, MainScreen.wallet, MainScreen.profile];
    setState(() {
      _tab = screens[i];
      _showJobDetail = false;
      _showPostJob = false;
      _showChat = false;
      _showSettings = false;
      _showApplications = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Overlay screens (full-screen, no nav)
    if (_showPostJob) {
      return PostJobScreen(
        onBack: () => setState(() => _showPostJob = false),
        onPosted: () => setState(() { _showPostJob = false; _tab = MainScreen.home; }),
      );
    }
    if (_showJobDetail) {
      return JobDetailScreen(onBack: () => setState(() => _showJobDetail = false));
    }
    if (_showChat) {
      return ChatScreen(onBack: () => setState(() => _showChat = false));
    }
    if (_showSettings) {
      return SettingsScreen(onBack: () => setState(() => _showSettings = false));
    }
    if (_showApplications) {
      return ApplicationsScreen(onBack: () => setState(() => _showApplications = false));
    }

    // Main nav
    return Scaffold(
      backgroundColor: AppColors.black,
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 250),
        child: _buildScreen(),
      ),
      bottomNavigationBar: AppBottomNav(
        selectedIndex: _navIndex,
        onTap: _onNavTap,
      ),
    );
  }

  Widget _buildScreen() {
    switch (_tab) {
      case MainScreen.home:
        return HomeScreen(
          key: ValueKey('home'),
          onJobTap: () => setState(() => _showJobDetail = true),
          onPostTap: () => setState(() => _showPostJob = true),
        );
      case MainScreen.discover:
        return DiscoverScreen(
          key: ValueKey('discover'),
          onJobTap: () => setState(() => _showJobDetail = true),
        );
      case MainScreen.wallet:
        return WalletScreen(key: ValueKey('wallet'));
      case MainScreen.profile:
        return ProfileScreen(
          key: ValueKey('profile'),
          onSettings: () => setState(() => _showSettings = true),
        );
    }
  }
}

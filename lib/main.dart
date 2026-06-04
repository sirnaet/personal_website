import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:url_launcher/url_launcher.dart';
import 'package:personal_website/theme/app_theme.dart';
import 'package:personal_website/sections/sticky_nav.dart';
import 'package:personal_website/sections/hero_section.dart';
import 'package:personal_website/sections/about_skills_section.dart';
import 'package:personal_website/sections/projects_section.dart';
import 'package:personal_website/sections/experience_section.dart';
import 'package:personal_website/sections/cv_section.dart';
import 'package:personal_website/sections/contact_section.dart';
import 'package:personal_website/sections/footer_section.dart';
import 'package:personal_website/widgets/cursor_glow_overlay.dart';
import 'package:personal_website/widgets/cyber_button.dart';
import 'package:personal_website/widgets/mobile_drawer.dart';

const String kFlutterRoute = '/flutter';
const String kReactPortfolioEntry = 'react-portfolio/';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanaet Memusi',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: Uri.base.path.isEmpty ? '/' : Uri.base.path,
      onGenerateRoute: (settings) {
        final requestedPath = Uri.parse(settings.name ?? '/').path;

        if (requestedPath == kFlutterRoute) {
          return MaterialPageRoute<void>(
            settings: const RouteSettings(name: kFlutterRoute),
            builder: (_) => const PortfolioHome(),
          );
        }

        return MaterialPageRoute<void>(
          settings: const RouteSettings(name: '/'),
          builder: (_) => const VersionLandingPage(),
        );
      },
    );
  }
}

class VersionLandingPage extends StatelessWidget {
  const VersionLandingPage({super.key});

  Future<void> _openReactVersion() async {
    final uri = Uri.base.resolve(kReactPortfolioEntry);
    await launchUrl(uri, webOnlyWindowName: '_self');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 720;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: 1.8,
            colors: [
              Color(0xFF101820),
              AppTheme.backgroundColor,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Logo background
            Positioned.fill(
              child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  'assets/images/Sirnaet-logo.png',
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Positioned.fill(
              child: CustomPaint(
                painter: GridPainter(),
              ),
            ),
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 48,
                    vertical: 32,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.surfaceColor.withValues(alpha: 0.9),
                            border: Border.all(color: AppTheme.borderColor),
                          ),
                          child: Text(
                            'VERSION SELECTOR',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppTheme.accentColor,
                                      letterSpacing: 3.5,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'Pick which version of the website you want to view.',
                          style:
                              Theme.of(context).textTheme.displayMedium?.copyWith(
                                    fontSize: isMobile ? 34 : 58,
                                    fontWeight: FontWeight.w700,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 18),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 640),
                          child: Text(
                            'This landing page is only here to direct you. Choose the React `.tsx` build or continue into the Flutter web version you are currently accessing.',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppTheme.textSecondary,
                                      fontSize: isMobile ? 15 : 17,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Wrap(
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          spacing: 24,
                          runSpacing: 20,
                          children: [
                            SizedBox(
                              width: isMobile ? double.infinity : 340,
                              child: _LandingOptionCard(
                                title: 'React Version',
                                description:
                                    'Open the React implementation of the portfolio.',
                                button: CyberButton(
                                  text: 'View React Version',
                                  icon: Icons.code,
                                  isPrimary: false,
                                  onPressed: _openReactVersion,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: isMobile ? double.infinity : 340,
                              child: _LandingOptionCard(
                                title: 'Flutter Web Version',
                                description:
                                    'Continue into the Flutter web portfolio from this app.',
                                button: CyberButton(
                                  text: 'View Flutter Version',
                                  icon: Icons.arrow_forward,
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushReplacementNamed(kFlutterRoute);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LandingOptionCard extends StatelessWidget {
  const _LandingOptionCard({
    required this.title,
    required this.description,
    required this.button,
  });

  final String title;
  final String description;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.cardColor.withValues(alpha: 0.92),
        border: Border.all(color: AppTheme.borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 26,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textSecondary,
                  height: 1.7,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 22),
          button,
        ],
      ),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _stackKey = GlobalKey();
  final GlobalKey _navKey = GlobalKey();
  final GlobalKey _topKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _cvKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  late final AnimationController _scrollPulseController;
  Offset _cursorPosition = Offset.zero;
  bool _cursorVisible = false;

  @override
  void initState() {
    super.initState();
    _scrollPulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 240),
      reverseDuration: const Duration(milliseconds: 900),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _scrollPulseController.reverse();
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollPulseController.dispose();
    super.dispose();
  }

  void _updateCursorPosition(Offset globalPosition) {
    final box = _stackKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) {
      return;
    }
    final local = box.globalToLocal(globalPosition);
    setState(() => _cursorPosition = local);
  }

  void _scrollToSection(String sectionId) {
    final keyMap = <String, GlobalKey>{
      'top': _topKey,
      'about': _aboutKey,
      'skills': _skillsKey,
      'projects': _projectsKey,
      'experience': _experienceKey,
      'cv': _cvKey,
      'contact': _contactKey,
    };
    final targetKey = keyMap[sectionId];
    if (targetKey == null) {
      return;
    }
    final context = targetKey.currentContext;
    final renderBox = context?.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      return;
    }
    final viewport = RenderAbstractViewport.of(renderBox);
    final navBox = _navKey.currentContext?.findRenderObject() as RenderBox?;
    final navHeight = navBox?.size.height ?? 0.0;
    final targetOffset = viewport.getOffsetToReveal(renderBox, 0).offset;
    final adjustedOffset = math.max(0.0, targetOffset - navHeight - 12.0);
    _scrollController.animateTo(
      adjustedOffset,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      drawer: isMobile ? MobileDrawer(onSectionTap: _scrollToSection) : null,
      body: MouseRegion(
        onEnter: (event) {
          if (event.kind == PointerDeviceKind.mouse) {
            setState(() => _cursorVisible = true);
            _updateCursorPosition(event.position);
          }
        },
        onExit: (_) => setState(() => _cursorVisible = false),
        onHover: (event) {
          if (event.kind == PointerDeviceKind.mouse) {
            _updateCursorPosition(event.position);
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topLeft,
              radius: 2.0,
              colors: [
                Color(0xFF0a0a0a),
                Color(0xFF050505),
              ],
            ),
          ),
          child: Stack(
            key: _stackKey,
            children: [
              // Logo background
              Positioned.fill(
                child: Opacity(
                  opacity: 0.1,
                  child: Image.asset(
                    'assets/images/Sirnaet-logo.png',
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              // Subtle grid background
              Positioned.fill(
                child: CustomPaint(
                  painter: GridPainter(),
                ),
              ),
              // Main content: sticky nav + scrollable body
              Column(
                children: [
                  Container(
                    key: _navKey,
                    child: StickyNav(onSectionTap: _scrollToSection),
                  ),
                  Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        if (notification is ScrollUpdateNotification ||
                            notification is UserScrollNotification) {
                          _scrollPulseController.forward(from: 0.0);
                        }
                        return false;
                      },
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Container(
                              key: _topKey,
                              child: HeroSection(onSectionTap: _scrollToSection),
                            ),
                            AboutSkillsSection(
                              aboutKey: _aboutKey,
                              skillsKey: _skillsKey,
                            ),
                            Container(
                              key: _projectsKey,
                              child: const ProjectsSection(),
                            ),
                            Container(
                              key: _experienceKey,
                              child: const ExperienceSection(),
                            ),
                            Container(
                              key: _cvKey,
                              child: const CvSection(),
                            ),
                            Container(
                              key: _contactKey,
                              child: const ContactSection(),
                            ),
                            const FooterSection(),
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedBuilder(
                animation: _scrollPulseController,
                builder: (context, child) {
                  return CursorGlowOverlay(
                    position: _cursorPosition,
                    visible: _cursorVisible,
                    pulse: _scrollPulseController.value,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Subtle grid background painter
class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1a1a1a)
      ..strokeWidth = 0.5;

    const spacing = 50.0;
    
    // Vertical lines
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }
    
    // Horizontal lines
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

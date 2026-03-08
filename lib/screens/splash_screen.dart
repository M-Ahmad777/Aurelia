import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _logoFade;
  late Animation<double> _logoScale;
  late Animation<double> _textSlide;
  late Animation<double> _textFade;
  late Animation<double> _taglineFade;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    );
    _logoFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _ctrl,
          curve: const Interval(0.0, 0.45, curve: Curves.easeOut)),
    );
    _logoScale = Tween<double>(begin: 0.75, end: 1.0).animate(
      CurvedAnimation(
          parent: _ctrl,
          curve: const Interval(0.0, 0.45, curve: Curves.easeOutBack)),
    );
    _textSlide = Tween<double>(begin: 28, end: 0).animate(
      CurvedAnimation(
          parent: _ctrl,
          curve: const Interval(0.3, 0.65, curve: Curves.easeOut)),
    );
    _textFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _ctrl,
          curve: const Interval(0.3, 0.65, curve: Curves.easeOut)),
    );
    _taglineFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _ctrl,
          curve: const Interval(0.55, 0.85, curve: Curves.easeOut)),
    );
    _ctrl.forward();
    Future.delayed(const Duration(milliseconds: 3200), () {
      if (mounted) Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_bg.png',
              fit: BoxFit.cover,
              color: AppColors.background.withOpacity(0.72),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.background, Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [AppColors.background, Colors.transparent],
                ),
              ),
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _ctrl,
              builder: (context, _) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Opacity(
                      opacity: _logoFade.value,
                      child: Transform.scale(
                        scale: _logoScale.value,
                        child: Container(
                          width: 88,
                          height: 88,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.gold.withOpacity(0.7),
                                width: 1.5),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.gold.withOpacity(0.2),
                                blurRadius: 24,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Opacity(
                      opacity: _textFade.value,
                      child: Transform.translate(
                        offset: Offset(0, _textSlide.value),
                        child: Text(
                          'AURELIA',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 44,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                            letterSpacing: 10,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Opacity(
                      opacity: _taglineFade.value,
                      child: Text(
                        'LUXURY  ·  NATURE  ·  ELEGANCE',
                        style: GoogleFonts.dmSans(
                          fontSize: 10,
                          color: AppColors.gold,
                          letterSpacing: 4.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Positioned(
            bottom: 52,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _taglineFade,
              builder: (context, _) => Opacity(
                opacity: _taglineFade.value,
                child: const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.2,
                      valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.gold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
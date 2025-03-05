import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coin_boost/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _initializeScreen();
  }

  void _initializeScreen() async {
    await Future.delayed(const Duration(milliseconds: 800));

    if (!mounted) return;

    setState(() {
      isExpanded = true;
      _controller.forward();
    });

    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const OnBoardingScreen()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    int color = 0xffF7931A;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ScaleTransition(
                scale: _animation,
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: screenWidth * 0.8,
                      maxHeight: screenHeight * 0.5,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: isExpanded ? 1 : 0,
                          child: Image.asset(
                            "images/boost_splash.png",
                            width: isExpanded ? screenWidth * 0.4 : 0,
                            height: isExpanded ? screenWidth * 0.4 : 0,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 12),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: isExpanded ? 1 : 0,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "COINBOOST",
                              style: GoogleFonts.robotoMono(
                                color: Color(color),
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
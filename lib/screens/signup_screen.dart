import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscure = true;
  bool _agreed = false;
  late AnimationController _animCtrl;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _fadeAnim = CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
        begin: const Offset(0, 0.06), end: Offset.zero)
        .animate(CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut));
    _animCtrl.forward();
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _animCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
            top: -60,
            left: -60,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.goldDark.withOpacity(0.18),
                    Colors.transparent
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -80,
            right: -40,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.green.withOpacity(0.18),
                    Colors.transparent
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: FadeTransition(
              opacity: _fadeAnim,
              child: SlideTransition(
                position: _slideAnim,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.white10),
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.white06,
                          ),
                          child: const Icon(Icons.arrow_back_ios_rounded,
                              size: 16, color: AppColors.white),
                        ),
                      ),
                      const SizedBox(height: 36),
                      Text(
                        'Create\nAccount',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 46,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                          height: 1.08,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Join the world of curated luxury',
                        style: GoogleFonts.dmSans(
                            fontSize: 14, color: AppColors.white60),
                      ),
                      const SizedBox(height: 44),
                      CustomTextField(
                        controller: _nameCtrl,
                        label: 'Full Name',
                        hint: 'Alexandra Monroe',
                        prefixIcon: Icons.person_outline_rounded,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _emailCtrl,
                        label: 'Email Address',
                        hint: 'hello@aurelia.com',
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icons.alternate_email_rounded,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _passCtrl,
                        label: 'Password',
                        hint: 'Create a strong password',
                        obscureText: _obscure,
                        prefixIcon: Icons.lock_outline_rounded,
                        suffixIcon: _obscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        onSuffixTap: () =>
                            setState(() => _obscure = !_obscure),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () => setState(() => _agreed = !_agreed),
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 180),
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: _agreed
                                    ? AppColors.gold
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: _agreed
                                      ? AppColors.gold
                                      : AppColors.white30,
                                  width: 1.5,
                                ),
                              ),
                              child: _agreed
                                  ? const Icon(Icons.check_rounded,
                                  size: 14, color: AppColors.background)
                                  : null,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: 'I agree to the ',
                                  style: GoogleFonts.dmSans(
                                      fontSize: 13, color: AppColors.white60),
                                  children: [
                                    TextSpan(
                                      text: 'Terms of Service',
                                      style: GoogleFonts.dmSans(
                                        fontSize: 13,
                                        color: AppColors.gold,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' and ',
                                      style: GoogleFonts.dmSans(
                                          fontSize: 13,
                                          color: AppColors.white60),
                                    ),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: GoogleFonts.dmSans(
                                        fontSize: 13,
                                        color: AppColors.gold,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 36),
                      CustomButton(
                        label: 'CREATE ACCOUNT',
                        onTap: () =>
                            Navigator.pushReplacementNamed(context, '/main'),
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account?  ',
                              style: GoogleFonts.dmSans(
                                  fontSize: 13, color: AppColors.white60),
                              children: [
                                TextSpan(
                                  text: 'Sign In',
                                  style: GoogleFonts.dmSans(
                                    fontSize: 13,
                                    color: AppColors.gold,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 36),
                    ],
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
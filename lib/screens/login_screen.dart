import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscure = true;
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
            top: -80,
            right: -80,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.green.withOpacity(0.22),
                    Colors.transparent
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -60,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.goldDark.withOpacity(0.14),
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
                      const SizedBox(height: 48),
                      Center(
                        child: Column(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.gold.withOpacity(0.5),
                                    width: 1),
                              ),
                              child: ClipOval(
                                child: Image.asset('assets/images/logo.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'AURELIA',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColors.gold,
                                letterSpacing: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 52),
                      Text(
                        'Welcome\nBack',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 46,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                          height: 1.08,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Sign in to continue your luxury journey',
                        style: GoogleFonts.dmSans(
                            fontSize: 14, color: AppColors.white60),
                      ),
                      const SizedBox(height: 44),
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
                        hint: '••••••••',
                        obscureText: _obscure,
                        prefixIcon: Icons.lock_outline_rounded,
                        suffixIcon: _obscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        onSuffixTap: () =>
                            setState(() => _obscure = !_obscure),
                      ),
                      const SizedBox(height: 14),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.dmSans(
                            fontSize: 13,
                            color: AppColors.gold,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 36),
                      CustomButton(
                        label: 'SIGN IN',
                        onTap: () =>
                            Navigator.pushReplacementNamed(context, '/main'),
                      ),
                      const SizedBox(height: 28),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(color: AppColors.white10, height: 1)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'or continue with',
                              style: GoogleFonts.dmSans(
                                  fontSize: 12, color: AppColors.white30),
                            ),
                          ),
                          Expanded(
                              child: Divider(color: AppColors.white10, height: 1)),
                        ],
                      ),
                      const SizedBox(height: 28),
                      Row(
                        children: [
                          Expanded(
                            child: _SocialButton(
                              imagePath: 'assets/images/google_icon.png',
                              label: 'Google',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _SocialButton(
                              imagePath: 'assets/images/apple_icon.png',
                              label: 'Apple',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 44),
                      Center(
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, '/signup'),
                          child: RichText(
                            text: TextSpan(
                              text: "Don't have an account?  ",
                              style: GoogleFonts.dmSans(
                                  fontSize: 13, color: AppColors.white60),
                              children: [
                                TextSpan(
                                  text: 'Create one',
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
                      const SizedBox(height: 32),
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

class _SocialButton extends StatelessWidget {
  final String imagePath;
  final String label;

  const _SocialButton({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white10),
        borderRadius: BorderRadius.circular(14),
        color: AppColors.white06,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 20, height: 20),
          const SizedBox(width: 10),
          Text(
            label,
            style: GoogleFonts.dmSans(
              fontSize: 14,
              color: AppColors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
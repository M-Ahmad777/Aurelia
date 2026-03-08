import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isOutlined;

  const CustomButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          gradient: isOutlined
              ? null
              : const LinearGradient(
            colors: [AppColors.goldLight, AppColors.goldDark],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border:
          isOutlined ? Border.all(color: AppColors.gold, width: 1.5) : null,
          boxShadow: isOutlined
              ? null
              : [
            BoxShadow(
              color: AppColors.gold.withOpacity(0.28),
              blurRadius: 16,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.dmSans(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: isOutlined ? AppColors.gold : AppColors.background,
              letterSpacing: 1.8,
            ),
          ),
        ),
      ),
    );
  }
}
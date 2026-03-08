import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: _buildHeader(context)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStatsRow(),
                  const SizedBox(height: 28),
                  _buildSection(
                    'Account',
                    [
                      _MenuItemData(
                        icon: Icons.person_outline_rounded,
                        label: 'Personal Information',
                        subtitle: 'Name, email, phone',
                      ),
                      _MenuItemData(
                        icon: Icons.location_on_outlined,
                        label: 'Saved Addresses',
                        subtitle: '2 saved locations',
                      ),
                      _MenuItemData(
                        icon: Icons.payment_outlined,
                        label: 'Payment Methods',
                        subtitle: 'Visa •••• 4821',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildSection(
                    'Shopping',
                    [
                      _MenuItemData(
                        icon: Icons.shopping_bag_outlined,
                        label: 'My Orders',
                        subtitle: '12 total orders',
                      ),
                      _MenuItemData(
                        icon: Icons.favorite_border_rounded,
                        label: 'Wishlist',
                        subtitle: '8 saved items',
                      ),
                      _MenuItemData(
                        icon: Icons.star_border_rounded,
                        label: 'My Reviews',
                        subtitle: '5 reviews written',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildSection(
                    'Preferences',
                    [
                      _MenuItemData(
                        icon: Icons.notifications_outlined,
                        label: 'Notifications',
                        subtitle: 'Manage alerts & offers',
                      ),
                      _MenuItemData(
                        icon: Icons.language_outlined,
                        label: 'Language & Region',
                        subtitle: 'English · USD',
                      ),
                      _MenuItemData(
                        icon: Icons.privacy_tip_outlined,
                        label: 'Privacy Policy',
                        subtitle: '',
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  _buildLogoutButton(context),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.surface, AppColors.background],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Profile',
                      style: Theme.of(context).textTheme.displaySmall),
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.white10,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: const Icon(
                      Icons.settings_outlined,
                      size: 18,
                      color: AppColors.white60,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.gold, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.gold.withOpacity(0.2),
                              blurRadius: 16,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/avatar.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.gold,
                                AppColors.goldDark
                              ],
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit_rounded,
                            size: 13,
                            color: AppColors.background,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alexandra Monroe',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20,
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'alex.monroe@email.com',
                          style: GoogleFonts.dmSans(
                              fontSize: 12, color: AppColors.white60),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.gold.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.gold.withOpacity(0.4),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.workspace_premium_rounded,
                                  size: 12, color: AppColors.gold),
                              const SizedBox(width: 5),
                              Text(
                                'GOLD MEMBER',
                                style: GoogleFonts.dmSans(
                                  fontSize: 9,
                                  color: AppColors.gold,
                                  letterSpacing: 1.8,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: const [
        _StatBox(label: 'Orders', value: '12'),
        SizedBox(width: 12),
        _StatBox(label: 'Wishlist', value: '8'),
        SizedBox(width: 12),
        _StatBox(label: 'Reviews', value: '5'),
      ],
    );
  }

  Widget _buildSection(String title, List<_MenuItemData> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 18,
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.white10),
          ),
          child: Column(
            children: items.asMap().entries.map((entry) {
              final isLast = entry.key == items.length - 1;
              return Column(
                children: [
                  _buildMenuItem(entry.value),
                  if (!isLast)
                    Container(
                      height: 1,
                      margin: const EdgeInsets.only(left: 58, right: 16),
                      color: AppColors.white10,
                    ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(_MenuItemData item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.gold.withOpacity(0.1),
              borderRadius: BorderRadius.circular(11),
              border: Border.all(color: AppColors.gold.withOpacity(0.2)),
            ),
            child: Icon(item.icon, size: 17, color: AppColors.gold),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.label,
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (item.subtitle.isNotEmpty) ...[
                  const SizedBox(height: 1),
                  Text(
                    item.subtitle,
                    style: GoogleFonts.dmSans(
                        fontSize: 11, color: AppColors.white30),
                  ),
                ],
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded,
              color: AppColors.white30, size: 20),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, '/login'),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.error.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.error.withOpacity(0.25)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.logout_rounded, size: 18, color: AppColors.error),
            const SizedBox(width: 10),
            Text(
              'Sign Out',
              style: GoogleFonts.dmSans(
                fontSize: 14,
                color: AppColors.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItemData {
  final IconData icon;
  final String label;
  final String subtitle;

  const _MenuItemData({
    required this.icon,
    required this.label,
    required this.subtitle,
  });
}

class _StatBox extends StatelessWidget {
  final String label;
  final String value;

  const _StatBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.white10),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: GoogleFonts.playfairDisplay(
                fontSize: 22,
                color: AppColors.gold,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: GoogleFonts.dmSans(
                  fontSize: 11, color: AppColors.white60),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/app_data.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'All';

  List<Product> get _filtered {
    if (_selectedCategory == 'All') return AppData.products;
    return AppData.products
        .where((p) => p.category == _selectedCategory)
        .toList();
  }

  void _goToDetail(Product product) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, animation, __) =>
            ProductDetailScreen(product: product),
        transitionsBuilder: (_, animation, __, child) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(child: _buildHeroBanner()),
          SliverToBoxAdapter(child: _buildCollectionsSection()),
          SliverToBoxAdapter(child: _buildCategoryFilter()),
          SliverToBoxAdapter(child: _buildFeaturedBanner()),
          SliverToBoxAdapter(child: _buildProductsSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 28)),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      backgroundColor: AppColors.background,
      floating: true,
      snap: true,
      elevation: 0,
      expandedHeight: 0,
      toolbarHeight: 60,
      title: Text(
        'AURELIA',
        style: GoogleFonts.playfairDisplay(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColors.gold,
          letterSpacing: 5,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search_rounded, color: AppColors.white, size: 22),
          onPressed: () {},
          padding: EdgeInsets.zero,
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined, color: AppColors.white, size: 22),
          onPressed: () {},
          padding: const EdgeInsets.only(right: 16),
        ),
      ],
    );
  }

  Widget _buildHeroBanner() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: SizedBox(
          height: 196,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/banner_bg.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Colors.transparent,
                        AppColors.background.withOpacity(0.9),
                      ],
                      stops: const [0.35, 1.0],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.gold.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: AppColors.gold.withOpacity(0.45),
                            width: 1),
                      ),
                      child: Text(
                        'NEW COLLECTION',
                        style: GoogleFonts.dmSans(
                          fontSize: 9,
                          color: AppColors.gold,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Golden\nSeason 2025',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 9),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.goldLight, AppColors.goldDark],
                        ),
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.gold.withOpacity(0.28),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        'Explore Now',
                        style: GoogleFonts.dmSans(
                          fontSize: 12,
                          color: AppColors.background,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCollectionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Collections',
                  style: Theme.of(context).textTheme.headlineMedium),
              Text(
                'See All',
                style: GoogleFonts.dmSans(
                    fontSize: 13,
                    color: AppColors.gold,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 128,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 20),
            itemCount: AppData.collections.length,
            itemBuilder: (context, i) {
              final c = AppData.collections[i];
              return Container(
                width: 116,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: AppColors.card,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          c['image']!,
                          fit: BoxFit.cover,
                          color: Colors.black.withOpacity(0.38),
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.75),
                                Colors.transparent
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                c['name']!,
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 11,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                c['items']!,
                                style: GoogleFonts.dmSans(
                                    fontSize: 9, color: AppColors.gold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryFilter() {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SizedBox(
        height: 38,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 20),
          itemCount: AppData.categories.length,
          itemBuilder: (context, i) {
            final cat = AppData.categories[i];
            final isSelected = cat == _selectedCategory;
            return GestureDetector(
              onTap: () => setState(() => _selectedCategory = cat),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                margin: const EdgeInsets.only(right: 10),
                padding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? const LinearGradient(
                      colors: [AppColors.gold, AppColors.goldDark])
                      : null,
                  color: isSelected ? null : AppColors.white10,
                  borderRadius: BorderRadius.circular(20),
                  border: isSelected
                      ? null
                      : Border.all(color: AppColors.white10),
                  boxShadow: isSelected
                      ? [
                    BoxShadow(
                      color: AppColors.gold.withOpacity(0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    )
                  ]
                      : null,
                ),
                child: Text(
                  cat,
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    color: isSelected
                        ? AppColors.background
                        : AppColors.white60,
                    fontWeight:
                    isSelected ? FontWeight.w700 : FontWeight.w400,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFeaturedBanner() {
    final featured =
    AppData.products.where((p) => p.isFeatured).toList();
    if (featured.isEmpty) return const SizedBox.shrink();
    final p = featured.first;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
      child: GestureDetector(
        onTap: () => _goToDetail(p),
        child: Container(
          height: 158,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF1D3B2A), Color(0xFF0E1F16)],
            ),
            border: Border.all(color: AppColors.gold.withOpacity(0.28)),
            boxShadow: [
              BoxShadow(
                color: AppColors.green.withOpacity(0.15),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.gold.withOpacity(0.14),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'FEATURED',
                          style: GoogleFonts.dmSans(
                            fontSize: 8,
                            color: AppColors.gold,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        p.name,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 17,
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            '\$${p.price.toStringAsFixed(0)}',
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 22,
                              color: AppColors.gold,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          if (p.originalPrice != null) ...[
                            const SizedBox(width: 8),
                            Text(
                              '\$${p.originalPrice!.toStringAsFixed(0)}',
                              style: GoogleFonts.dmSans(
                                fontSize: 13,
                                color: AppColors.white30,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(22),
                  bottomRight: Radius.circular(22),
                ),
                child: SizedBox(
                  width: 128,
                  height: double.infinity,
                  child: Image.asset(
                    p.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductsSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 26, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Products',
                  style: Theme.of(context).textTheme.headlineMedium),
              Text(
                '${_filtered.length} items',
                style: GoogleFonts.dmSans(
                    fontSize: 12, color: AppColors.white60),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.68,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
            ),
            itemCount: _filtered.length,
            itemBuilder: (context, i) {
              return ProductCard(
                product: _filtered[i],
                onTap: () => _goToDetail(_filtered[i]),
              );
            },
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../widgets/custom_button.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _wishlist = false;
  int _qty = 1;

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final inCart = cart.isInCart(widget.product.id);
    final bottomPad = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImageSection(),
                _buildDetailsSection(),
                SizedBox(height: 100 + bottomPad),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomBar(context, cart, inCart, bottomPad),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return Stack(
      children: [
        SizedBox(
          height: 420,
          width: double.infinity,
          child: Image.asset(
            widget.product.imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 140,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.background,
                  AppColors.background.withOpacity(0.0),
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.32),
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: AppColors.white10),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 16,
                      color: AppColors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => _wishlist = !_wishlist),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: _wishlist
                          ? AppColors.gold.withOpacity(0.18)
                          : Colors.black.withOpacity(0.32),
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                        color: _wishlist
                            ? AppColors.gold.withOpacity(0.6)
                            : AppColors.white10,
                      ),
                    ),
                    child: Icon(
                      _wishlist
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      size: 18,
                      color: _wishlist ? AppColors.gold : AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (widget.product.isNew)
          Positioned(
            bottom: 24,
            left: 20,
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.gold, AppColors.goldDark],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'NEW ARRIVAL',
                style: GoogleFonts.dmSans(
                  fontSize: 9,
                  color: AppColors.background,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.8,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildDetailsSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.brand,
                      style: GoogleFonts.dmSans(
                        fontSize: 10,
                        color: AppColors.gold,
                        letterSpacing: 3.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.product.name,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 24,
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${widget.product.price.toStringAsFixed(0)}',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 28,
                      color: AppColors.gold,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (widget.product.originalPrice != null)
                    Text(
                      '\$${widget.product.originalPrice!.toStringAsFixed(0)}',
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        color: AppColors.white30,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              ...List.generate(5, (i) {
                final filled = i < widget.product.rating.floor();
                final half = !filled &&
                    i < widget.product.rating &&
                    widget.product.rating % 1 >= 0.5;
                return Icon(
                  filled
                      ? Icons.star_rounded
                      : half
                      ? Icons.star_half_rounded
                      : Icons.star_border_rounded,
                  size: 16,
                  color: AppColors.gold,
                );
              }),
              const SizedBox(width: 8),
              Text(
                widget.product.rating.toString(),
                style: GoogleFonts.dmSans(
                  fontSize: 13,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '(${widget.product.reviewCount} reviews)',
                style: GoogleFonts.dmSans(
                    fontSize: 12, color: AppColors.white60),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Container(height: 1, color: AppColors.white10),
          const SizedBox(height: 20),
          Text(
            'About',
            style: GoogleFonts.playfairDisplay(
              fontSize: 18,
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.product.description,
            style: GoogleFonts.dmSans(
              fontSize: 14,
              color: AppColors.white60,
              height: 1.75,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.white10),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category',
                      style: GoogleFonts.dmSans(
                          fontSize: 11, color: AppColors.white30),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.product.category,
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Brand',
                      style: GoogleFonts.dmSans(
                          fontSize: 11, color: AppColors.white30),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.product.brand,
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        color: AppColors.gold,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quantity',
                style: GoogleFonts.dmSans(
                  fontSize: 15,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.white10),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_qty > 1) setState(() => _qty--);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Icon(Icons.remove_rounded,
                            size: 18, color: AppColors.white60),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        '$_qty',
                        style: GoogleFonts.dmSans(
                          fontSize: 16,
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() => _qty++),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Icon(Icons.add_rounded,
                            size: 18, color: AppColors.gold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(
      BuildContext context,
      CartProvider cart,
      bool inCart,
      double bottomPad,
      ) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 16, 20, bottomPad + 16),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.divider, width: 1)),
      ),
      child: CustomButton(
        label: inCart ? '✓  ADDED TO CART' : 'ADD TO CART',
        isOutlined: inCart,
        onTap: () {
          for (int i = 0; i < _qty; i++) {
            cart.addItem(widget.product);
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.check_circle_rounded,
                      color: AppColors.gold, size: 18),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '${widget.product.name} added to cart',
                      style: GoogleFonts.dmSans(
                          fontSize: 13, color: AppColors.white),
                    ),
                  ),
                ],
              ),
              backgroundColor: AppColors.cardElevated,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              margin: const EdgeInsets.all(16),
              duration: const Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }
}
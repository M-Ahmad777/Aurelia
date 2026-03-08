import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../providers/cart_provider.dart';
import '../widgets/custom_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final items = cart.items.values.toList();
    final bottomPad = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('My Cart',
                      style: Theme.of(context).textTheme.displaySmall),
                  if (items.isNotEmpty)
                    GestureDetector(
                      onTap: cart.clearCart,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.error.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.error.withOpacity(0.3)),
                        ),
                        child: Text(
                          'Clear All',
                          style: GoogleFonts.dmSans(
                            fontSize: 12,
                            color: AppColors.error,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            if (items.isEmpty)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: AppColors.white10,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          size: 40,
                          color: AppColors.white30,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Your cart is empty',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 22,
                          color: AppColors.white80,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Discover our curated collections',
                        style: GoogleFonts.dmSans(
                            fontSize: 14, color: AppColors.white30),
                      ),
                    ],
                  ),
                ),
              )
            else ...[
              Expanded(
                child: ListView.separated(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20),
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  separatorBuilder: (_, __) =>
                  const SizedBox(height: 12),
                  itemBuilder: (context, i) {
                    final item = items[i];
                    return Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.white10),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Image.asset(
                              item.product.imagePath,
                              width: 82,
                              height: 82,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.product.name,
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 14,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  item.product.category,
                                  style: GoogleFonts.dmSans(
                                      fontSize: 11,
                                      color: AppColors.gold),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '\$${(item.product.price * item.quantity).toStringAsFixed(0)}',
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 17,
                                    color: AppColors.gold,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () => cart
                                    .removeItem(item.product.id),
                                child: const Icon(
                                  Icons.close_rounded,
                                  size: 18,
                                  color: AppColors.white30,
                                ),
                              ),
                              const SizedBox(height: 14),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.white10,
                                  borderRadius:
                                  BorderRadius.circular(11),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () => cart
                                          .decreaseQuantity(
                                          item.product.id),
                                      child: const Padding(
                                        padding: EdgeInsets.all(7),
                                        child: Icon(
                                            Icons.remove_rounded,
                                            size: 14,
                                            color:
                                            AppColors.white60),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        '${item.quantity}',
                                        style: GoogleFonts.dmSans(
                                          fontSize: 14,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => cart
                                          .addItem(item.product),
                                      child: const Padding(
                                        padding: EdgeInsets.all(7),
                                        child: Icon(Icons.add_rounded,
                                            size: 14,
                                            color: AppColors.gold),
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
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 16, 20, bottomPad + 12),
                decoration: const BoxDecoration(
                  color: AppColors.surface,
                  border: Border(
                      top: BorderSide(
                          color: AppColors.divider, width: 1)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${cart.totalQuantity} ${cart.totalQuantity == 1 ? 'item' : 'items'}',
                          style: GoogleFonts.dmSans(
                              fontSize: 13, color: AppColors.white60),
                        ),
                        Text(
                          '\$${cart.totalAmount.toStringAsFixed(0)}',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 24,
                            color: AppColors.gold,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.local_shipping_outlined,
                                size: 13, color: AppColors.greenLight),
                            const SizedBox(width: 4),
                            Text(
                              'Free Shipping',
                              style: GoogleFonts.dmSans(
                                  fontSize: 12,
                                  color: AppColors.greenLight),
                            ),
                          ],
                        ),
                        Text(
                          'Luxury Tax included',
                          style: GoogleFonts.dmSans(
                              fontSize: 12, color: AppColors.white30),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      label:
                      'CHECKOUT  ·  \$${cart.totalAmount.toStringAsFixed(0)}',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
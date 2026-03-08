import '../models/product.dart';

class AppData {
  static const List<String> categories = [
    'All',
    'Skincare',
    'Fragrance',
    'Jewelry',
    'Accessories',
    'Wellness',
  ];

  static const List<Map<String, String>> collections = [
    {
      'name': 'Forest Elixir',
      'image': 'assets/images/collection1.png',
      'items': '24 pieces',
    },
    {
      'name': 'Golden Ritual',
      'image': 'assets/images/collection2.png',
      'items': '18 pieces',
    },
    {
      'name': 'Terra Luxe',
      'image': 'assets/images/collection3.png',
      'items': '31 pieces',
    },
    {
      'name': 'Verdant Soul',
      'image': 'assets/images/collection4.png',
      'items': '15 pieces',
    },
  ];

  static final List<Product> products = [
    const Product(
      id: '1',
      name: 'Emerald Dew Serum',
      brand: 'AURELIA',
      description:
      'A luxurious serum enriched with rare emerald botanicals and 24k gold micro-particles. Restores radiance and promotes cellular renewal for visibly youthful skin.',
      price: 148.00,
      originalPrice: 190.00,
      imagePath: 'assets/images/product1.png',
      category: 'Skincare',
      rating: 4.9,
      reviewCount: 342,
      isNew: true,
      isFeatured: true,
    ),
    const Product(
      id: '2',
      name: 'Velvet Forest Eau de Parfum',
      brand: 'AURELIA',
      description:
      'An opulent fragrance inspired by ancient forests. Top notes of bergamot and green tea, heart of vetiver and cedar, base of warm amber and white musk.',
      price: 210.00,
      imagePath: 'assets/images/product2.png',
      category: 'Fragrance',
      rating: 4.8,
      reviewCount: 189,
      isFeatured: true,
    ),
    const Product(
      id: '3',
      name: 'Gold Leaf Necklace',
      brand: 'AURELIA',
      description:
      'Hand-crafted 18k gold necklace with delicate leaf motifs inspired by the natural world. Each piece is individually finished by master artisans.',
      price: 380.00,
      imagePath: 'assets/images/product3.png',
      category: 'Jewelry',
      rating: 5.0,
      reviewCount: 76,
      isNew: true,
    ),
    const Product(
      id: '4',
      name: 'Moss & Gold Body Oil',
      brand: 'AURELIA',
      description:
      'Rare botanical body oil infused with 24k gold flakes and forest moss extract. Silky, non-greasy formula that leaves skin with a luminous, golden finish.',
      price: 95.00,
      originalPrice: 120.00,
      imagePath: 'assets/images/product4.png',
      category: 'Skincare',
      rating: 4.7,
      reviewCount: 223,
    ),
    const Product(
      id: '5',
      name: 'Obsidian Silk Scarf',
      brand: 'AURELIA',
      description:
      'Pure mulberry silk scarf with hand-painted gold botanical prints. A timeless statement accessory that transcends every season.',
      price: 165.00,
      imagePath: 'assets/images/product5.png',
      category: 'Accessories',
      rating: 4.9,
      reviewCount: 98,
      isFeatured: true,
    ),
    const Product(
      id: '6',
      name: 'Forest Ritual Candle',
      brand: 'AURELIA',
      description:
      'Luxury soy candle with notes of pine resin, sandalwood, and golden amber. 60-hour burn time in a handblown borosilicate glass vessel.',
      price: 78.00,
      imagePath: 'assets/images/product6.png',
      category: 'Wellness',
      rating: 4.8,
      reviewCount: 456,
      isNew: true,
    ),
    const Product(
      id: '7',
      name: 'Verdant Eye Cream',
      brand: 'AURELIA',
      description:
      'Ultra-rich eye cream with green tea peptides and colloidal gold. Visibly reduces puffiness and deeply nourishes the delicate periorbital area.',
      price: 128.00,
      imagePath: 'assets/images/product7.png',
      category: 'Skincare',
      rating: 4.6,
      reviewCount: 167,
    ),
    const Product(
      id: '8',
      name: 'Amber Glow Bracelet',
      brand: 'AURELIA',
      description:
      'Handcrafted gold bracelet featuring natural Baltic amber gemstones. Each amber piece is unique, carrying millions of years of ancient forest essence.',
      price: 290.00,
      imagePath: 'assets/images/product8.png',
      category: 'Jewelry',
      rating: 4.9,
      reviewCount: 54,
      isFeatured: true,
    ),
  ];
}
class Product {
  final String id;
  final String name;
  final String brand;
  final String description;
  final double price;
  final double? originalPrice;
  final String imagePath;
  final String category;
  final double rating;
  final int reviewCount;
  final bool isNew;
  final bool isFeatured;

  const Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    this.originalPrice,
    required this.imagePath,
    required this.category,
    required this.rating,
    required this.reviewCount,
    this.isNew = false,
    this.isFeatured = false,
  });
}
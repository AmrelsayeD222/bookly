import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? authorName;
  @HiveField(3)
  final String? imageUrl;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rating;

  BookEntity({
    required this.bookId,
    required this.title,
    required this.authorName,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });

  factory BookEntity.fromJson(Map<String, dynamic> json) {
    return BookEntity(
      bookId: json['id'] ?? '',
      title: json['volumeInfo']?['title'] ?? 'No Title',
      authorName:
          (json['volumeInfo']?['authors'] as List<dynamic>?)?.first ??
          'Unknown',
      imageUrl: json['volumeInfo']?['imageLinks']?['thumbnail'] ?? '',
      price: json['saleInfo']?['retailPrice']?['amount'] ?? 0,
      rating: json['volumeInfo']?['averageRating'] ?? 0,
    );
  }
}

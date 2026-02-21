import 'package:bookly/core/network/services/api_service.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class DetailsRemoteDataSource {
  Future<List<BookEntity>> fetchSimilarBooks({required String category});
}

class DetailsRemoteDataSourceImpl extends DetailsRemoteDataSource {
  final ApiService apiService;

  DetailsRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category}) async {
    // Note: The endpoint path can be extracted to constants if preferred.
    String endPoint =
        'volumes?Filtering=free-ebooks&Sorting=relevance&q=programming';

    if (category.isNotEmpty) {
      endPoint = 'volumes?Filtering=free-ebooks&Sorting=relevance&q=$category';
    }

    var data = await apiService.get(endPoint: endPoint);
    List<BookEntity> books = [];
    if (data['items'] != null) {
      for (var item in data['items']) {
        books.add(BookEntity.fromJson(item));
      }
    }
    return books;
  }
}

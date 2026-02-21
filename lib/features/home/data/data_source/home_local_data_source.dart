import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks({int pageNumber = 0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(featuredBooksBox);
    int length = box.values.length;
    if (startIndex >= length || startIndex < 0) {
      return [];
    }
    endIndex = endIndex > length ? length : endIndex;
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(newestBooksBox);
    int length = box.values.length;
    if (startIndex >= length || startIndex < 0) {
      return [];
    }
    endIndex = endIndex > length ? length : endIndex;
    return box.values.toList().sublist(startIndex, endIndex);
  }
}

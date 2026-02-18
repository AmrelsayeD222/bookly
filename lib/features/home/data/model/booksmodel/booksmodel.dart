import 'item.dart';

class Booksmodel {
  final String? kind;
  final int? totalItems;
  final List<Item>? items;

  const Booksmodel({this.kind, this.totalItems, this.items});

  factory Booksmodel.fromJson(Map<String, dynamic> json) => Booksmodel(
    kind: json['kind'] as String?,
    totalItems: json['totalItems'] as int?,
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

import 'dart:convert';
import 'package:shopee/data/models/book_model.dart';
Books booksFromJson(String str) => Books.fromJson(json.decode(str));

String booksToJson(Books data) => json.encode(data.toJson());

class Books {
  Books({
    required this.category,
    required this.books,
  });

  String category;
  List<Book> books;

  factory Books.fromJson(Map<String, dynamic> json) => Books(
    category: json["category"]??"no data",
    books: List<Book>.from(json["books"]??[].map((x) => Book.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "books": List<dynamic>.from(books.map((x) => x.toJson())),
  };
}


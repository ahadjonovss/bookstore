import 'package:flutter/material.dart';
import 'package:shopee/data/models/book_model.dart';
import 'package:shopee/data/repositories/admin/products_repository.dart';

class ProductsViewModel extends ChangeNotifier{

  final ProductsRepository productsRepository;
  ProductsViewModel({required this.productsRepository});

  List<String>? images;
  Book? newBook;

  Stream<List<Book>> listenCategories()=>productsRepository.getCategories();

  addBook(Book book)=>productsRepository.addProduct(book: book);

  deleteByDocId(String productId)=>productsRepository.deleteProductByDocId(docId: productId);

  updateCategory(String docId,Book book)=>productsRepository.updateCategory(book: book, docId: docId);

}
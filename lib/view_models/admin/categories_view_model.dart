import 'package:flutter/cupertino.dart';
import 'package:shopee/data/models/category_model.dart';
import 'package:shopee/data/repositories/admin/categories_repository.dart';

class CategoriesViewModel extends ChangeNotifier{
  final CategoriesRepository categoriesRepository;
  CategoriesViewModel({required this.categoriesRepository});

  Stream<List<CategoryModel>>? categories;

  Stream<List<CategoryModel>> listenCategories(){
    categories=categoriesRepository.getCategories() ;
    return categoriesRepository.getCategories();

  }

  addCategory(CategoryModel categoryModel)=>categoriesRepository.createCategory(categoryModel: categoryModel);

  deleteByDocId(String categoryId)=>categoriesRepository.deleteCategory(docId: categoryId);

  updateCategory(String docId,CategoryModel categoryModel)=>categoriesRepository.updateCategory(categoryModel: categoryModel, docId: docId);



}
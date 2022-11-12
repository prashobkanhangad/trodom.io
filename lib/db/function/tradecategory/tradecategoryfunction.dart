import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tradom_io/db/model/tradecategory/tradecategory.dart';

const CATEGORY_DB_NAME = 'category-database';

abstract class CategoryDbFunctions {
  Future<List<CategoryModel>> getCategories();
  Future<void> insertCategory(CategoryModel value);

  Future<void> deleteCategory(String categoryID);
}

class CategoryDB implements CategoryDbFunctions {
  CategoryDB._internal();

  static CategoryDB instance = CategoryDB._internal();

  factory CategoryDB() {
    return instance;
  }

  ValueNotifier<List<CategoryModel>> intradayCategoryListListener =
      ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> positionalCategoryListListener =
      ValueNotifier([]);

  @override
  Future<void> insertCategory(CategoryModel value) async {
    final _catogoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await _catogoryDB.put(value.id, value);

    // log(value.type.toString());
    refreshUI();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final _catogoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    return _catogoryDB.values.toList();
  }

  Future<void> refreshUI() async {
    final _allCategories = await getCategories();
    intradayCategoryListListener.value.clear();
    positionalCategoryListListener.value.clear();

    await Future.forEach(
      _allCategories,
      (CategoryModel category) => {
        if (category.type == CategoryType.intraday)
          {intradayCategoryListListener.value.add(category)}
        else
          {positionalCategoryListListener.value.add(category)}
      },
    );
    intradayCategoryListListener.notifyListeners();
    positionalCategoryListListener.notifyListeners();
  }

  @override
  Future<void> deleteCategory(String categoryID) async {
    final _catogoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await _catogoryDB.delete(categoryID);
    refreshUI();
  }
}

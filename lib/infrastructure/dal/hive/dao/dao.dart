import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/contracts/entities/entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class DAO<T extends EntityContract> {
  static Future<void> initDatabase() async {
    await Hive.initFlutter();
  }

  Future<Box> get box async {
    return await Hive.openBox(collection);
  }

  @protected
  String get collection;
  @protected
  T constructor(Map<String, dynamic> map);

  Future<T?> entity() async {
    final box = await this.box;

    if (box.isEmpty) {
      return null;
    }

    return constructor(box.toMap().cast<String, dynamic>());
  }

  Future<void> set(T entity) async {
    final box = await this.box;
    await box.putAll(entity.toMap());
  }

  Future<void> add(T entity) {
    throw UnimplementedError();
  }

  Future<void> addAll(List<T> entities) {
    throw UnimplementedError();
  }

  Future<List<T>> all() {
    throw UnimplementedError();
  }

  Future<void> update(T entity) {
    throw UnimplementedError();
  }

  Future<void> remove(T entity) {
    throw UnimplementedError();
  }

  Future<void> clear() async {
    final box = await this.box;
    await box.clear();
  }
}

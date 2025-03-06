import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sample_architecture/dal/local/contracts/dao/dao_contract.dart';
import 'package:flutter_sample_architecture/dal/local/contracts/entities/entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class DAO<T extends EntityContract> implements SingleDAOContract<T> {
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

  @override
  Future<T?> entity() async {
    final box = await this.box;

    if (box.isEmpty) {
      return null;
    }

    return constructor(box.toMap().cast<String, dynamic>());
  }

  @override
  Future<void> set(T entity) async {
    final box = await this.box;
    await box.putAll(entity.toMap());
  }

  @override
  Future<void> clear() async {
    final box = await this.box;
    await box.clear();
  }
}

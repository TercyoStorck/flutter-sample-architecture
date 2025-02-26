import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/contracts/dao/dao_contract.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class DAO implements DAOContract {
  static Future<void> initDatabase() async {
    await Hive.initFlutter();
  }

  Future<Box> get box async {
    return await Hive.openBox(boxName);
  }

  @protected
  String get boxName;

  @override
  Future<void> clear() async {
    final box = await this.box;
    await box.clear();
  }
}

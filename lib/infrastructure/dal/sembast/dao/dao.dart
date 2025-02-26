import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/contracts/dao/dao_contract.dart';
import 'package:flutter_sample_architecture/infrastructure/dal/contracts/entities/entity.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

export 'package:sembast/sembast.dart';

abstract class DAO<T extends EntityContract> implements DAOContract {
  static Completer<Database>? _dbOpenCompleter;

  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      _openDatabase();
    }

    return _dbOpenCompleter!.future;
  }

  Future _openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, 'main.db');

    final database = await databaseFactoryIo.openDatabase(dbPath);
    _dbOpenCompleter!.complete(database);
  }

  @protected
  String get storeName;
  @protected
  StoreRef get store => intMapStoreFactory.store(storeName);

  @override
  Future<void> clear() async {
    await store.delete(await this.database);
  }

  Future<void> add(T entity) async {
    await this.store.add(await this.database, entity.toMap());
  }

  Future<void> addAll(List<T> entities) async {
    await this.store.addAll(await this.database, entities.map((entity) => entity.toMap()).toList());
  }
}

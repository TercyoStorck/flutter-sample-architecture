import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sample_architecture/dal/local/contracts/dao/dao_contract.dart';
import 'package:flutter_sample_architecture/dal/local/contracts/entities/entity.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

export 'package:sembast/sembast.dart';

abstract class DAO<T extends EntityContract> implements DatabaseDAOContract<T> {
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
  String get collection;
  @protected
  StoreRef get store => intMapStoreFactory.store(collection);
  @protected
  T constructor(Map<String, dynamic> map);

  @override
  Future<void> add(T entity) async {
    await this.store.add(await this.database, entity.toMap());
  }

  @override
  Future<void> addAll(List<T> entities) async {
    await this.store.addAll(await this.database, entities.map((entity) => entity.toMap()).toList());
  }

  Future<List<T>> find(Finder finder) async {
    final snapshots = await this.store.find(await this.database, finder: finder);
    return snapshots.map((snapshot) => constructor(snapshot.value as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<T>> all() async {
    final snapshots = await this.store.find(await this.database);
    return snapshots.map((snapshot) => constructor(snapshot.value as Map<String, dynamic>)).toList();
  }

  @protected
  Future<void> modify(T entity, Finder finder) async {
    await store.update(await this.database, entity.toMap(), finder: finder);
  }

  @protected
  Future<void> delete(Finder finder) async {
    await store.delete(await this.database, finder: finder);
  }

  @override
  Future<void> clear() async {
    await store.delete(await this.database);
  }
}

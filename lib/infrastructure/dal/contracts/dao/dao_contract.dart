abstract class DAOContract<T> {
  ///Add an entity to table/collection
  Future<void> add(T entity);
  ///The entire table/collection is replaced by this entity.
  ///This is used when you wanna only an entity in your table/collection
  Future<void> set(T entity);
  ///Add all entities to table/collection
  Future<void> addAll(List<T> entities);
  ///get all entities to table/collection
  Future<List<T>> all();
  ///Remove an entity in table/collection
  Future<void> update(T entity);
  ///Remove an entity from table/collection
  Future<void> remove(T entity);
  ///Clear a table/collection
  Future<void> clear();
}
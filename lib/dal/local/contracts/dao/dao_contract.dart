abstract class DAOContract {
  Future<void> clear();
}

abstract class SingleDAOContract<T> extends DAOContract {
  Future<T?> entity();
  Future<void> set(T entity);
}

abstract class DatabaseDAOContract<T> extends DAOContract {
  Future<void> add(T entity);
  Future<void> addAll(List<T> entities);
  Future<List<T>> all();
  Future<void> update(T entity);
  Future<void> remove(T entity);
}

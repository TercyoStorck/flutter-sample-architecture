extension ListExtension<E> on Iterable<E> {
  Map<T, List<E>> groupBy<T>(T Function(E) key) {
    var map = <T, List<E>>{};
    for (var element in this) {
      (map[key(element)] ??= []).add(element);
    }
    return map;
  }
}

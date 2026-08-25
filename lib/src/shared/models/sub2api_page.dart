/// A page returned by a Sub2API list endpoint.
final class Sub2ApiPage<T> {
  const Sub2ApiPage({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.total,
    required this.pages,
  });

  final List<T> items;
  final int page;
  final int pageSize;
  final int pages;
  final int total;
}

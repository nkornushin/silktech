class FetchedList<T> {
  FetchedList({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.items,
  });

  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<T> items;
}

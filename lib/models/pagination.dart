class Pagination {
  Pagination({
    required this.offset,
    required this.limit,
  });

  int offset;
  int limit;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        offset: json['offset'],
        limit: json['limit'],
      );

  Map<String, dynamic> toJson() => {
        'offset': offset,
        'limit': limit,
      };
}

class Zekr {
  final String content;
  final String count;
  final String description;

  Zekr({
    required this.content,
    required this.count,
    required this.description,
  });

  factory Zekr.fromJson(Map<String, dynamic> json) {
    return Zekr(
      content: json['content'] ?? '',
      count: json['count'] ?? '1',
      description: json['description'] ?? '',
    );
  }
}

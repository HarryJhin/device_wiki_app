class Laptop {
  final String name;
  final String url;

  const Laptop({
    required this.name,
    required this.url,
  });

  factory Laptop.fromMap(Map<String, dynamic> map) {
    final properties = map['properties'] as Map<String, dynamic>;
    return Laptop(
      name: properties['이름']?['title']?[0]?['plain_text'] ?? '?',
      url: map['url'] ?? '?',
    );
  }
}

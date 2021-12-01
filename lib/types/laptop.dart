class Laptop {
  final String name;

  const Laptop({
    required this.name,
  });

  factory Laptop.fromMap(Map<String, dynamic> map) {
    final properties = map['properties'] as Map<String, dynamic>;
    return Laptop(
      name: properties['이름']?['title']?[0]?['plain_text'] ?? '?',
    );
  }
}

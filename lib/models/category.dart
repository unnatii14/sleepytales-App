class StoryCategory {
  final String id;
  final String name;
  final String emoji;
  final int storyCount;
  final String description;

  StoryCategory({
    required this.id,
    required this.name,
    required this.emoji,
    required this.storyCount,
    required this.description,
  });

  factory StoryCategory.fromJson(Map<String, dynamic> json) {
    return StoryCategory(
      id: json['id'],
      name: json['name'],
      emoji: json['emoji'],
      storyCount: json['storyCount'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'emoji': emoji,
      'storyCount': storyCount,
      'description': description,
    };
  }
}

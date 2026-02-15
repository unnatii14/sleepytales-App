class Story {
  final String id;
  final String title;
  final String category;
  final String description;
  final int duration; // in minutes
  final double rating;
  final String imageUrl;
  final String audioUrl;
  final List<String> tags;
  final bool isFeatured;

  Story({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.duration,
    required this.rating,
    required this.imageUrl,
    required this.audioUrl,
    this.tags = const [],
    this.isFeatured = false,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      description: json['description'],
      duration: json['duration'],
      rating: json['rating'].toDouble(),
      imageUrl: json['imageUrl'],
      audioUrl: json['audioUrl'],
      tags: List<String>.from(json['tags'] ?? []),
      isFeatured: json['isFeatured'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'description': description,
      'duration': duration,
      'rating': rating,
      'imageUrl': imageUrl,
      'audioUrl': audioUrl,
      'tags': tags,
      'isFeatured': isFeatured,
    };
  }
}

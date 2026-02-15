class SleepMusic {
  final String id;
  final String title;
  final String description;
  final int duration; // in minutes
  final String imageUrl;
  final String audioUrl;
  final String category; // e.g., "nature", "white noise", "lullaby"

  SleepMusic({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.imageUrl,
    required this.audioUrl,
    required this.category,
  });

  factory SleepMusic.fromJson(Map<String, dynamic> json) {
    return SleepMusic(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      duration: json['duration'],
      imageUrl: json['imageUrl'],
      audioUrl: json['audioUrl'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'duration': duration,
      'imageUrl': imageUrl,
      'audioUrl': audioUrl,
      'category': category,
    };
  }
}

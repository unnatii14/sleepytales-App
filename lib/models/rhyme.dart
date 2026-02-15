class Rhyme {
  final String id;
  final String title;
  final String description;
  final int duration; // in minutes
  final String imageUrl;
  final String audioUrl;
  final List<String> lyrics;
  final bool isPopular;

  Rhyme({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.imageUrl,
    required this.audioUrl,
    this.lyrics = const [],
    this.isPopular = false,
  });

  factory Rhyme.fromJson(Map<String, dynamic> json) {
    return Rhyme(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      duration: json['duration'],
      imageUrl: json['imageUrl'],
      audioUrl: json['audioUrl'],
      lyrics: List<String>.from(json['lyrics'] ?? []),
      isPopular: json['isPopular'] ?? false,
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
      'lyrics': lyrics,
      'isPopular': isPopular,
    };
  }
}

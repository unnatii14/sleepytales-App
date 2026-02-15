import '../models/story.dart';

/// Complete SleepyTales Story Collection - 35 Stories
/// Based on https://sleepytalesstoryapp.netlify.app
class AllStoriesData {
  static List<Story> getAllStories() {
    return [
      // Story 1 - Animals
      Story(
        id: '1',
        title: "The Little Squirrel's Wish",
        category: 'Animals',
        description:
            'In a cozy forest, little Lily the squirrel dreams of having the biggest, fluffiest tail like her friends. One day, a wise old owl teaches her that being different makes her special. Lily discovers her unique talents and learns to love herself just the way she is. A heartwarming tale about self-acceptance and finding your own special gifts.',
        duration: 3,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1564349683136-77e08dba1ef7?w=600',
        audioUrl: 'assets/audio/stories/little-squirrel-wish.mp3',
        tags: ['kindness', 'self-worth', 'forest'],
        isFeatured: true,
      ),

      // Story 2 - Space
      Story(
        id: '2',
        title: "The Sleepy Moon's Lullaby",
        category: 'Space',
        description:
            'High up in the night sky, the gentle moon notices a tiny star who has lost her sparkle. With a soft, soothing lullaby, the moon helps the little star remember how to shine. Together they discover that even the smallest light can brighten the darkest night. A beautiful bedtime story about friendship, comfort, and finding your inner light when you need it most.',
        duration: 3,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1532693322450-2cb5c511067d?w=600',
        audioUrl: 'assets/audio/stories/sleepy-moon-lullaby.mp3',
        tags: ['comfort', 'friendship', 'night'],
        isFeatured: false,
      ),

      // Story 3 - Nature
      Story(
        id: '3',
        title: 'The Cloud Who Wanted to Be Rain',
        category: 'Nature',
        description: 'A fluffy cloud discovers its purpose by becoming rain.',
        duration: 3,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1534088568595-a066f410bcda?w=600',
        audioUrl: 'assets/audio/stories/cloud-rain.mp3',
        tags: ['purpose', 'nature', 'transformation'],
        isFeatured: false,
      ),

      // Story 4 - Adventures
      Story(
        id: '4',
        title: 'The Turtle Who Chased the Sunset',
        category: 'Adventures',
        description:
            'A little turtle creates beauty while chasing an impossible dream.',
        duration: 3,
        rating: 5.0,
        imageUrl:
            'https://images.unsplash.com/photo-1437622368342-7a3d73a34c8f?w=600',
        audioUrl: 'assets/audio/stories/turtle-sunset.mp3',
        tags: ['journey', 'beauty', 'perseverance'],
        isFeatured: true,
      ),

      // Story 5 - Magical World
      Story(
        id: '5',
        title: "The Sleepy Dragon Who Couldn't Roar",
        category: 'Magical World',
        description:
            'A gentle dragon learns that warm breath is better than fiery roars.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1615963244664-5b845b2025ee?w=600',
        audioUrl: 'assets/audio/stories/sleepy-dragon.mp3',
        tags: ['gentleness', 'acceptance', 'magic'],
        isFeatured: true,
      ),

      // Story 6 - Fairy Tales
      Story(
        id: '6',
        title: 'The Lantern of Little Lila',
        category: 'Fairy Tales',
        description:
            'A magical lantern glows brightest when kindness is shared.',
        duration: 4,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1518531933037-91b2f5f229cc?w=600',
        audioUrl: 'assets/audio/stories/lantern-lila.mp3',
        tags: ['kindness', 'magic', 'wishes'],
        isFeatured: false,
      ),

      // Story 7 - Moral Stories
      Story(
        id: '7',
        title: 'The Swan Who Lost Her Reflection',
        category: 'Moral Stories',
        description:
            'A beautiful swan discovers her true self through helping others.',
        duration: 3,
        rating: 4.7,
        imageUrl:
            'https://images.unsplash.com/photo-1470093851219-69951fcbb533?w=600',
        audioUrl: 'assets/audio/stories/swan-reflection.mp3',
        tags: ['self-discovery', 'helping', 'beauty'],
        isFeatured: false,
      ),

      // Story 8 - Animals
      Story(
        id: '8',
        title: 'The Brave Little Penguin',
        category: 'Animals',
        description:
            'A small penguin finds courage to slide down the icy hill.',
        duration: 3,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1551986782-d0169b3f8fa7?w=600',
        audioUrl: 'assets/audio/stories/brave-penguin.mp3',
        tags: ['courage', 'trying', 'polar'],
        isFeatured: false,
      ),

      // Story 9 - Space
      Story(
        id: '9',
        title: 'The Moon That Wanted to Dream',
        category: 'Space',
        description:
            'The moon finally gets to dream for just one magical breath.',
        duration: 3,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1509023464722-18d996393ca8?w=600',
        audioUrl: 'assets/audio/stories/moon-dream.mp3',
        tags: ['dreams', 'wishing', 'night-sky'],
        isFeatured: false,
      ),

      // Story 10 - Adventures
      Story(
        id: '10',
        title: 'The Turtle Who Wanted to Fly',
        category: 'Adventures',
        description: 'A turtle discovers swimming is his own way of flying.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1484406566174-9da000fda645?w=600',
        audioUrl: 'assets/audio/stories/turtle-fly.mp3',
        tags: ['acceptance', 'talents', 'ocean'],
        isFeatured: false,
      ),

      // Story 11 - Animals
      Story(
        id: '11',
        title: 'The Sleepy Bear and the Midnight Star',
        category: 'Animals',
        description:
            'A bear finds a gentle friend to help him sleep peacefully.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1589656966895-2f33e7653819?w=600',
        audioUrl: 'assets/audio/stories/sleepy-bear-star.mp3',
        tags: ['comfort', 'friendship', 'sleep'],
        isFeatured: true,
      ),

      // Story 12 - Nature
      Story(
        id: '12',
        title: 'The Butterfly Who Followed the Wind',
        category: 'Nature',
        description: 'A wandering butterfly discovers where she truly belongs.',
        duration: 3,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?w=600',
        audioUrl: 'assets/audio/stories/butterfly-wind.mp3',
        tags: ['belonging', 'home', 'nature'],
        isFeatured: false,
      ),

      // Story 13 - Animals
      Story(
        id: '13',
        title: "The Dolphin's Secret Song",
        category: 'Animals',
        description: 'A shy dolphin learns to share his beautiful voice.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1607153333879-c174d265f1d2?w=600',
        audioUrl: 'assets/audio/stories/dolphin-song.mp3',
        tags: ['confidence', 'music', 'ocean'],
        isFeatured: false,
      ),

      // Story 14 - Nature
      Story(
        id: '14',
        title: 'The Fox Who Collected Sunbeams',
        category: 'Nature',
        description:
            'A fox discovers that sharing warmth creates even more joy.',
        duration: 3,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1474511320723-9a56873867b5?w=600',
        audioUrl: 'assets/audio/stories/fox-sunbeams.mp3',
        tags: ['sharing', 'warmth', 'joy'],
        isFeatured: false,
      ),

      // Story 15 - Fairy Tales
      Story(
        id: '15',
        title: 'The Dove Who Delivered Dreams',
        category: 'Fairy Tales',
        description:
            'A gentle dove brings peaceful dreams to children everywhere.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1520262494112-9fe481d36ec3?w=600',
        audioUrl: 'assets/audio/stories/dove-dreams.mp3',
        tags: ['dreams', 'kindness', 'peace'],
        isFeatured: false,
      ),

      // Story 16 - Space
      Story(
        id: '16',
        title: 'The Curious Owl and the Lost Star',
        category: 'Space',
        description: 'A wise owl helps a little star find its way home.',
        duration: 4,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1563473213013-de2a0133c100?w=600',
        audioUrl: 'assets/audio/stories/owl-lost-star.mp3',
        tags: ['helping', 'adventure', 'stars'],
        isFeatured: false,
      ),

      // Story 17 - Nature
      Story(
        id: '17',
        title: 'The Sleepy Sunflower',
        category: 'Nature',
        description: 'A sunflower learns the importance of resting at night.',
        duration: 3,
        rating: 4.7,
        imageUrl:
            'https://images.unsplash.com/photo-1470509037663-253afd7f0f51?w=600',
        audioUrl: 'assets/audio/stories/sleepy-sunflower.mp3',
        tags: ['rest', 'nature', 'balance'],
        isFeatured: false,
      ),

      // Story 18 - Adventures
      Story(
        id: '18',
        title: 'The Rabbit and the Shooting Star',
        category: 'Adventures',
        description:
            'A kind rabbit makes a wish for everyone to have sweet dreams.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1535241749838-299277b6305f?w=600',
        audioUrl: 'assets/audio/stories/rabbit-shooting-star.mp3',
        tags: ['kindness', 'wishes', 'dreams'],
        isFeatured: true,
      ),

      // Story 19 - Nature
      Story(
        id: '19',
        title: 'The Whispering Willow Tree',
        category: 'Nature',
        description:
            'A wise willow tree shares comforting secrets with the forest.',
        duration: 4,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1502082553048-f009c37129b9?w=600',
        audioUrl: 'assets/audio/stories/whispering-willow.mp3',
        tags: ['wisdom', 'comfort', 'nature'],
        isFeatured: false,
      ),

      // Story 20 - Animals
      Story(
        id: '20',
        title: 'The Lost Baby Whale',
        category: 'Animals',
        description:
            'A baby whale finds her way back home with help from ocean friends.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=600',
        audioUrl: 'assets/audio/stories/lost-baby-whale.mp3',
        tags: ['family', 'ocean', 'helping'],
        isFeatured: false,
      ),

      // Story 21 - Magical World
      Story(
        id: '21',
        title: 'The Magical Music Box',
        category: 'Magical World',
        description:
            'A music box creates magical firefly stories for a moving child.',
        duration: 5,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=600',
        audioUrl: 'assets/audio/stories/magical-music-box.mp3',
        tags: ['magic', 'friendship', 'memories'],
        isFeatured: false,
      ),

      // Story 22 - Animals
      Story(
        id: '22',
        title: 'The Sleepy Sloth',
        category: 'Animals',
        description:
            'A sloth discovers that slow and steady is perfectly wonderful.',
        duration: 3,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1621522567494-f9e1dae456d3?w=600',
        audioUrl: 'assets/audio/stories/sleepy-sloth.mp3',
        tags: ['acceptance', 'patience', 'jungle'],
        isFeatured: false,
      ),

      // Story 23 - Space
      Story(
        id: '23',
        title: 'The Comet and the Lonely Planet',
        category: 'Space',
        description: 'A traveling comet brings friendship to a lonely planet.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1464802686167-b939a6910659?w=600',
        audioUrl: 'assets/audio/stories/comet-lonely-planet.mp3',
        tags: ['friendship', 'space', 'loneliness'],
        isFeatured: false,
      ),

      // Story 24 - Moral Stories
      Story(
        id: '24',
        title: 'The Firefly Who Lost Her Light',
        category: 'Moral Stories',
        description:
            'A firefly discovers that kindness makes her glow brightest.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1484406566174-9da000fda645?w=600',
        audioUrl: 'assets/audio/stories/firefly-lost-light.mp3',
        tags: ['kindness', 'inner-light', 'helping'],
        isFeatured: false,
      ),

      // Story 25 - Adventures
      Story(
        id: '25',
        title: 'The Little Lighthouse',
        category: 'Adventures',
        description:
            'A small lighthouse learns its light guides many safely home.',
        duration: 4,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=600',
        audioUrl: 'assets/audio/stories/little-lighthouse.mp3',
        tags: ['purpose', 'helping', 'ocean'],
        isFeatured: false,
      ),

      // Story 26 - Magical World
      Story(
        id: '26',
        title: 'The Elephant Who Painted Dreams',
        category: 'Magical World',
        description:
            'An artistic elephant paints beautiful dreams into reality.',
        duration: 5,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1564760055775-d63b17a55c44?w=600',
        audioUrl: 'assets/audio/stories/elephant-painted-dreams.mp3',
        tags: ['creativity', 'dreams', 'art'],
        isFeatured: false,
      ),

      // Story 27 - Nature
      Story(
        id: '27',
        title: 'The Cricket and the Silent Night',
        category: 'Nature',
        description:
            'A cricket learns that his gentle song brings comfort to others.',
        duration: 3,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=600',
        audioUrl: 'assets/audio/stories/cricket-silent-night.mp3',
        tags: ['music', 'comfort', 'nature'],
        isFeatured: false,
      ),

      // Story 28 - Nature
      Story(
        id: '28',
        title: 'The Snowy Owl and the Northern Lights',
        category: 'Nature',
        description: 'A snowy owl dances with the magical northern lights.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1551244072-5d12893278ab?w=600',
        audioUrl: 'assets/audio/stories/snowy-owl-northern-lights.mp3',
        tags: ['wonder', 'nature', 'magic'],
        isFeatured: true,
      ),

      // Story 29 - Moral Stories
      Story(
        id: '29',
        title: 'The Caterpillar Who Was Afraid to Change',
        category: 'Moral Stories',
        description:
            'A worried caterpillar discovers the beauty of transformation.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?w=600',
        audioUrl: 'assets/audio/stories/caterpillar-afraid-change.mp3',
        tags: ['change', 'growth', 'courage'],
        isFeatured: false,
      ),

      // Story 30 - Nature
      Story(
        id: '30',
        title: 'The Starfish and the Gentle Tide',
        category: 'Nature',
        description: 'A starfish learns to flow with the rhythm of the ocean.',
        duration: 3,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=600',
        audioUrl: 'assets/audio/stories/starfish-gentle-tide.mp3',
        tags: ['peace', 'ocean', 'rhythm'],
        isFeatured: false,
      ),

      // Story 31 - Adventures
      Story(
        id: '31',
        title: 'The Sleepy Train to Dreamland',
        category: 'Adventures',
        description:
            'A magical train carries sleepy passengers to wonderful dreams.',
        duration: 5,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1474487548417-781cb71495f3?w=600',
        audioUrl: 'assets/audio/stories/sleepy-train-dreamland.mp3',
        tags: ['dreams', 'adventure', 'sleep'],
        isFeatured: false,
      ),

      // Story 32 - Animals
      Story(
        id: '32',
        title: 'The Hummingbird Who Shared Joy',
        category: 'Animals',
        description: 'A tiny hummingbird spreads happiness wherever she flies.',
        duration: 3,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1570197788417-0e82375c9371?w=600',
        audioUrl: 'assets/audio/stories/hummingbird-shared-joy.mp3',
        tags: ['joy', 'sharing', 'happiness'],
        isFeatured: false,
      ),

      // Story 33 - Nature
      Story(
        id: '33',
        title: 'The Rainbow After the Storm',
        category: 'Nature',
        description:
            'A beautiful rainbow shows that every storm brings something good.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1501630834273-4b5604d2ee31?w=600',
        audioUrl: 'assets/audio/stories/rainbow-after-storm.mp3',
        tags: ['hope', 'beauty', 'nature'],
        isFeatured: false,
      ),

      // Story 34 - Fairy Tales
      Story(
        id: '34',
        title: 'The Bedtime Knight',
        category: 'Fairy Tales',
        description:
            'A gentle knight protects children\'s dreams throughout the night.',
        duration: 5,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1492681290082-e932832941e6?w=600',
        audioUrl: 'assets/audio/stories/bedtime-knight.mp3',
        tags: ['protection', 'dreams', 'bravery'],
        isFeatured: false,
      ),

      // Story 35 - Moral Stories
      Story(
        id: '35',
        title: 'The Wise Owl and the Worried Rabbit',
        category: 'Moral Stories',
        description:
            'A wise owl teaches a worried rabbit about peaceful thinking.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1563473213013-de2a0133c100?w=600',
        audioUrl: 'assets/audio/stories/wise-owl-worried-rabbit.mp3',
        tags: ['wisdom', 'worry', 'peace'],
        isFeatured: true,
      ),
    ];
  }

  static List<Story> getFeaturedStories() {
    return getAllStories().where((story) => story.isFeatured).toList();
  }

  static List<Story> getStoriesByCategory(String category) {
    return getAllStories()
        .where((story) => story.category == category)
        .toList();
  }

  static List<Story> getRecentStories({int limit = 6}) {
    return getAllStories().take(limit).toList();
  }
}

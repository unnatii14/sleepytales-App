import '../models/rhyme.dart';

class RhymesData {
  static final List<Rhyme> rhymes = [
    Rhyme(
      id: 'rhyme_001',
      title: 'ABCD Song',
      description: 'Learn the alphabet with this classic nursery rhyme',
      duration: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=600',
      audioUrl: 'assets/audio/rhymes/nrt-1-abcd-Song.mp3',
      lyrics: [
        'A B C D E F G,',
        'H I J K L M N O P,',
        'Q R S T U V,',
        'W X Y and Z.',
        'Now I know my ABCs,',
        'Next time won\'t you sing with me!',
      ],
      isPopular: true,
    ),
    Rhyme(
      id: 'rhyme_002',
      title: 'I\'m a Little Teapot',
      description: 'A fun and playful nursery rhyme about a teapot',
      duration: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1564890369478-c89ca6d9cde9?w=600',
      audioUrl: 'assets/audio/rhymes/nrt-2-i-am-a-little-teapot.mp3',
      lyrics: [
        'I\'m a little teapot, short and stout,',
        'Here is my handle, here is my spout.',
        'When I get all steamed up, hear me shout,',
        'Tip me over and pour me out!',
      ],
      isPopular: true,
    ),
    Rhyme(
      id: 'rhyme_003',
      title: 'Pat-a-Cake',
      description: 'A sweet baking rhyme for little ones',
      duration: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1486427944299-d1955d23e34d?w=600',
      audioUrl: 'assets/audio/rhymes/nrt-3-pat-a-cake.mp3',
      lyrics: [
        'Pat-a-cake, pat-a-cake, baker\'s man,',
        'Bake me a cake as fast as you can.',
        'Roll it and pat it and mark it with B,',
        'And put it in the oven for baby and me!',
      ],
      isPopular: false,
    ),
    Rhyme(
      id: 'rhyme_004',
      title: 'Row Row Row Your Boat',
      description: 'A gentle rowing adventure on the stream',
      duration: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=600',
      audioUrl: 'assets/audio/rhymes/nrt-5-row-row-row-your-boat.mp3',
      lyrics: [
        'Row, row, row your boat,',
        'Gently down the stream.',
        'Merrily, merrily, merrily, merrily,',
        'Life is but a dream.',
      ],
      isPopular: true,
    ),
    Rhyme(
      id: 'rhyme_005',
      title: 'One Two Buckle My Shoe',
      description: 'Count along with this fun number rhyme',
      duration: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1519340241574-2cec6aef0c01?w=600',
      audioUrl: 'assets/audio/rhymes/nrt-6-one-two-buckle-my-shoe.mp3',
      lyrics: [
        'One, two, buckle my shoe,',
        'Three, four, knock at the door,',
        'Five, six, pick up sticks,',
        'Seven, eight, lay them straight.',
      ],
      isPopular: false,
    ),
    Rhyme(
      id: 'rhyme_006',
      title: 'Baa Baa Black Sheep',
      description: 'A woolly tale of sharing',
      duration: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1516934024742-b461fba47600?w=600',
      audioUrl: 'assets/audio/rhymes/nrt-7-baa-baa-black-sheep.mp3',
      lyrics: [
        'Baa, baa, black sheep,',
        'Have you any wool?',
        'Yes sir, yes sir,',
        'Three bags full!',
      ],
      isPopular: true,
    ),
    Rhyme(
      id: 'rhyme_007',
      title: 'Twinkle Twinkle Little Star',
      description: 'A classic lullaby about the stars in the night sky',
      duration: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1502134249126-9f3755a50d78?w=600',
      audioUrl: 'assets/audio/rhymes/nrt-8-twinkle-twinkle-little-star.mp3',
      lyrics: [
        'Twinkle, twinkle, little star,',
        'How I wonder what you are!',
        'Up above the world so high,',
        'Like a diamond in the sky.',
      ],
      isPopular: true,
    ),
    Rhyme(
      id: 'rhyme_008',
      title: 'Head Shoulders Knees and Toes',
      description: 'Learn body parts with this active rhyme',
      duration: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?w=600',
      audioUrl: 'assets/audio/rhymes/nrt-9-head-shoulders-knees-and-toes.mp3',
      lyrics: [
        'Head, shoulders, knees and toes, knees and toes,',
        'Head, shoulders, knees and toes, knees and toes,',
        'Eyes and ears and mouth and nose,',
        'Head, shoulders, knees and toes, knees and toes!',
      ],
      isPopular: false,
    ),
    Rhyme(
      id: 'rhyme_009',
      title: 'Hey Diddle Diddle',
      description: 'A whimsical tale of a cat and a fiddle',
      duration: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=600',
      audioUrl: 'assets/audio/rhymes/nrt-10-hey-diddle-diddle.mp3',
      lyrics: [
        'Hey diddle diddle, the cat and the fiddle,',
        'The cow jumped over the moon.',
        'The little dog laughed to see such sport,',
        'And the dish ran away with the spoon!',
      ],
      isPopular: false,
    ),
    Rhyme(
      id: 'rhyme_010',
      title: 'BINGO',
      description: 'A farmer\'s dog named BINGO',
      duration: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=600',
      audioUrl: 'assets/audio/rhymes/nrt-13-bingo.mp3',
      lyrics: [
        'There was a farmer had a dog,',
        'And Bingo was his name-o.',
        'B-I-N-G-O, B-I-N-G-O, B-I-N-G-O,',
        'And Bingo was his name-o!',
      ],
      isPopular: true,
    ),
    Rhyme(
      id: 'rhyme_011',
      title: 'Hickory Dickory Dock',
      description: 'A mouse runs up the clock',
      duration: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1425082661705-1834bfd09dca?w=600',
      audioUrl: 'assets/audio/rhymes/nrt-14-hickory-dickory-dock.mp3',
      lyrics: [
        'Hickory dickory dock,',
        'The mouse ran up the clock.',
        'The clock struck one,',
        'The mouse ran down,',
        'Hickory dickory dock!',
      ],
      isPopular: false,
    ),
    Rhyme(
      id: 'rhyme_012',
      title: 'If You\'re Happy and You Know It',
      description: 'Express your happiness with actions',
      duration: 2,
      imageUrl:
          'https://images.unsplash.com/photo-1544776193-352d25ca82cd?w=600',
      audioUrl: 'assets/audio/rhymes/nrt-17-if-youre-happy-and-you-know-it.mp3',
      lyrics: [
        'If you\'re happy and you know it, clap your hands!',
        'If you\'re happy and you know it, clap your hands!',
        'If you\'re happy and you know it,',
        'Then your face will surely show it,',
        'If you\'re happy and you know it, clap your hands!',
      ],
      isPopular: true,
    ),
    Rhyme(
      id: 'rhyme_013',
      title: 'The Wheels on the Bus',
      description: 'A fun journey on the bus',
      duration: 3,
      imageUrl:
          'https://images.unsplash.com/photo-1570125909232-eb263c188f7e?w=600',
      audioUrl: 'assets/audio/rhymes/nrt-18-wheels-on-the-bus.mp3',
      lyrics: [
        'The wheels on the bus go round and round,',
        'Round and round, round and round.',
        'The wheels on the bus go round and round,',
        'All through the town!',
      ],
      isPopular: true,
    ),
    Rhyme(
      id: 'rhyme_014',
      title: 'Old MacDonald Had a Farm',
      description: 'Meet all the animals on the farm',
      duration: 3,
      imageUrl:
          'https://images.unsplash.com/photo-1500595046743-cd271d694d30?w=600',
      audioUrl: 'assets/audio/rhymes/nrt-19-old-macdonald-had-a-farm.mp3',
      lyrics: [
        'Old MacDonald had a farm, E-I-E-I-O!',
        'And on that farm he had a cow, E-I-E-I-O!',
        'With a moo-moo here and a moo-moo there,',
        'Here a moo, there a moo, everywhere a moo-moo!',
      ],
      isPopular: true,
    ),
  ];

  static List<Rhyme> getPopularRhymes() {
    return rhymes.where((rhyme) => rhyme.isPopular).toList();
  }

  static List<Rhyme> getAllRhymes() {
    return rhymes;
  }
}

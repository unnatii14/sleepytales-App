import '../models/story.dart';

/// Complete SleepyTales Story Collection - 45 Stories with Full Descriptions
/// Based on https://sleepytalesstoryapp.netlify.app
class AllStoriesData {
  static List<Story> getAllStories() {
    return [
      Story(
        id: '1',
        title: "The Little Squirrel's Wish",
        category: 'Animals',
        description:
            'In a cozy forest, little Lily the squirrel dreams of having the biggest, fluffiest tail like her friends. She feels sad when comparing herself to others. One day, a wise old owl teaches her that being different makes her special. Through helping friends with her quick climbing and brave spirit, Lily discovers her unique talents and learns to love herself just the way she is. A heartwarming tale about self-acceptance and celebrating what makes each of us special.',
        duration: 3,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['kindness', 'self-worth', 'forest'],
        isFeatured: true,
      ),
      Story(
        id: '2',
        title: "The Sleepy Moon's Lullaby",
        category: 'Space',
        description:
            'High up in the night sky, the gentle moon notices a tiny star who has lost her sparkle and can no longer shine bright. With a soft, soothing lullaby filled with love and encouragement, the moon helps the little star remember how to glow. Together they discover that even the smallest light can brighten the darkest night, and that friendship and kindness help us shine when we feel dim. A beautiful bedtime story about support and finding your inner light.',
        duration: 3,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['comfort', 'friendship', 'night'],
        isFeatured: false,
      ),
      Story(
        id: '3',
        title: 'The Cloud Who Wanted to Be Rain',
        category: 'Nature',
        description:
            'Fluffy the cloud floats lazily across the sky, watching other clouds turn into rain and nourish the earth below. She feels sad because she doesn\'t know how to let go. With help from the wise Wind and gentle Thunder, Fluffy learns that letting go is a gift, not a loss. When she finally becomes rain, she sees flowers bloom, trees grow tall, and realizes she has found her true purpose bringing life and joy to the world. A beautiful story about transformation and finding purpose.',
        duration: 3,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['purpose', 'nature', 'transformation'],
        isFeatured: false,
      ),
      Story(
        id: '4',
        title: 'The Turtle Who Chased the Sunset',
        category: 'Adventures',
        description:
            'Tommy the turtle has a big dream - to catch the beautiful sunset and keep its colors forever. Every evening he tries to walk faster, but the sunset always slips away beyond the horizon. Along his slow journey, he unknowingly creates a trail of beauty wherever he goes. Other animals follow his path and discover the wonderful places he has found. Tommy learns that chasing dreams isn\'t about catching them, but about the beautiful journey and the joy you spread along the way.',
        duration: 3,
        rating: 5.0,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['journey', 'beauty', 'perseverance'],
        isFeatured: true,
      ),
      Story(
        id: '5',
        title: "The Sleepy Dragon Who Couldn't Roar",
        category: 'Magical World',
        description:
            'In a magical kingdom lives Drake, a young dragon who can\'t roar like other dragons. Instead of scary flames, he breathes warm, cozy air that makes everyone feel sleepy and happy. At first he feels embarrassed and different, but when a cold winter arrives, Drake\'s gentle warmth saves the entire village from freezing. He becomes the most loved dragon of all, teaching everyone that being gentle and kind is more powerful than being loud and fierce.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['gentleness', 'acceptance', 'magic'],
        isFeatured: true,
      ),
      Story(
        id: '6',
        title: 'The Lantern of Little Lila',
        category: 'Fairy Tales',
        description:
            'Young Lila finds a mysterious old lantern in her grandmother\'s attic. The lantern has a magical secret - it glows brighter with every kind act Lila does. She shares her toys with friends, helps her neighbors carry groceries, and listens when others are sad. The lantern becomes so bright it lights up the entire village, bringing warmth and happiness to everyone. A magical tale about how small acts of kindness create the brightest light in the world.',
        duration: 4,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['kindness', 'magic', 'wishes'],
        isFeatured: false,
      ),
      Story(
        id: '7',
        title: 'The Swan Who Lost Her Reflection',
        category: 'Moral Stories',
        description:
            'Stella the swan was known as the most beautiful bird on the shimmering lake. She spent all day admiring her reflection in the water. One misty morning, she couldn\'t see her reflection anymore and felt completely lost. As she helps other animals find their way through the thick mist, she discovers something wonderful - their grateful smiles reflect back more beauty than any mirror ever could. Stella learns that true beauty comes from the kindness we show others.',
        duration: 3,
        rating: 4.7,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['self-discovery', 'helping', 'beauty'],
        isFeatured: false,
      ),
      Story(
        id: '8',
        title: 'The Brave Little Penguin',
        category: 'Animals',
        description:
            'Pip is the smallest penguin in all of Antarctica, and he\'s terrified of sliding down the big ice hill. All his friends zoom down with joyful squeals, but Pip\'s little flippers shake with fear. One day, a baby seal gets stuck at the very top of the hill. Pip must be brave to help. He takes a deep breath, slides down to rescue his friend, and discovers that being brave doesn\'t mean not being scared - it means doing the right thing even when you are afraid.',
        duration: 3,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['courage', 'trying', 'polar'],
        isFeatured: false,
      ),
      Story(
        id: '9',
        title: 'The Moon That Wanted to Dream',
        category: 'Space',
        description:
            'Every single night, the moon watches over sleeping children and their beautiful dreams. She sees adventures in candy lands, flights with friendly dragons, and magical tea parties. But the moon has never dreamed herself - she\'s always awake, lighting up the night sky for others. One special night, the stars decide to shine extra bright so the moon can finally rest. For just one magical breath, the moon closes her eyes and dreams the most wonderful dream.',
        duration: 3,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['dreams', 'wishing', 'night-sky'],
        isFeatured: false,
      ),
      Story(
        id: '10',
        title: 'The Turtle Who Wanted to Fly',
        category: 'Adventures',
        description:
            'Shelly the sea turtle watches birds soar gracefully through the sky and wishes more than anything to fly like them. She tries everything - jumping from rocks, flapping her flippers, even asking the wise eagles for flying lessons. One peaceful day, as she glides effortlessly through the crystal-clear ocean water, she realizes something amazing - she IS flying, just underwater! Shelly discovers that everyone has their own special way of soaring through life.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['acceptance', 'talents', 'ocean'],
        isFeatured: false,
      ),
      Story(
        id: '11',
        title: 'The Sleepy Bear and the Midnight Star',
        category: 'Animals',
        description:
            'Bruno the bear should be hibernating, but he has trouble falling asleep during the long winter. He tosses and turns in his cozy den until a little twinkling star peeks through a crack in the ceiling. The star tells Bruno the most gentle stories about the winter sky - about snowflake fairies dancing, aurora dancers painting the sky, and the moon guardian watching over the sleeping world. With each soft tale, Bruno\'s eyes grow heavier until he drifts into peaceful dreams.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['comfort', 'friendship', 'sleep'],
        isFeatured: true,
      ),
      Story(
        id: '12',
        title: 'The Butterfly Who Followed the Wind',
        category: 'Nature',
        description:
            'Bella the butterfly is born in a beautiful garden filled with colorful flowers. The wind keeps calling her to explore distant places, but she worries about leaving her cozy home. Her curiosity proves stronger than her fear. Bella follows the wind across sunny meadows, over tall mountains, and through valleys painted with rainbows. After a wonderful adventure discovering new flowers and making new friends, the wind gently brings her back home, where she belongs.',
        duration: 3,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['belonging', 'home', 'nature'],
        isFeatured: false,
      ),
      Story(
        id: '13',
        title: "The Dolphin's Secret Song",
        category: 'Animals',
        description:
            'Splash the dolphin has a wonderful secret - he can sing the most beautiful underwater song anyone has ever heard. But he\'s much too shy to share it with others. He watches other dolphins play and perform amazing tricks, wishing he could be brave like them. One day, a sad whale loses her way in the vast ocean, and only Splash\'s special song can guide her safely home. When Splash finally sings, all the ocean creatures stop to listen in wonder.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['confidence', 'music', 'ocean'],
        isFeatured: false,
      ),
      Story(
        id: '14',
        title: 'The Fox Who Collected Sunbeams',
        category: 'Nature',
        description:
            'Rusty the fox loves golden sunbeams so much that he tries to collect them in his den. He gathers them in his paws, tries to carry them in baskets of leaves, but they always slip away through his fingers. Feeling sad in his cold, dark den, he has a wonderful realization - sunbeams are meant to be shared with others, not stored away! Rusty starts bringing all his forest friends to sunny spots, creating warmth and joy together.',
        duration: 3,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['sharing', 'warmth', 'joy'],
        isFeatured: false,
      ),
      Story(
        id: '15',
        title: 'The Dove Who Delivered Dreams',
        category: 'Fairy Tales',
        description:
            'Every night when the stars come out, Delilah the dove flies across the sky with a soft bag full of magical dreams. She carefully delivers sweet dreams to sleeping children everywhere - dreams of adventures with friendly dinosaurs, flying through cotton candy clouds, and discovering treasure on pirate ships. But Delilah works so hard that she never sleeps or dreams herself. The Dream Keeper gives Delilah a special gift - her very own beautiful dream to keep.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['dreams', 'kindness', 'peace'],
        isFeatured: false,
      ),
      Story(
        id: '16',
        title: 'The Curious Owl and the Lost Star',
        category: 'Space',
        description:
            'Oliver the owl is the wisest bird in the entire forest. One magical night, he spots something very unusual - a tiny, frightened star that has tumbled from the sky and landed in his big oak tree. The star is lost and scared, missing her place in the constellation where she belongs. Using his wisdom and kindness, Oliver helps the star find her way back to her family in the sky. Together they learn that wisdom means using knowledge to help others.',
        duration: 4,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['helping', 'adventure', 'stars'],
        isFeatured: false,
      ),
      Story(
        id: '17',
        title: 'The Sleepy Sunflower',
        category: 'Nature',
        description:
            'Sunny the sunflower loves the bright daytime so much that she never wants it to end. She tries her best to stay awake all night long, fighting sleep and watching the moon and stars. But she becomes so tired that she droops sadly and loses her beautiful golden glow. A wise old garden teaches Sunny that rest is just as important as play and sunshine. When she finally lets herself sleep peacefully through the night, she wakes up more radiant than ever.',
        duration: 3,
        rating: 4.7,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['rest', 'nature', 'balance'],
        isFeatured: false,
      ),
      Story(
        id: '18',
        title: 'The Rabbit and the Shooting Star',
        category: 'Adventures',
        description:
            'Rosie the rabbit sees a brilliant shooting star streak across the night sky. She knows she can make one special wish, but instead of wishing for herself, she wishes that everyone in the forest could have sweet, peaceful dreams tonight. The shooting star is so touched by her selfless, caring wish that it grants something even more wonderful - it sprinkles magical stardust over the entire forest, giving everyone the most amazing dreams they\'ve ever had.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['kindness', 'wishes', 'dreams'],
        isFeatured: true,
      ),
      Story(
        id: '19',
        title: 'The Whispering Willow Tree',
        category: 'Nature',
        description:
            'Deep in the heart of an ancient forest stands Grandmother Willow, the oldest and wisest tree of all. Her long, graceful branches whisper gentle secrets to anyone who stops to listen - secrets about patience, about growing strong roots, and about finding peace in every season. Young animals travel from far and wide to hear her soothing voice. She teaches them that sometimes the quietest voices carry the most important messages of all.',
        duration: 4,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['wisdom', 'comfort', 'nature'],
        isFeatured: false,
      ),
      Story(
        id: '20',
        title: 'The Lost Baby Whale',
        category: 'Animals',
        description:
            'Little Wendy the whale gets separated from her mother in the enormous, endless ocean. She feels so scared and alone in the big blue sea, calling out for help. The ocean family immediately comes together - playful dolphins guide her with clicks and whistles, wise sea turtles comfort her with gentle words, and old grandfather whales sing the ancient songs of home. Following the kind voices and gentle guidance, Wendy finds her way back to her mother\'s loving fins.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['family', 'ocean', 'helping'],
        isFeatured: false,
      ),
      Story(
        id: '21',
        title: 'The Magical Music Box',
        category: 'Magical World',
        description:
            'Emma receives a beautiful, antique music box from her grandmother before moving to a brand new town. Feeling lonely in her new home without any friends yet, she winds up the delicate music box. Something magical happens - tiny glowing fireflies emerge and dance to the sweet melody, telling stories of friendship, new beginnings, and how home is wherever love lives. Each night, the music box reminds Emma that magic exists everywhere we go.',
        duration: 5,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['magic', 'friendship', 'memories'],
        isFeatured: false,
      ),
      Story(
        id: '22',
        title: 'The Sleepy Sloth',
        category: 'Animals',
        description:
            'Sammy the sloth moves so slowly through the jungle that other animals sometimes giggle and call him lazy. They rush around quickly while Sammy takes his sweet time enjoying each moment. But when a big storm destroys parts of the jungle, all the rushing animals are too exhausted to help rebuild their homes. Sammy, who always rests well and conserves his energy, has the strength to help everyone. The jungle learns that moving slowly isn\'t lazy - it\'s wise.',
        duration: 3,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['acceptance', 'patience', 'jungle'],
        isFeatured: false,
      ),
      Story(
        id: '23',
        title: 'The Comet and the Lonely Planet',
        category: 'Space',
        description:
            'Far out in the cold, dark edges of space, Planet Pluto feels lonely and forgotten. No one visits this distant little planet anymore, and the days feel long and empty. But one bright day, Charlie the Comet zooms by on his amazing journey through the cosmos. He stops to chat with Pluto, sharing exciting stories of all the wonders he\'s seen. Charlie visits Pluto every time he orbits through, and Pluto learns that true friendship lights up your whole world.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['friendship', 'space', 'loneliness'],
        isFeatured: false,
      ),
      Story(
        id: '24',
        title: 'The Firefly Who Lost Her Light',
        category: 'Moral Stories',
        description:
            'Fiona the firefly wakes up one morning to discover something terrible - her special glow has completely gone out. She feels dull and useless without her bright light. Feeling sad, she wanders through the forest and starts helping others anyway - guiding a lost beetle home, comforting a scared caterpillar, sharing food with hungry ants. With each kind act, her light flickers back a little more. By nightfall, Fiona shines brighter than she ever has before.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['kindness', 'inner-light', 'helping'],
        isFeatured: false,
      ),
      Story(
        id: '25',
        title: 'The Little Lighthouse',
        category: 'Adventures',
        description:
            'Leo is the smallest lighthouse on the entire rocky coast. He worries that his small beam of light doesn\'t make a real difference compared to the big, bright lighthouses nearby with their powerful beams. But during one thick, foggy night, it\'s Leo\'s steady, reliable light shining at just the right height that guides a family of lost boats safely to shore. Leo discovers that you don\'t need to be the biggest to make the biggest difference.',
        duration: 4,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['purpose', 'helping', 'ocean'],
        isFeatured: false,
      ),
      Story(
        id: '26',
        title: 'The Elephant Who Painted Dreams',
        category: 'Magical World',
        description:
            'Ellie the elephant discovers she has a magical trunk that can paint beautiful, swirling dreams into the night sky. Every evening, she creates magical scenes with her trunk - adventures in candy lands, flying through clouds, meeting friendly monsters. Children below fall asleep watching her sky paintings and dream the most wonderful dreams. But Ellie works so hard creating dreams for others that she forgets to dream herself. The Moon teaches her about balance.',
        duration: 5,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['creativity', 'dreams', 'art'],
        isFeatured: false,
      ),
      Story(
        id: '27',
        title: 'The Cricket and the Silent Night',
        category: 'Nature',
        description:
            'Chirpy the cricket sings his cheerful song every single night, filling the darkness with music. One evening, he decides to stay quiet just to see what will happen. In the beautiful silence, he hears something amazing - other crickets singing, leaves rustling their own song, owls hooting, and the gentle whisper of the breeze. Chirpy realizes his song is part of nature\'s grand symphony. When he sings again, he also listens, making his music even more beautiful.',
        duration: 3,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['music', 'comfort', 'nature'],
        isFeatured: false,
      ),
      Story(
        id: '28',
        title: 'The Snowy Owl and the Northern Lights',
        category: 'Nature',
        description:
            'Aurora the snowy owl lives in the magical far north where the Northern Lights paint the sky with ribbons of green, purple, and pink. She loves to fly through the shimmering curtains of light, dancing and twirling in the sky. One special night, Aurora discovers that when she spreads her wide white wings, she reflects the lights and creates even more beauty in the sky. She learns that when we embrace beauty, we become part of something magnificent.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['wonder', 'nature', 'magic'],
        isFeatured: true,
      ),
      Story(
        id: '29',
        title: 'The Caterpillar Who Was Afraid to Change',
        category: 'Moral Stories',
        description:
            'Cami the caterpillar absolutely loves her life crawling on soft green leaves and hiding under pretty flowers. When it\'s time to build a cocoon and transform into a butterfly, she feels terrified. Change seems so scary and uncertain - what if she doesn\'t like being a butterfly? With gentle encouragement from her garden friends, Cami bravely enters her cocoon. When she emerges with beautiful wings, she discovers that change leads to wonderful new adventures.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['change', 'growth', 'courage'],
        isFeatured: false,
      ),
      Story(
        id: '30',
        title: 'The Starfish and the Gentle Tide',
        category: 'Nature',
        description:
            'Stella the starfish always fights hard against the ocean waves, using all her energy trying to stay in exactly one spot. She exhausts herself struggling against the natural rhythm of the sea. One day, tired of fighting, she decides to let go and flow with the gentle tide. To her surprise, the peaceful waves take her on a beautiful journey showing her amazing sights, then bring her back home safely. Stella learns about trusting the flow of life.',
        duration: 3,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['peace', 'ocean', 'rhythm'],
        isFeatured: false,
      ),
      Story(
        id: '31',
        title: 'The Sleepy Train to Dreamland',
        category: 'Adventures',
        description:
            'Every night exactly at bedtime, the magical Sleepy Express train pulls into stations all around the world with a soft "choo-choo". Children climb aboard with their favorite stuffed animals and cozy blankets. The train travels through Candy Cloud Canyon, past the gentle Snoring Mountain, and across the peaceful River of Dreams. Each passenger finds their perfect dream destination. The gentle rocking and soft whistle lull everyone into the sweetest sleep imaginable.',
        duration: 5,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['dreams', 'adventure', 'sleep'],
        isFeatured: false,
      ),
      Story(
        id: '32',
        title: 'The Hummingbird Who Shared Joy',
        category: 'Animals',
        description:
            'Holly the hummingbird has a very special gift - wherever she flies, she spreads happiness and joy like sparkling fairy dust. Her tiny wings create little sparkles of golden light, and her cheerful hum makes flowers bloom even brighter. She visits sick animals to cheer them up, helps baby birds learn to fly with encouraging words, and reminds everyone to find joy in small moments like dewdrops and sunshine. Holly shows that happiness multiplies when shared.',
        duration: 3,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['joy', 'sharing', 'happiness'],
        isFeatured: false,
      ),
      Story(
        id: '33',
        title: 'The Rainbow After the Storm',
        category: 'Nature',
        description:
            'When a big thunderstorm with loud booms and bright lightning frightens all the forest animals, they hide shaking in their homes feeling scared. But after the storm rumbles away, the most beautiful rainbow appears in the sky - a perfect arch of red, orange, yellow, green, blue, and purple stretching from one end of the forest to the other. The animals come out to see the magical colors and learn that after every storm, there\'s always light and beauty.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['hope', 'beauty', 'nature'],
        isFeatured: false,
      ),
      Story(
        id: '34',
        title: 'The Bedtime Knight',
        category: 'Fairy Tales',
        description:
            'Sir Snooze is a very special knight who doesn\'t fight dragons or rescue princesses. Instead, he has an important job - he protects children\'s dreams throughout the quiet night. With his soft armor made of moonbeams and his shield crafted from peaceful thoughts, Sir Snooze stands guard outside bedroom windows. He gently chases away any bad dreams, invites good dreams to visit, and makes sure every single child sleeps safely, soundly, and peacefully all night long.',
        duration: 5,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['protection', 'dreams', 'bravery'],
        isFeatured: false,
      ),
      Story(
        id: '35',
        title: 'The Wise Owl and the Worried Rabbit',
        category: 'Moral Stories',
        description:
            'Riley the rabbit worries about absolutely everything - what if it rains tomorrow, what if she can\'t find enough food, what if something scary happens? Her constant worrying makes her tired and unhappy. The wise old owl sits patiently with Riley under the stars and teaches her a special trick - to focus on this very moment, right now. The owl shows Riley how to notice the soft grass, the gentle breeze, and the beauty around her. Peace lives in the present.',
        duration: 4,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['wisdom', 'worry', 'peace'],
        isFeatured: true,
      ),
      Story(
        id: '39',
        title: 'Little Red Riding Hood',
        category: 'Fairy Tales',
        description:
            'Little Red Riding Hood set off through the forest to visit her sick grandmother, carrying a basket of treats. Along the way, she met a cunning wolf who asked where she was going. The wolf raced ahead, swallowed grandmother whole, and disguised himself in her bed. When Red Riding Hood arrived, she noticed something strange - "What big eyes you have! What big ears! What big teeth!" A brave woodcutter heard her cries and saved both Red Riding Hood and her grandmother. She learned to never talk to strangers in the forest.',
        duration: 5,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/story-placeholder.mp3',
        tags: ['adventure', 'bravery', 'safety'],
        isFeatured: false,
      ),
      Story(
        id: '40',
        title: 'The Little Mermaid',
        category: 'Fairy Tales',
        description:
            'Ariel, a beautiful young mermaid princess, dreamed of living in the world above the sea. When she saved a handsome prince from drowning, she fell deeply in love with him. She made a deal with the sea witch to trade her lovely voice for human legs, but she had to win the prince\'s true love or turn into sea foam. Through her kindness, courage, and the help of her friends, Ariel\'s love proved true. She was transformed into a human forever and married her prince, uniting the sea and land kingdoms.',
        duration: 6,
        rating: 5.0,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/the-little-mermaid.mp3',
        tags: ['love', 'courage', 'dreams'],
        isFeatured: true,
      ),
      Story(
        id: '41',
        title: 'Beauty and the Beast',
        category: 'Fairy Tales',
        description:
            'When Belle\'s father got lost in the forest, he sought shelter in a mysterious castle belonging to a fearsome Beast. To save her father, kind Belle agreed to stay with the Beast forever. At first frightened, Belle soon discovered the Beast had a gentle heart beneath his scary appearance. As days passed, they became friends, and Belle learned to see his inner beauty. Her love broke the enchantment that had cursed him, transforming the Beast back into a handsome prince. True beauty comes from within.',
        duration: 6,
        rating: 5.0,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/beauty-and-the-beast.mp3',
        tags: ['kindness', 'true love', 'magic'],
        isFeatured: false,
      ),
      Story(
        id: '42',
        title: 'Rapunzel',
        category: 'Fairy Tales',
        description:
            'Rapunzel was locked away in a tall tower with no door, only a high window. Her beautiful golden hair grew so long it reached the ground below. Each day, the witch who imprisoned her would climb up using Rapunzel\'s hair as a rope. One day, a brave prince heard Rapunzel singing and fell in love with her voice. He climbed her hair to meet her, and together they planned her escape. Though the witch discovered them and separated the lovers, their true love reunited them and broke the spell. Rapunzel was free at last.',
        duration: 5,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/rapunzel.mp3',
        tags: ['adventure', 'true love', 'freedom'],
        isFeatured: false,
      ),
      Story(
        id: '43',
        title: 'Cinderella',
        category: 'Fairy Tales',
        description:
            'Cinderella lived with her wicked stepmother and two cruel stepsisters who made her do all the housework. When the King invited everyone to a royal ball, her stepfamily went without her. But Cinderella\'s Fairy Godmother appeared and used magic to give her a beautiful gown and glass slippers, warning her to return before midnight. At the ball, the Prince fell in love with her, but she had to flee at midnight, losing one glass slipper. The Prince searched the kingdom for the maiden whose foot fit the slipper. When he found Cinderella, they married and lived happily ever after.',
        duration: 7,
        rating: 5.0,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/cinderella.mp3',
        tags: ['magic', 'dreams', 'true love'],
        isFeatured: true,
      ),
      Story(
        id: '44',
        title: 'Snow White and the Seven Dwarfs',
        category: 'Fairy Tales',
        description:
            'Snow White was a princess with skin as white as snow, lips as red as blood, and hair as black as ebony. Her wicked stepmother, the Queen, was jealous of Snow White\'s beauty and ordered a huntsman to kill her. But the kind huntsman let her escape into the forest, where she found a cottage belonging to seven dwarfs. The Queen discovered Snow White was alive and gave her a poisoned apple. Snow White fell into a deep sleep until a prince\'s true love\'s kiss awakened her. She lived happily ever after with her prince and remained friends with the seven dwarfs.',
        duration: 7,
        rating: 5.0,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/snow-white.mp3',
        tags: ['friendship', 'true love', 'kindness'],
        isFeatured: true,
      ),
      Story(
        id: '45',
        title: 'Sleeping Beauty',
        category: 'Fairy Tales',
        description:
            'When Princess Aurora was born, all the kingdom celebrated. But an evil fairy cursed her to prick her finger on a spinning wheel and die on her sixteenth birthday. A good fairy softened the curse so Aurora would only sleep until true love\'s kiss awakened her. Despite her parents\' protection, Aurora pricked her finger and fell into a deep sleep, along with the entire castle. One hundred years passed as thorny vines grew around the castle. Then a brave prince fought through the thorns and kissed Aurora, breaking the spell. The kingdom awakened, and Aurora and her prince were married.',
        duration: 6,
        rating: 5.0,
        imageUrl:
            'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=600',
        audioUrl: 'assets/audio/stories/sleeping-beauty.mp3',
        tags: ['magic', 'true love', 'courage'],
        isFeatured: false,
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

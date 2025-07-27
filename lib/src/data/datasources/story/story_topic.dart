enum StoryTopic {
  leoTheLionCub,
  theBirthdayParty,
  theMagicalBackpack,
  theMissingCookie,
  aDayAtThePark,
  theThreeFriends,
  theCityExplorer,
  theGreatGardenAdventure,
  theSchoolExcursion,
  theWeatherWizard,
  grandmaAndGrandpa,
  theLittleArtist,
  theMusicFestival,
  theNewPet,
  theRestaurantMystery,
  theChefAndTheGarden,
  theTimeTraveler,
  theGreatRace,
  theFeelingTree,
  theLostTreasure,
  aTripToTheMountains,
  theLittleGardener,
  theSuperheroFamily,
  theSleepyDragon,
  theMagicPencil,
  theLittleRobot,
  theZooKeeper,
  thePlaygroundParty,
  theLostKitten,
  theLostBackpack,
  theGiantPumpkin,
  theTalkingBook,
  theRainbowBridge,
  theZooAdventure,
  theKindestKnight,
  theSpaceExplorer,
  theTinyChef,
  theMagicalMusicBox,
  theFriendlyGhost,
  theSportsDay,
  theBigCleanUp,
  theTimeTravelingToy,
  theCampingTrip,
  theBusyBuilder,
}

extension StoryTopicExtension on StoryTopic {
  String get description {
    switch (this) {
      case StoryTopic.leoTheLionCub:
        return "A lost lion cub named Leo, a wild animal, feels sad. He meets a meerkat family who help him with greetings and directions. Along the way, they learn about colors and body parts of other animals, and discuss their feelings.";
      case StoryTopic.theBirthdayParty:
        return "A child prepares for a birthday party. The story focuses on daily routines, numbers, and colors while decorating. It describes their family, friends, clothes, and the food and drinks for the meal.";
      case StoryTopic.theMagicalBackpack:
        return "A child finds a magical backpack with different school supplies. It helps them with school activities, like drawing shapes, and learning about professions. The story uses simple verbs and adjectives to describe their daily routine and play activities.";
      case StoryTopic.theMissingCookie:
        return "A child discovers a missing cookie and asks family members and pets for directions and clues to solve the mystery. They describe the rooms and furniture in their home while expressing feelings of frustration and happiness.";
      case StoryTopic.aDayAtThePark:
        return "A group of friends spends a day at the park. The story covers weather and nature, as they play sports and other activities. It focuses on social interaction and adjectives of opposites to describe their fun day together.";
      case StoryTopic.theThreeFriends:
        return "Three friends—a bird, a squirrel, and a rabbit—go on an adventure to find the biggest, reddest apple. The story focuses on nature places, farm animals, and verbs, using adjectives to describe the food and their feelings.";
      case StoryTopic.theCityExplorer:
        return "A child explores a city with a magical map. The story introduces places, city buildings, and directions. They encounter people with various professions and learn about different modes of transport, while practicing greetings and manners.";
      case StoryTopic.theGreatGardenAdventure:
        return "A child helps their family plant a garden. The story is about vegetables, fruits, and colors, following their morning routine and talking about the seasons. It also describes the different tools they use as school supplies.";
      case StoryTopic.theSchoolExcursion:
        return "A class goes on a school excursion to a farm. The story focuses on farm and wild animals, and nature. It uses descriptive words to talk about the different animals and their actions, and has the children express their feelings.";
      case StoryTopic.theWeatherWizard:
        return "A wizard who controls the weather has a fun day. The story focuses on the days of the week and seasons. He uses adjectives to describe different types of weather and his feelings while expressing his hobbies.";
      case StoryTopic.grandmaAndGrandpa:
        return "A child visits their grandparents. The story focuses on family, home, and furniture. It describes their evening routine, including mealtime, and highlights their special bond, feelings, and the leisure activities they enjoy together.";
      case StoryTopic.theLittleArtist:
        return "A child who loves music and art prepares for a show. The story focuses on months and music, using descriptive words and colors to talk about their art and clothes. It incorporates questions and answers about their creative process.";
      case StoryTopic.theMusicFestival:
        return "A group of friends goes to a music festival. The story uses different verbs and sounds, focusing on feelings and emotions. It describes the different places they visit and the food and drinks they try, as they express their understanding of the music.";
      case StoryTopic.theNewPet:
        return "A family gets a new pet, a dog. The story focuses on pets, family, and home. It follows their daily routines as they care for the dog, and talks about the different toys and play activities they enjoy together.";
      case StoryTopic.theRestaurantMystery:
        return "A family goes to a restaurant for a meal. The story is a mystery where a detective child must solve a puzzle by asking questions and looking for clues. They use numbers and shapes to describe the objects they see.";
      case StoryTopic.theChefAndTheGarden:
        return "A famous chef needs to make a special meal for a king. He goes to his garden to pick fresh vegetables and fruits. The story focuses on food, meals, numbers, and colors as he prepares the meal. It also covers his daily routine and feelings as he cooks.";
      case StoryTopic.theTimeTraveler:
        return "A child finds a time machine in their garage. They travel through different seasons and meet animals from different eras. The story covers months, seasons, and various places, as well as the child's feelings of excitement and fear.";
      case StoryTopic.theGreatRace:
        return "A group of friends participates in a race in the city. The story focuses on directions, places, and city landmarks. It includes simple verbs and adjectives to describe actions and feelings during the race. They celebrate with food and drinks afterward.";
      case StoryTopic.theFeelingTree:
        return "A magical tree in the forest changes its colors based on the emotions of the people around it. A group of friends learns to identify and express their feelings by looking at the tree. The story also covers nature, seasons, and social interaction.";
      case StoryTopic.theLostTreasure:
        return "A group of children goes on a treasure hunt at home, following a map with directions and clues. The story focuses on rooms, furniture, and family members, and uses descriptive words to talk about the objects they find.";
      case StoryTopic.aTripToTheMountains:
        return "A family goes on a trip to the mountains in the winter. The story focuses on family, weather, and nature. It also covers clothing, sports, and hobbies as they have fun together.";
      case StoryTopic.theLittleGardener:
        return "A child with a green thumb learns to plant and care for vegetables and flowers. The story focuses on nature, food, and animals. It also covers the child's daily routine and their feelings about gardening.";
      case StoryTopic.theSuperheroFamily:
        return "A family of superheroes works together to save the day. The story focuses on family, daily routines, and actions. It includes professions, hobbies, and social interaction as they help people in their community, and covers their feelings and emotions as a family.";
      case StoryTopic.theSleepyDragon:
        return "A sleepy dragon that lives in a cave needs to be woken up. A child uses a magical horn to wake him up. The story covers colors, shapes, and numbers, focusing on the wild animal and the child's feelings of bravery.";
      case StoryTopic.theMagicPencil:
        return "A child finds a magical pencil that brings their drawings to life. The story focuses on school, school supplies, and art. It includes actions, feelings, and social interaction as the child creates and plays with their drawings.";
      case StoryTopic.theLittleRobot:
        return "A little robot in a factory helps to create different toys. The story focuses on toys, verbs, and adjectives. It also covers the different jobs of the workers in the factory and the robot's feelings about its work.";
      case StoryTopic.theZooKeeper:
        return "A zoo keeper introduces a new animal to the zoo. The story focuses on animals, wild animals, and professions. It also includes greetings, manners, and the different feelings of the zookeeper and the animals.";
      case StoryTopic.thePlaygroundParty:
        return "A group of friends has a party at the playground. The story focuses on playing with friends, feelings, and emotions. It also covers social interaction, food, and drinks as they have fun together.";
      case StoryTopic.theLostKitten:
        return "A child finds a lost kitten. The story focuses on pets, feelings, and responsibility. The child asks questions and follows directions to find the kitten's home. The story also covers morning and evening routines as they care for the kitten.";
      case StoryTopic.theLostBackpack:
        return "A child loses their school backpack and asks friends for directions to find it. They describe its colors and what school supplies are inside, using simple verbs to explain their actions and expressing feelings of worry and relief.";
      case StoryTopic.theGiantPumpkin:
        return "A farm family grows a giant pumpkin. The story focuses on vegetables, numbers, seasons, and daily routines as they care for it. They invite friends over for a meal to celebrate.";
      case StoryTopic.theTalkingBook:
        return "A child finds a talking book in their home library. The book introduces them to professions through stories, describes various places in a city, and teaches about greetings and manners while expressing different emotions.";
      case StoryTopic.theRainbowBridge:
        return "A little bird dreams of flying to a rainbow bridge. The story focuses on colors, weather, and nature places, using descriptive adjectives to describe the journey and feelings of wonder.";
      case StoryTopic.theZooAdventure:
        return "A family goes on an adventure to the zoo. The story highlights various wild animals, their body parts, and the sounds they make. It incorporates asking and answering questions about the animals and describing feelings of excitement.";
      case StoryTopic.theKindestKnight:
        return "A kind knight helps farm animals in trouble. The story features simple actions like helping and saving, introduces adjectives of opposites (big/small, sad/happy), and teaches about social interaction and expressing understanding of feelings.";
      case StoryTopic.theSpaceExplorer:
        return "A child imagines being a space explorer and travels to different planets. The story introduces shapes (planets are round!), numbers of stars, and describes unique nature places in space. It also covers feelings of awe and excitement.";
      case StoryTopic.theTinyChef:
        return "A tiny chef in a restaurant learns to cook new meals. The story focuses on different food, drinks, vegetables, and fruits, as well as the actions involved in cooking. It also touches on professions and feelings of accomplishment.";
      case StoryTopic.theMagicalMusicBox:
        return "A child finds a magical music box that plays songs about days of the week and different leisure hobbies like music and art. The story uses adjectives to describe the sounds and the clothing the child wears while enjoying their hobby.";
      case StoryTopic.theFriendlyGhost:
        return "A friendly ghost lives in a house with a family. The story explores different rooms and furniture, the family's morning and evening routines, and how they overcome initial feelings of fear to become friends with the ghost.";
      case StoryTopic.theSportsDay:
        return "Children participate in a sports day at school. The story features various sports, play activities, and simple actions like running and jumping. It emphasizes social interaction, teamwork, and the feelings associated with winning and losing.";
      case StoryTopic.theBigCleanUp:
        return "A family has a big clean-up day in their home. The story involves organizing toys, putting away clothing, and tidying different rooms. It focuses on daily routines, verbs, and the feelings of accomplishment after hard work.";
      case StoryTopic.theTimeTravelingToy:
        return "A favorite toy comes to life and can time travel. It visits different seasons and places from the past, observing different animals and the weather. The toy shares its adventures with the child, making them feel excited.";
      case StoryTopic.theCampingTrip:
        return "A family goes on a camping trip in nature. The story involves simple actions like setting up camp, observing wild animals, describing the weather, and enjoying meals outdoors. It also covers feelings of adventure and peacefulness.";
      case StoryTopic.theBusyBuilder:
        return "A young builder and their family work together to build a new treehouse. The story focuses on professions, shapes, and numbers as they measure and build. It also includes simple actions, feelings of teamwork, and the joy of creating something together.";
    }
  }
}

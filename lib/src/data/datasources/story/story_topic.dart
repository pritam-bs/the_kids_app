enum StoryTopic {
  // --- Animal & Nature Themes ---
  leoTheLostLion(
    promptDescription: '''
      Theme: A brave but friendly lion cub gets a little lost in the savanna.
      Goal: Ask other animals for directions to find his family before sunset.
      Learning Focus: Greetings (Hallo, Tschüss), feelings (traurig, glücklich), wild animals, directions (links, rechts), colors.
    ''',
  ),

  kindKnightAndFarmAnimals(
    promptDescription: '''
      Theme: A knight whose superpower is kindness, not fighting.
      Goal: Help a group of farm animals solve a small problem, like a stuck cart.
      Learning Focus: Farm animals (Kuh, Schwein, Pferd), actions (helfen, schieben), adjectives of opposites (groß, klein; schwer, leicht), social interaction.
    ''',
  ),

  theCuriousSquirrel(
    promptDescription: '''
      Theme: A curious squirrel preparing for winter.
      Goal: Find the perfect, hidden place to store a giant nut.
      Learning Focus: Nature (Baum, Blatt), seasons (Herbst, Winter), prepositions of place (in, auf, unter), food (Nuss, Apfel), numbers (1-5).
    ''',
  ),

  // --- Home & Family Themes ---
  theSurpriseBirthday(
    promptDescription: '''
      Theme: Two children secretly prepare a surprise birthday party for their parent.
      Goal: Decorate the room and hide before the parent arrives.
      Learning Focus: Numbers (1-10), party food (Kuchen, Saft), family members (Mutter, Vater), furniture (Tisch, Stuhl), verbs (dekorieren, verstecken).
    ''',
  ),

  theMissingSockDetective(
    promptDescription: '''
      Theme: A sock has mysteriously disappeared from the washing machine!
      Goal: A young detective must search different rooms to find the missing sock's partner.
      Learning Focus: Rooms in a house (Küche, Bad, Schlafzimmer), clothing (Socke, Hemd), asking questions (Wo ist?), colors, pets (Hund, Katze).
    ''',
  ),

  buildingTheBestFort(
    promptDescription: '''
      Theme: A family decides to build the best pillow fort ever on a rainy day.
      Goal: Work together to gather pillows and blankets to build a cozy fort.
      Learning Focus: Family (Bruder, Schwester), household items (Kissen, Decke), weather (Regen), feelings (gemütlich, froh), actions (bauen, lachen).
    ''',
  ),

  // --- Magic & Fantasy Themes ---
  theMagicPencil(
    promptDescription: '''
      Theme: A child receives a magic pencil that brings drawings to life for a short time.
      Goal: Draw a simple friend, like a bird or a dog, to play with.
      Learning Focus: School supplies (Stift, Papier), shapes (Kreis, Stern), colors, art, simple actions (zeichnen, spielen, fliegen).
    ''',
  ),

  theSleepyDragon(
    promptDescription: '''
      Theme: A tiny, sleepy dragon lives on a hill and needs help waking up for a festival.
      Goal: Find a gentle way to wake the dragon, like with a song or a sweet smell.
      Learning Focus: Adjectives of opposites (laut, leise; groß, klein), feelings (müde, wach), sounds, food (Beere, Blume), body parts (Auge, Nase).
    ''',
  ),

  theTimeTravelingToyCar(
    promptDescription: '''
      Theme: A child's favorite toy car can secretly travel back in time.
      Goal: The car takes a short trip to the age of dinosaurs and comes back with a leaf.
      Learning Focus: Toys (Auto), wild animals (Dinosaurier), nature (Baum, Blatt), time (gestern, heute), feelings (aufgeregt, überrascht).
    ''',
  ),

  // --- City & Community Themes ---
  theCityExplorerAndTheLostCat(
    promptDescription: '''
      Theme: A child exploring the city finds a lost cat with a collar.
      Goal: Read the address on the collar and take the cat back to its home.
      Learning Focus: City places (Straße, Haus, Park), transport (Bus, Fahrrad), professions (Bäcker, Polizist), directions (geradeaus), greetings.
    ''',
  ),

  theTinyChef(
    promptDescription: '''
      Theme: A tiny chef in a big restaurant wants to create a new, special soup.
      Goal: Gather fresh vegetables from the garden to cook a colorful soup.
      Learning Focus: Food (Suppe, Brot), vegetables (Karotte, Tomate), kitchen actions (kochen, schneiden), meals (Mittagessen), colors.
    ''',
  ),

  theHelpfulZookeeper(
    promptDescription: '''
      Theme: It's a zookeeper's first day, and they are learning about the animals.
      Goal: Help feed a very shy animal its favorite food.
      Learning Focus: Zoo animals (Affe, Pinguin), professions (Tierpfleger), food (Fisch, Banane), simple questions, feelings (schüchtern, mutig).
    ''',
  );

  const StoryTopic({required this.promptDescription});

  final String promptDescription;
}

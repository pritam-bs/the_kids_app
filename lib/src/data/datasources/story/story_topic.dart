enum StoryTopic {
  rabbitAndCarrot,
  squirrelAndBird,
  magicalPencil,
  robotAndFlowers,
  dragonWhoReads,
  firstZooVisit,
  bearAndBees,
  rainyDayTreasureHunt,
  fallingStar,
  littleFish,
  firstKindergartenDay,
  talkingAppleTree,
  timeMachine,
  littleTrain,
  learningToBike,
}

extension StoryTopicExtension on StoryTopic {
  String get description {
    switch (this) {
      case StoryTopic.rabbitAndCarrot:
        return "a little rabbit looking for its favorite carrot in the forest.";
      case StoryTopic.squirrelAndBird:
        return "a brave squirrel helping a bird build its nest.";
      case StoryTopic.magicalPencil:
        return "a child who finds a magical pencil that can draw anything they wish for.";
      case StoryTopic.robotAndFlowers:
        return "a small robot learning how to plant and care for flowers.";
      case StoryTopic.dragonWhoReads:
        return "a day in the life of a little dragon who prefers reading to breathing fire.";
      case StoryTopic.firstZooVisit:
        return "a child going to the zoo for the first time and meeting their favorite animals.";
      case StoryTopic.bearAndBees:
        return "a friendship between a small bear and a busy colony of bees.";
      case StoryTopic.rainyDayTreasureHunt:
        return "a rainy afternoon where a child organizes an exciting treasure hunt at home.";
      case StoryTopic.fallingStar:
        return "a star that falls from the sky and helps a child find their lost teddy bear.";
      case StoryTopic.littleFish:
        return "a little fish exploring the ocean and making new friends.";
      case StoryTopic.firstKindergartenDay:
        return "a child experiencing their first day at kindergarten and making new friends.";
      case StoryTopic.talkingAppleTree:
        return "a talking apple tree that helps a child find the best apples.";
      case StoryTopic.timeMachine:
        return "a child who builds a time machine and travels to the time of dinosaurs.";
      case StoryTopic.littleTrain:
        return "a small train that travels through mountains and valleys, experiencing adventures along the way.";
      case StoryTopic.learningToBike:
        return "a child learning to ride a bicycle and overcoming small challenges.";
    }
  }
}

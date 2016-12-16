class WordScreen {
  WordScreen() {
    background(255);
    colorMode(HSB);
    frameRate(1);
  }
  void run() {
    clear();
    background(255);
    new WordCram(this)
      .fromTextFile("Story.txt")
      //.withFont(createFont("Firestarter Z.otf", 1))
      .sizedByWeight(10, 90)
      .withColors(color(random(255), random(255), random(255)), color(random(255), random(255), random(255)), color(random(255), random(255), random(255)))
      .drawAll();
  }
}
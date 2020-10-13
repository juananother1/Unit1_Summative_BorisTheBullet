class Mine
{
  int x;
  int y;
  int size;
  PImage Image;
  String ImageString;
  Mine()
  {
    x = (int)random(1920);
    y = (int)random(1080);
    size = 40;
    ImageString = "spikeyball.png";
  }

  void Setup()
  {
    Image = loadImage(""+ImageString);
    Image.resize(size, size);
  }

  void Draw()
  {
    tint(255, 255, 255);
    image(Image, x, y);
  }
}

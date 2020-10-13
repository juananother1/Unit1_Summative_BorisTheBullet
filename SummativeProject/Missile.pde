class Missile
{
 float x;
 float y;
 int sizeX;
 int sizeY;
 PImage Image;
 String ImageString;
 
 Missile()
 {
   x = 0;
   y = random(1080);
   sizeX = 20;
   sizeY = 18;
   ImageString = "missile.png";
 }
 
 void Setup()
 {
  Image = loadImage(""+ImageString);
  Image.resize(sizeX, sizeY);
 }
 
 void Draw()
 {
  image(Image, x, y);
 }
 
 void Move()
 {
   x += 1;
 }
 
 void Reset()
 {
   if (x >= 1080)
   {
     x = 0;
   }
 }
}

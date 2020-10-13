class Point
{
  int Points;
  int x;
  int y;
  int Size;
  color Color;
  int a;
  
  Point()
  {
    Points = 1;
    x = 960;
    y = 260;
    Size = 40;
    Color = color(0, 0, 0);
    a = 255;
  }
  
  void Write()
  {
    textSize(Size);
    fill(Color);
    text(Points, x, y);
  }
  
  void PointUP()
  {
    Points += 1;
  }
  
  void PointReset()
  {
    Points = 1;
  }
}

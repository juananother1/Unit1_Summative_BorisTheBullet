class Text
{
  int x;
  int y;
  String Content;
  color Color;
  int a;
  int size;
  
  Text(int _x, int _y, String _Content, color _Color, int _a, int _size)
  {
    x = _x;
    y = _y;
    Content = _Content;
    Color = _Color;
    a = _a;
    size = _size;
  }
  
  void Write()
  {
    textSize(size);
    fill(Color, a);
    text(""+Content, x, y);
  }
  
  void FadeOut()
  {
    a -= 1;
  }
}

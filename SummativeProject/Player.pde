class Player
{
  PImage Image;
  String ImageString;
  PVector Position;
  PVector Accel;
  float speed;
  float maxSpeed;
 
  Player()
  {
    ImageString = "bullet.png";
    
    Position = new PVector(100, 100);
    Accel = new PVector(0, 0);
    
    speed = 2;
    maxSpeed = 10;
  }
  
  void Setup()
  {
    Image = loadImage(""+ImageString);
    Image.resize(50, 50);
  }
  
  void Draw()
  {
    tint(255);
    image(Image, Position.x, Position.y);
  }
  
  void Move()
  {
    PVector mouse = new PVector(mouseX, mouseY);
    
    PVector Dir = mouse.sub(Position.copy());
    
    Dir.normalize();
    Dir.mult(speed);
    Accel.add(Dir);
    Accel.limit(maxSpeed);
    Position.add(Accel);
  }
}

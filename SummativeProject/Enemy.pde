class Enemy
{
  boolean Explosive;
  int randomer;
  int randomer1;
  color Color;
  boolean DeathChecker;
  PImage Image;
  String ImageString;

  PVector Pos;
  PVector Accel;
  float speed;
  PVector Dir;
  PVector PlayerDummy;
  Enemy()
  {
    Explosive = false;
    randomer = (int)random(10000);
    randomer1 = (int)random(1, 5);
    Color = color(255, 0, 0);
    DeathChecker = false;
    ImageString = "enemy.png";

    Pos = new PVector(random(1920), random(1080));
    Accel = new PVector(0, 0);
    speed = .5;
  }

  void Setup()
  {
    Image = loadImage(""+ImageString);
    Image.resize(20, 35);
  }

  void Draw()
  {
    if (Explosive == true)
    {
      Color = color(0, 0, 255);
      Explosive = false;
    }
    tint(Color);
    image(Image, Pos.x, Pos.y);
  }

  void Follow()
  {
    Dir = PlayerDummy.sub(Pos.copy());    
    Dir.normalize();
    Dir.mult(speed);
    Accel.add(Dir);
    Accel.limit(speed);
    Pos.add(Accel);
  }

  void ExplosiveCheck()
  {
    if (randomer > 9250)
    {
      Explosive = true;
    }
  }

  void Wander()
  {
    switch(randomer1) {
    case 1:
      Pos.x += 1;
      break;
    case 2:
      Pos.x -= 1;
      break;
    case 3:
      Pos.y += 1;
      break;
    case 4:
      Pos.y -= 1;
      break;
    }
  }

  void Bounds()
  {
    if (Pos.x > 1920)
    {
      Pos.x = 1920;
    }
    if (Pos.x < 0)
    {
      Pos.x = 0;
    }

    if (Pos.y > 1080)
    {
      Pos.y = 1080;
    }
    if (Pos.y < 0)
    {
      Pos.y = 0;
    }
  }
}

int EnemyCount = 500;
int EnemyCountTimer = 500;
int Scene = 0;
float InitialSecond = second();
float Interval = 2;
int MineCount = 20;
int DeathCountInt = 0;

Player Player = new Player();
Enemy[] Enemies = new Enemy[EnemyCount];
Point PointSystem = new Point();
Mine[] Mines = new Mine[MineCount];


Text DeathText = new Text(960, 540, "You Lost", color(255, 255, 255), 255, 50);
Text RespawnText = new Text(960, 740, "Press 'R' to Respawn", color(255, 255, 255), 255, 45);
Text WinText = new Text (960, 540, "You Won!", color(0, 0, 0), 255, 50);
Text DeathCount = new Text(960, 100, "Deaths:"+ DeathCountInt, color(0, 0, 0), 255, 35);
Text Title = new Text(960, 540, "Boris the Bullet", color(0, 0, 0), 255, 50);
Text PressToPlay = new Text(960, 740, "Press 'P' to Play", color(0, 0, 0), 255, 45);
void setup()
{
  imageMode(CENTER);
  textAlign(CENTER);
  size(1920, 1080);
  Player.Setup();
  for (int i = 0; i < EnemyCount; i++)
  {
    Enemies[i] = new Enemy();
    Enemies[i].Setup();
  }

  for (int i = 0; i < MineCount; i++)
  {
    Mines[i] = new Mine();
    Mines[i].Setup();
  }
}

void draw()
{
  background(255);
  float CurrentSecond = second();
  float SecondInterval = CurrentSecond - InitialSecond;
  Text DeathCount = new Text(960, 100, "Deaths:"+ DeathCountInt, color(0, 0, 0), 255, 35);

  if (Scene == 0)
  {
    Title.Write();
    PressToPlay.Write();
    Player.Draw();
    Player.Position.x = 960;
    Player.Position.y = 240;
    Player.Image.resize(150, 150);
  }

  if (Scene == 1)
  {
    for (int i = 0; i < EnemyCount; i++)
    {
      if (Enemies[i].DeathChecker == false)
      {
        // Enemy Functions
        Enemies[i].ExplosiveCheck();
        Enemies[i].Draw();
        Enemies[i].ExplosiveCheck();
        Enemies[i].Bounds();
        Enemies[i].PlayerDummy = Player.Position.copy();

        if (Enemies[i].randomer > 9250)
        {
          Enemies[i].Follow();
        }

        if (Enemies[i].randomer < 9250)
        {
          Enemies[i].Wander();
        }

        // Enemy Wander Timer
        if (SecondInterval % Interval == 0)
        {
          Enemies[i].randomer1 = (int)random(1, 5);
        }
      }

      // Death Checker
      if (dist(Player.Position.x, Player.Position.y, Enemies[i].Pos.x, Enemies[i].Pos.y) < 37)
      {
        if (Enemies[i].Explosive == false)
        {
          Enemies[i].DeathChecker = true;
          EnemyCountTimer -= 1;
          PointSystem.PointUP();

          if (EnemyCountTimer <= 0)
          {
            // Scene = 3;
          }
        }
        if (Enemies[i].Explosive == true)
        {
          Scene = 2;
        }
      }
    }

    for (int i = 0; i < MineCount; i++)
    {
      // Mine Draw
      Mines[i].Draw();

      // Mine Hit Detection
      if (dist(Player.Position.x, Player.Position.y, Mines[i].x, Mines[i].y) < 20)
      {
        Scene = 2;
      }
    }

    // Player Movement Functions
    Player.Image.resize(50, 50);
    Player.Draw();
    Player.Move();

    // Point Draw
    PointSystem.Write();

    // Death Counter Draw
    DeathCount.Write();
  }

  // Death Scene
  if (Scene == 2)
  {
    background(0);
    DeathText.Write();
    PointSystem.PointReset();
    RespawnText.Write();
    for (int i = 0; i < EnemyCount; i++)
    {
      Enemies[i].Pos.x = random(1920);
      Enemies[i].Pos.y = random(1080);
    }
    for (int i = 0; i < MineCount; i++)
    {
      Mines[i].x = (int)random(1920);
      Mines[i].y = (int)random(1080);
    }
  }

  // Win Scene 
  if (Scene == 3)
  {
    background(255);
    WinText.Write();
  }
}
void keyReleased()
{
  if (key == 'r')
  {
    Scene = 1;
    EnemyCountTimer = 500;
    DeathCountInt += 1;
  }

  if (key == 'p')
  {
    Scene = 1;
  }
}

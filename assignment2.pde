import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import java.util.Arrays;
Minim minim;
void setup()
{
  size(600,600);
  loadData();
  minim = new Minim(this);
  square = new MainSquare();
  startup = new StartUp();
  countdown = new Countdown();
  obstacle = new Obstacle();
  

  option1 = true;
  start = false;
  count = false;   
  hit = false;
  end = false;

  for (int i = 0; i < parts.length; i++)
  {
     parts [i] = new Explode ();
  }
}

ArrayList<Score> data = new ArrayList<Score>();
String lastInput = new String();
String currentInput = new String();
float x;
float y;
boolean option1;
boolean start;
boolean count;
boolean hit;
boolean end;

int n, c, d, swap;
MainSquare square;
StartUp startup;
Countdown countdown;
Obstacle obstacle;
Explode [] parts = new Explode [50];

void draw()
{ 

  if(square.stage == 11)
  {
    option1 = false;
    end = true;
  }
  
  if(end)
  {
    startup.end();
    
  
       
  }
  
  
  if(option1)
  {
    background(177,255,255);
    square.render();
    square.collisions();
    obstacle.render();
    collisions();
    if(hit)
    {
      collide();
      
      if(square.firstFloor)
      {
        if(square.pos.x >= 100)
        {
           hit = false;
        }
      }
      
      else
      {
        if(square.pos.x <= 500)
        {
           hit = false;
        }
      }
    } 
  }
  
  if(start)
 {
    countdown.number = 5;
    square.collisions = 0;
    startup.render();
    startup.option1();
    startup.option2();
  }
  
  if(count)
  {
    countdown.render();
  }
}


void collisions()
{
  float distance = 0.0f;
  for(int i = 0; i < obstacle.obstacles.length; i ++)
       {
         
         distance = PVector.dist(square.pos, obstacle.obstacles[i]);
        
            if(distance <= square.squareSize)
            {
              
             for (int j = 0; j < parts.length; j++)
               {
                 parts [j].x = square.pos.x;
                 parts [j].y = square.pos.y;
                 parts [j].ex1 = random (-10,10);
                 parts [j].ex2 = random (-10,10);
                 
               }
               
                hit = true;
               
              if(square.firstFloor)
              {
                square.pos.x = 0;
                square.collisions ++;
              }
              
              else
              {
                square.pos.x = width;
                square.collisions ++;
              }
             }
        }
} // end collisions()

  void collide()
{
  for (int j = 0; j < parts.length; j++) 
  {
    parts [j].update();
  }
} // end collide()


void loadData()
{
  String[] lines = loadStrings("scores.csv");
  for(String line: lines)
  {
    Score score = new Score(line);
    data.add(score);
  }
}
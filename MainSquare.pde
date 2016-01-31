class MainSquare extends GameObject
{
  boolean jumping = true;
  
  MainSquare()
  {
    super(0, height / 3);
  }
  
  
  
  void render()
  {
  
    line(0,floor1 + squareSize,width,floor1 + squareSize);
    line(0,floor2 + squareSize,width,floor2 + squareSize);

     rect(pos.x,pos.y,squareSize,squareSize);
     fill(0);
     pos.x += speed;
    
      // FIRST FLOOR
      if(pos.x >= width)
      {
        pos.y = floor2;
        speed *= (-1);
        firstFloor =! firstFloor;
      }
      
      // SECOND FLOOR
      if(pos.x <= 0)
      {
        level ++;
        pos.y = floor1;
        speed *= (-1);
        firstFloor =! firstFloor;
      }    

    // CODE FOR JUMPING
    
      // FIRST LEVEL
    if(firstFloor)
    {
        if(jumping)
      {
         if(pos.y != floor1)
         {
            pos.y += jumpSpeed;
         }
      
        if (pos.y >= floor1)
        {
            if(keyPressed)
          {
 
            if(key == ' ')
            {
              jumping =! jumping;
            } 
          }
        }
      }
  
      else
      {
        pos.y -= jumpSpeed;
   
    
        if(pos.y <= 150)
        {
          pos.y = 150;
          jumping =! jumping;
        }
       }
      }
     
     
     // SECOND LEVEL
      else
    {
        if(jumping)
      {
         if(pos.y != floor2)
         {
            pos.y += jumpSpeed;
         }
      
        if (pos.y >= floor2)
        {
            if(keyPressed)
          {
 
            if(key == ' ')
            {
              jumping =! jumping;
            } 
          }
        }
      }
  
      else
      {
        pos.y -= jumpSpeed;
   
          if(pos.y <= 350)
        {
          pos.y = 350;
          jumping =! jumping;
        }
       }
      }
     
  }// render()
  
  
  void deaths()
  {
    textSize(16);
    text("Deaths:  " + deaths,30,30);
    
    textSize(16);
    text("Level:  " + level,250,30);
   
  } // deaths()

}
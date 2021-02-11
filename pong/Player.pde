class Player{
  float x;
  float y;
  float sizex;
  float sizey;
  int score;
  boolean isPlayer1;
  
  public Player(float sizex, float sizey, boolean isPlayer1){
    if(isPlayer1){
      x = 0 + 20;
    } else {
      x = width - 30;
    }
    y = height/2;
    this.sizex = sizex;
    this.sizey = sizey;
    this.isPlayer1 = isPlayer1;
  }
  
  public void Move(float v){
    
    if(isPlayer1){
      if(w){
        if(y > 0){
          y-=v;
        }
      }
      
      if(s){
        if(y + sizey < height){
          y+=v;
        }
      }
    } else {
      if(up){
        if(y > 0){
          y-=v;
        }
      }
      
      if(down){
        if(y + sizey < height){
          y+=v;
        }
      }
    }
    
    CheckBall();
  }
  
  public void Score(){
    score++;
  }
  
  public void CheckBall(){
    if(ball.x - ball.size/2 < x + sizex && ball.x + ball.size/2 > x){
      if(ball.y - ball.size/2 < y + sizey && ball.y + ball.size/2 > y){
        thread ("SuenaPlayer");
        ChangeBallDirection();
      }
    }
  }
  
  
  /**este método ajusta la dirección de la 
  *pelota segun la parte del jugador donde impacte */
  private void ChangeBallDirection(){
     float distanceToCenter = y + sizey/2 - ball.y;
     ball.vy = (-distanceToCenter / (sizey/2)) * vyMax;
     ball.vx = -ball.vx;
  }
}

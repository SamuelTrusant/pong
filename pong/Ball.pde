class Ball{
  float x;
  float y;
  float vx;
  float vy;
  float size;
  
  public Ball(float size, float vBall){
    this.size = size;
    vx = vBall;
    int coin;
    coin = round(random(0,1));
    boolean res = coin == 1? false:true;
    ResetBall(res);
  }
  
  public int Move(){
    
    if( y + size/2  + vy > height || y - size/2 + vy < 0){
      thread ("SuenaWall");
      vy = -vy;
    }
    
    if(x - size/2 + vx < 0){
      vx = -vx;
      return 2;
    }
    if( x + size/2  + vx > width){
      vx = -vx;
      return 1;
    }
    
    x += vx;
    y += vy;
    return 0;
  }
  
  public void ResetBall(boolean scorePlayer1){
    x = width/2;
    y = random(size/2, height - size/2);
    vy = random(-vyMax,vyMax);
    vx = sqrt(vBall*vBall - vy*vy);
    if(!scorePlayer1){
      vx = -vx; 
    }
  }
}

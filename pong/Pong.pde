
import processing.sound.*;
import gifAnimation.*;

//tamaños
float ballSize = 10;
float playerXSize = 10;
float playerYSize = 100;

//velocidades
float vPlayers = 20;
float vBall = 10;
float vyMax = 20;

//tiempo entre goles
int framesmaxWait = 80;
int frames = 0;


//booleanos para las teclas
boolean w, s, up, down = false;

int score = 1;

//sonidos
SoundFile sonidoGoal;
SoundFile sonidoWall;
SoundFile sonidoPlayer;

Ball ball;
Player player1;
Player player2;

void setup ( ) {
  size(1000 , 800);
  ball = new Ball(ballSize,vBall);
  player1 = new Player(playerXSize,playerYSize, true);
  player2 = new Player(playerXSize,playerYSize, false);
  sonidoGoal = new SoundFile (this, "Alesis-S4-Plus-Clean-Gtr-C4.wav");
  sonidoWall = new SoundFile (this, "Korg-01W-MuteGuitar-C3.wav");
  sonidoPlayer = new SoundFile (this, "Korg-N1R-Harmonics-C5.wav");
}

void draw ( ) {
  //dibujamos el campo de juego
  background (127);
  stroke(255);
  strokeWeight(2);
  for(int i = 0; i < height; i += 40){
      line(width/2, i, width/2, i+20);
  }
  
  //dibujamos el marcador
  textSize(50);
  text( player1.score , width/4, 50) ;
  text( player2.score , width*3/4, 50) ;


  //dibujamos los jugadores
  rect(player1.x, player1.y, player1.sizex, player1.sizey);
  rect(player2.x, player2.y, player2.sizex, player2.sizey);
  player1.Move(vPlayers);
  player2.Move(vPlayers);
  
  if(score != 0){
    frames ++;
    if(frames >= framesmaxWait){
      score = 0;
      frames = 0;
    }
    return;
  }
  
  //dibujamos la pelota
  ellipse(ball.x, ball.y, ball.size, ball.size);
  score = ball.Move();

  
  if(score == 1){
    player1.Score();
    thread ("SuenaGoal");
    ball.ResetBall();
  }
  
  if(score == 2){
    player2.Score();
    thread ("SuenaGoal");
    ball.ResetBall();
  }
}

void SuenaGoal(){
  sonidoGoal.play();
}

void SuenaWall(){
  sonidoWall.play();
}

void SuenaPlayer(){
  sonidoPlayer.play();
}

void keyPressed(){
  switch(key){
    case 'w':
      w = true;
    break;
    case 's':
      s = true;
    break;
  }
  if ( key == CODED){
    if ( keyCode == UP){
      up = true;
    } else {
      if ( keyCode == DOWN){
        down = true;
      }
    }
  }
}

void keyReleased(){
  switch(key){
    case 'w':
      w = false;
    break;
    case 's':
      s = false;
    break;
  }
  if ( key == CODED){
    if ( keyCode == UP){
      up = false;
    } else {
      if ( keyCode == DOWN){
        down = false;
      }
    }
  }
}

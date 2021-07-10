import processing.sound.*;
SoundFile bell,hitBall,gameover;

int WIN_SCORE = 5;

Player player;
Ball ball;
Robot robot;

void showScore(int score,int x){
    fill(255);
    textSize(20);
    text(score,x,40);
    
    
}

void checkWinner(Player p , Robot r){
  if(p.score == 5 ) {
    fill(255,50,255);
    textSize(50);
    text("You Win :)",width/2 - 90,height/2 - 60);
    textSize(15);
    text("Press r to restart",width/2 - 95,height/2 - 40);
    gameover.play();
    noLoop();
  }else if (r.score == 5){
    fill(255,50,50);
    textSize(50);
    text("You Lose :(",width/2 - 90,height/2 - 60);
    textSize(15);
    text("Press r to restart",width/2 - 95,height/2 - 40);
    gameover.play();
    noLoop();
  }
}

void setup(){
  size(600,400);
  
  player = new Player();
  robot = new Robot();
  ball = new Ball();
  
  bell = new SoundFile(this,"bell.mp3");
  hitBall = new SoundFile(this,"paddle.mp3");
  gameover = new SoundFile(this,"game_over.mp3");
}

void draw(){
  background(0);
  fill(255);
  stroke(255);
  strokeWeight(2);
  line(width / 2 - 1, 0, width / 2 - 1, height);
  
  ball.edges();
  ball.update();
  ball.show();
  
  player.update();
  player.show();
  
  robot.move(ball);
  robot.show();
  
  ball.check(player,robot);
  
  showScore(player.score,32);
  showScore(robot.score,width - 32);
  
  checkWinner(player,robot);
}

void keyReleased(){
 player.move(0); 
}

void keyPressed(){
  if(keyCode == UP){
    player.move(-10);
  }else if(keyCode == DOWN){
    player.move(10);
  }
  //if(key=='r'){
  //  draw(); 
  //  player.score = 0;
  //  robot.score = 0;
  //}
}

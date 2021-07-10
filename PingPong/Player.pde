class Player{
  
 float x = 10;
 float y = height/2;
 float w = 10;
 float h = 100;
 int score = 0;
 
 float ychange = 0;

  void show(){
   fill(255);
   rectMode(CENTER);
   rect(x,y,w,h);
  }
  
  void update(){
    y += ychange;
    y = constrain(y,h/2,height-h/2);
  }
  
  void move(float step){
    ychange = step; 
  }
}

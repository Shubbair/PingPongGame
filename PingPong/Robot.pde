class Robot{
  
 float x = width - 10;
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
  
  void move(Ball b){
    if(b.x + b.r*2 > width/2){
      ychange = lerp(y,b.y,0.1);
      y = ychange;
      y = constrain(y,h/2,height-h/2);
    }
  }
}

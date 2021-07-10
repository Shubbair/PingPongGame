class Ball{
  float x = width/2;
  float y = height/2;
  float r = 12;
  float angle;
  float xspeed,yspeed;
  float velocity = 5;
  float l;
   
  
  Ball(){
   reset();
  }
  
  void edges(){
   if(y - r < 0 || y + r > height){
      yspeed *= -1;
      hitBall.play();
   } 
   
   if(x + r < 0){
     bell.play();
     robot.score++;
     reset();
   }else if(x - r > width){
     bell.play();
     player.score++;
     reset();
   }
    
  }
  
  void check(Player p,Robot R){
    if (y - r < p.y + p.h/2 && y + r > p.y - p.h/2 && x - r < p.x + p.w/2) {
      if (x > p.x) {
        hitBall.play();
        float diff = y - (p.y - p.h/2);
        float rad = radians(45);
        float angle = map(diff, 0, p.h, -rad, rad);
        xspeed = 5 * cos(angle);
        yspeed = 5 * sin(angle);
        x = p.x + p.w/2 + r;
        //xspeed *= -1;
      }
    }

    if(y - r < R.y + R.h/2 && y + r > R.y - R.h/2 && x + r > R.x - R.w/2){
      if (x < R.x) {
        hitBall.play();
        //xspeed *= -1;
        float diff = y - (R.y - R.h/2);
        float angle = map(diff, 0, R.h, radians(225), radians(135));
        xspeed = velocity * cos(angle);
        yspeed = velocity * sin(angle);
        x = R.x - R.w/2 - r;
      }
    }
  }
  
  void reset(){
   x = width/2;
   y = height/2;
   
    //angle = random(TWO_PI);
    //xspeed = 5 * sin(angle);
    //yspeed = 5 * cos(angle);

   angle = random(-PI / 8,PI / 8);

   xspeed = velocity * cos(angle);
   yspeed = velocity * sin(angle);
   
   l = random(1);
   if( l > 0.5) xspeed *= -1;
  }
  
  void update(){
    x = x + xspeed;
    y = y + yspeed;
  }
  
  void show(){
   fill(255);
   ellipse(x,y,r*2,r*2);
  }
  
  
  
};

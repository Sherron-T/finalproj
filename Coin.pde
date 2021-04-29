class Coin{
  float x, y;
  boolean player_jump, player_left, player_right, jump;
  boolean facing_left;
  PImage[] sprite = new PImage[8];
  float frame = 0;
  int level;

  Coin(float x, float y, int _level){
    this.x = x;
    this.y = y;
    this.level = _level;
    if (level == 1){
      sprite = new PImage[2];
    }
    for(int i = 0; i < sprite.length; i++){
      sprite[i] = loadImage("assets/sprite/L" +level +"/c" + level + "_" + (i+1) + ".png");
    }
  }
  
  void display(){
    fill(255);
    imageMode(CENTER);
    image(sprite[int(frame)],x,y-18);
    frame += 0.02;
    if (level == 1){
      if(frame >= 2){
        frame = 0.6;
      }
    }
    else{
      if (frame >=8){
        frame = 0.6;
      }
    }
  }
}

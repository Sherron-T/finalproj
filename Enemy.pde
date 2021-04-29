class Enemy{
  float x, y;
  boolean player_jump, player_left, player_right, jump;
  boolean facing_left;
  PImage[] sprite = new PImage[2];
  float frame = 0;

  Enemy(float x, float y){
    this.x = x;
    this.y = y;
    for(int i = 0; i < sprite.length; i++){
      sprite[i] = loadImage("assets/sprite/e" + (i+1) + ".png");
    }
  }
  
  void display(){
    fill(255);
    imageMode(CENTER);
    image(sprite[int(frame)],x,y-24);
    frame += 0.02;
    if (frame >= 2){
      frame = 0.6;
    }
  }
}

class Player{
  float x, y;
  boolean player_jump, player_left, player_right, jump;
  boolean facing_left;
  float temp_base_y; //Change to detect platforms
  float vy, vx, gravity_const;
  PImage[] sprite = new PImage[8];
  float frame;
  Platform[] platCopy;

  Player(float x, float y, float g, Platform[] _plats){
    this.x = x;
    this.y = y;
    this.temp_base_y = this.y;
    this.gravity_const = g;
    for(int i = 0; i < sprite.length; i++){
      sprite[i] = loadImage("assets/sprite/player" + i + ".png");
    }
    platCopy = _plats;
  }
  
  void display(){
    fill(255);
    imageMode(CENTER);
    image(sprite[int(frame)],x,y-24);
  }
  
  void move(int input, boolean b) {
    if((input == UP || input == 87) && jump == true){
      vy = -10;
      jump = false;
      player_jump = b;
    }
    if(input == LEFT || input == 65){
      player_left = b;
    }
    if(input == RIGHT || input == 68){
      player_right = b;
    }
  }
  
  void transform(float speed) {
    vx = speed*(int(player_right) - int(player_left));
    x+=vx;
    if(vx < 0){
      facing_left = true;
      if(frame <= 0){
        frame = 3;
      }
      else if(frame > 0){
        frame-=0.2;
      }
    }
    else if(vx > 0) {
      facing_left = false;
      if(frame >= 7){
        frame = 4;
      }
      else if(frame < 7){
        frame+=0.2;
      }
    }
    else if(vx == 0){
      if(facing_left){
        frame = 3;
      }
      else{
        frame = 4;
      }
    }
    vy += gravity_const; //Gravity
    y+=vy;
    if(y >= temp_base_y){
      y = temp_base_y;
      vy = 0;
      jump = true;
    }
  }
}

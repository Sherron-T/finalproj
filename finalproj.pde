Platform[] allPlats;
Coin[] allCoins;

Player p;
Clock timer;
Enemy ghost;
Enemy ghost2;

int timeLeft = 200;
String timerString = "Timer: " + timeLeft;

boolean holding = false;
boolean inPlatRange = false;
boolean areTheyGoingLeft;
boolean areTheyGoingRight;

void setup(){
  allPlats = new Platform[]{
    new Platform(6, "ground", 0, height-30), // Ground
    new Platform(9,"ground", 650, height-30), //Ground2
    new Platform(5, "platform", 200, height-120), //Floating
    new Platform(2, "platform", 670, height-120), //Floating2
    new Platform(3, "platform", 730, height-180), //Floating3
    new Platform(2, "platform", 820, height-120), //Floating4
    new Platform(5, "platform", 1050, height-60), //Pyramid1
    new Platform(4, "platform", 1080, height-90), //Pyramid2
    new Platform(3, "platform", 1110, height-120), //Pyramid3
    new Platform(2, "platform", 1140, height-150), //Pyramid4
    new Platform(1, "platform", 1170, height-180), //Pyramid5
  };
  allCoins = new Coin[]{
    new Coin(245, height-120, 1),
    new Coin(275, height-120, 2), 
    new Coin(305, height-120, 1), 
    new Coin(715, height-120, 2), 
    new Coin(835, height-120, 2), 
    new Coin(745, height-180, 3), 
    new Coin(775, height-180, 3),
    new Coin(805, height-180, 3), 
    new Coin(745, height-30, 2), 
    new Coin(805, height-30, 2) 
  };
  size(800,600, P3D);
  timer = new Clock();
  p = new Player(100,allPlats[0].y, 0.4, allPlats);
  ghost = new Enemy(500, allPlats[0].y);
  ghost2 = new Enemy(1000, allPlats[1].y);
  print(tan(PI*30.0 / 180.0));
}

void draw(){
  background(color(#add8e6));
  p.transform(4);
  p.display();
  ghost.display();
  ghost2.display();
  for (Coin i : allCoins) 
  { 
      i.display();
  }
  inPlatRange = false;
  for (int i = 0; i < allPlats.length; i++){
    Platform currentPlat = allPlats[i];
    currentPlat.display();
    checkTouchingGround(currentPlat);
  }
  if (!inPlatRange){
    p.temp_base_y = height;
  }
  timerString = "Time: " + timeLeft;
  timeLeft = timer.countdown(timeLeft);
  fill(0);
  textSize(26);
  text(timerString, 50, 50);
  camera(400+(p.x-100), 300, 519.615, 400+(p.x-100), 300, 0, 0, 1, 0);
}

void keyPressed() {
  holding = true;
  p.move(keyCode, true);
  setDirection(keyCode, true);
}
 
void keyReleased() {
  p.move(keyCode, false);
  setDirection(keyCode, false);
}

void checkTouchingGround(Platform cPlat){
  if ((p.x < cPlat.x + cPlat.size*cPlat.increment)&& p.x> cPlat.x){;
    inPlatRange = true;
    if (p.y <= cPlat.y){
      p.temp_base_y = cPlat.y;
    }
  }
}

void setDirection(int input, boolean flipSwitch){
    if (input ==  LEFT){
      areTheyGoingLeft = flipSwitch;
    }
    else if (input == RIGHT){
      areTheyGoingRight = flipSwitch;
    }
}

float update(float x){
    if(areTheyGoingRight){
     for(Platform i : allPlats){
       if(p.x < i.x && ((p.x+4) > i.x)){
         return 0;
       }
     }
     return x -= 4;
    }
    else if(areTheyGoingLeft){
     return x += 4;
    }
    return x += 0;
  }

class Platform{
PImage plat_img;
int size;
float y;
float x;
boolean areTheyGoingLeft;
boolean areTheyGoingRight;
String type;
int increment;

  Platform(int _size, String _type, float _x, float _y){
    plat_img = loadImage("assets/" + _type + ".png");
    this.size = _size;
    this.x = _x;
    this.y = _y;
    this.type = _type; 
  }
  
  void display(){
    for(int i = 0; i < this.size; i++){
      imageMode(CORNER);
      if (type.equals("platform")){
        increment = 30;
      }
      else if(type.equals("ground")){
        increment = 100;
      }
      image(plat_img, x + increment*i, y);
      }
  }
  
  

}

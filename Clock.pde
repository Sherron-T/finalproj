class Clock{
int elapsedTime = 0;
int interval = 0;
int currentFrame = 0;
int timeDiff = 0;

//defaults to 1 s interval but you can specify the interval for the clock
  Clock(int _interval){
    this.interval = _interval;
  
  }
  
  Clock(){
    this.interval = 1000;
  }
  
  //returns a decremented number each time the interval is reached
  int countdown(int countDownTime){
      if (countDownTime >= 0){
      
        if ((millis() - elapsedTime ) >= interval){
          countDownTime -= 1;
          elapsedTime = millis();
          return countDownTime;
        }
        else{
          return countDownTime;
        }
      }
      else{
        return 0;
      }   
  }
  
  //returns true everytime the interveral is reached
  boolean timer(){
    if ((millis() - elapsedTime ) >= interval){
          elapsedTime = millis();
          return true;
        }
        else{
          return false;
        }
  }
  
  //servers to start the timer by making the difference between ellapsed time and currrent time 0
  void startTime(){
    elapsedTime = millis();
  }
  //saves the difference between current time and elapsedTime
  void pauseTime(){
    timeDiff = millis() - elapsedTime;
  }
  
  //resets the difference between the two and adds in the orginal difference upon pausing
  void unpauseTime(){
    elapsedTime = millis() + timeDiff;
  }
}

# ClockTimer
Implement a basic stopwatch timer (class: ClockTimer) in Java that:

1. Can be initialised using constructor: new ClockTimer(int hours, int minutes, int seconds, int miliSeconds)
2.Can be started by calling start() method. The control goes to a new background thread as soon as start() is called
3. Uses call back listeners using interfaces that:
  a) Calls a method: onSecondsUpdate(ClockTimer remainingTime) in the listener after each second.
  b) Calls: onTimerEnd() when the time remaining is 00:00

I should be able to use the class like the following:

ClockTimer timer = new ClockTimer(0, 0, 5, 400);
timer.start();
timer.setTimerListener(new ClockTimer.ClockTimerListener(){
   void onSecondsUpdate(ClockTimer updatedTimer){
      //print time remaining
      //Update ui
   }
   void onTimerEnd(){
      //print timer end message
   }
});

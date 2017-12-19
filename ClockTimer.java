public class ClockTimer extends Thread{
    
    int hours,minutes,seconds,millisec;
    public interface ClockTimerListener
    {
        public void onSecondsUpdate(ClockTimer updateTimer);
        public void onTimerEnd();
    }
    ClockTimerListener listener;
    
    ClockTimer(int hours,int minutes,int seconds,int millisec)
    {
        super();
        this.hours=hours;
        this.minutes=minutes;
        this.seconds=seconds;
        this.millisec=millisec;
    }
    public void start()
    {
    }
    public void setTimerListener(final ClockTimerListener listener )
    {
        Thread t=new Thread(new Runnable() {

            @Override
            public void run() {
                while(hours>0 || minutes>0 || seconds>0 || millisec>0)
                {
                    if(millisec>0)
                        millisec--;
                    else if(seconds>0)
                    {
                        seconds--;
                        millisec=59;
                    }
                    else if(minutes>0)
                    {
                        minutes--;
                        seconds=59;
                        millisec=59;
                    }
                    else if(hours>0)
                    {
                        hours--;
                        minutes=59;
                        seconds=59;
                        millisec=59;
                    }
                    if(hours==0 && minutes==0 && seconds==0 && millisec==0)
                    {
                        listener.onTimerEnd();
                        return;
                    }
                    else if(ClockTimer.this!=null)
                    {   
                        listener.onSecondsUpdate(new ClockTimer(hours,minutes,seconds,millisec));
                    }
                }     
            }
        });
        t.start();
    };
    
    public static void main(String[] args) {
        ClockTimer timer = new ClockTimer(0, 0, 5, 400);
        timer.start();
        timer.setTimerListener(new ClockTimer.ClockTimerListener(){
            public  void onSecondsUpdate(ClockTimer updatedTimer){
                //print time remaining
                //Update ui
                System.out.println(updatedTimer.hours+":"+updatedTimer.minutes+":"+updatedTimer.seconds+":"+updatedTimer.millisec);
            }
            public void onTimerEnd(){
                //print timer end message
                System.out.println("Timer Completed");
            }
        });
    }
}


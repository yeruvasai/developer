public class excercise1 {
    static integer x,y;
    static integer z;
    
    public excercise1 ()
    {
        x=0;
        y=0;
        z=0;
    }
    public static void setValues(integer z1)
    {
        
        z=z1;
    }
    public void values(integer x1 ,integer y1){
        x=x1;
        y=y1;
        
    }
    public void process()
    {
        z=x+y;
    }
    public void getValues()
    {
        system.debug('the result is'+z);
    }

}
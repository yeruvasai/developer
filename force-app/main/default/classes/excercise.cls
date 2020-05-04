public class excercise {
    integer n;
    {
        for(n=0;n<=100;n++)
        {
            if(math.mod(n,3)==0 && math.mod(n,5)==0) 
            {
              system.debug('salesforce');  
            } 
            else if(math.mod(n,3)==0)
            {
              system.debug('sales');   
            }
               else if(math.mod(n,5)==0)
            {
              system.debug('force');   
            }
            else
            system.debug(n);
        }
    }

}
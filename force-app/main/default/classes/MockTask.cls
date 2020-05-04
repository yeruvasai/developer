public class MockTask {
    
     public static list<wrapper> wrap;
     public static string cust;
     public static list<string> ode;
    
    @auraenabled
    
    public static list<wrapper> rec(){
        wrap = new list<wrapper>();
        
        list<customer__c> customer = [select id,name from customer__c];
        list<Order_no__c> order = [select name,customer__c from Order_no__c ];
        system.debug(order);
        
        for(customer__c cus:customer){
            ode = new list<string>();
            cust = cus.Name;
            for(Order_no__c ord:order){
                if(cus.Id == ord.customer__c){
                    ode.add(ord.name);
                    
                }
            }
           wrap.add(new wrapper(cust,ode));
        }   
        return wrap;  
    }
 
    public class wrapper{
        @auraenabled public string cus{get ;set;}
        @auraenabled public list<string> ord{get; set;}
        
        public wrapper(string cuss,list<string> ords){
            cus = cuss;
            ord = ords ;
        }
    }

}
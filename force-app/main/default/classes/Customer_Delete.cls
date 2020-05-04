public class Customer_Delete {

    public list<CustomerDetails> customer { get; set; }
    
    public list<customer__c> custom {get; set;}
    
    public void selectall () {
        if(!customer.isEmpty()){
        
            for(CustomerDetails wr:customer)
            {
                wr.isselect = true ;
                    
                
            }
        }
    }
    
    public void deselectall () {
        if(!customer.isEmpty()){
        
            for(CustomerDetails wr:customer)
            {
                wr.isselect = false;
            }
        }
    }
    
    public void deleterec (){
    custom = new list<customer__c>();
    for(integer i=customer.size()-1;i>=0;i--){
        CustomerDetails cd = customer[i];
        if(cd.isselect == true){
            custom.add(cd.cust);
            customer.remove(i);
        }
    }
    
    delete custom;
    }
    
    
    
        public Customer_Delete (){
            
            customer = new list<CustomerDetails>();
            
            list<customer__c> cus = [select id,name from customer__c];
            
            for(customer__c cust:cus){
                customer.add(new CustomerDetails(cust,false));
            }
            
        }
    
    
    // Wrapper class
    
    public class CustomerDetails{
    
        public customer__c cust {get; set;}
        
        public boolean isselect {get; set;}
        
        public CustomerDetails(customer__c custom,boolean status){
            
            this.cust = custom ;
            this.isselect = status ;
            
        }
    
    }
}
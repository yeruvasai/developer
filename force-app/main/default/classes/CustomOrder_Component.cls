public class CustomOrder_Component {
    
    public customer__c cust{get;set;}
    
    public CustomOrder_Component(){
        cust = new customer__c();
    }
    
    public customer__c customer{
        get{
            customer = [select id,name,Email__c,Address__c from customer__c where id=:cust.id];
            
            return customer;
        }
        set;
    }
}
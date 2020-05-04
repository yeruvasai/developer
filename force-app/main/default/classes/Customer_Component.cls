public class Customer_Component {
    
    public customer__c cust{get;set;}
    public order_no__c order{get;set;}
    
    public Customer_Component(){
        cust = new customer__c();
        order = new order_no__c();
    }
    
    public list<customer__c> customers{
        get{
            customers = [select id,name,Email__c,Address__c from customer__c where id=:apexpages.currentPage().getparameters().get('id')];
            
            return customers;
        }
        set;
    }

    public list<order_no__c> orders{
        get{
        orders = [select id,name,customer__c,Planned_Delivery_Date__c,status__c from order_no__c where customer__c=:apexpages.currentPage().getparameters().get('id')];
        return orders;
    }
    set;
    }
}
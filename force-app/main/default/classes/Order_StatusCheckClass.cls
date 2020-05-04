public with sharing class Order_StatusCheckClass {

    public order_no__c od { get; set; }
        
    public Id clickbutton { get; set; }
    
    public Id boxcheck { get; set; }
    
    public Order_StatusCheckClass(){
    
    }

// COMMAND BUTTON LOGIC
    public PageReference delivered() {
        od = [select id,name from order_no__c where Id =: clickbutton];
        od.status__c = 'Delivered';
        
        update od;
        return null;
    }

// CHECKBOX LOGIC
    public PageReference checkingbox() {
        od = [select id,name from order_no__c where Id =: boxcheck];
        od.status__c = 'new';
                                
        update od;
        return null;
    }
 
    public List<Order_no__c> orders { set; }
    
    public List<Order_no__c> getorders(){
        return[select id,name,customer__c,status__c from order_no__c];
}
}
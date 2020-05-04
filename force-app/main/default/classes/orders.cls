public class orders {
  

   public list<Order_Line_No__c> order{get;set;}
    
    public Order_no__c ord{get;set;}

public orders(ApexPages.StandardController controller) {
    
   // order = new list<Order_Line_No__c>();
    // ord = new Order_no__c ();
    ord = (Order_no__c )Controller.getRecord();
    order= [select id ,name,item__r.item_name__c,item__r.unit_price__c,Quantity__c,Price__c from Order_Line_No__c where Order_no__c = :ord.Id ];

    }

}
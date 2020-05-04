public class Order_Number {

    public list<Order_Line_No__c> order { get; set; }
    
     
    public void search() {
       // Order_no__c  ord = new Order_no__c ();
        od = [select id,name,customer__r.name,Planned_Delivery_Date__c from Order_no__c where id = :fetch limit 1];
       // od = ord;
        order = [select id ,name,item__r.item_name__c,item__r.unit_price__c,Quantity__c,Price__c from Order_Line_No__c where Order_no__c = :od.Id ];

    }


    public String fetch { get; set; }

    public Order_no__c od { get; set; }
    
    public Order_Number (){
    od = new Order_no__c();
    }
}
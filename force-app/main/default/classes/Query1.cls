public class Query1 {

    public Order_no__c ord { get; set; }
    
    public list<Order_no__c> getorders(){
    return[select id,customer__c,Deliverd__c,Planned_Delivery_Date__c,Status__c from Order_no__c ];
    }
    
    public query1(){
    ord= new Order_no__c();
    }

    public PageReference save() {
    insert ord ;
        return null;
    }

}
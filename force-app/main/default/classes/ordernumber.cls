public class ordernumber {

    
    
        public list<Order_Line_No__c> lin{get;set;}
    
    public Order_no__c ord{get;set;}

    public ordernumber(ApexPages.StandardSetController controller) {
    
    lin = new list<Order_Line_No__c>();
    ord = new Order_no__c ();
    this.ord = (Order_no__c )Controller.getRecord();
    lin= [select id ,name,item__r.name,item__r.unit_price__c,Quantity__c,Price__c from Order_Line_No__c where Order_no__c  = :this.ord.id ];

    }


    }
public class Testing_Status {
    
    public id box{get;set;}
    
    public id recbox{get;set;}

    public order_no__c od{get;set;}

   
   // order_no__c or = new order_no__c();

    public PageReference check() {
    
    od = [select id,name from order_no__c where id=:box];
    
    od.status__c = 'processing';
   /* if(checkbox==true){
    od.status__c = 'processing';
    }
    if(checkbox==false){
    od.status__c = null;
    }*/
    
    update od;
        return null;
    }


  

    public PageReference deliverd() {
    
    od = [select id,name from order_no__c where id=:recbox];
    {
        od.status__c = 'delivery';
        }
        update od;
    
    
        return null;
    }


    public boolean checkbox { get; set; }

    public list<order_no__c> getOrder() {
        return [select id,name,customer__c,status__c from order_no__c];
    }

}
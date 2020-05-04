public class Delivery_Order {

    public boolean checkbox{get;set;}

    public id rec{get;set;}
    
    public id newrec{get;set;}
    
    public order_no__c tus{get;set;}

    public void deliverd() {
        tus=[select id,name from order_no__c where id=:newrec];
       {
        tus.status__c = 'delivery';
        }
        update tus;
    

        }
        

    public PageReference delivery() {
    
    tus =[select id,name from order_no__c where id=:rec];
    //tus.status__c=null;
    
          if(checkbox==true){
        tus.status__c = 'processing';
        }
        if(checkbox==false){
        tus.status__c = 'new';
        
        }
        update tus;
        return null;
    }


    public list<order_no__c> getStatus() {
        return [select id,name,customer__c,status__c from order_no__c];
        

    }

}
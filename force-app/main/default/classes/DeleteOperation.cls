public class DeleteOperation {

    public bottle__c cus { get; set; }
    
    public DeleteOperation (){
    cus = new bottle__c ();
    }

    public PageReference deleterec() {
    delete cus;
        return null;
    }


    public PageReference fetchs() {
    cus = [select id,name,price__c from bottle__c where id=:fetch limit 1 ];
        return null;
    }


    public String fetch { get; set; }
}
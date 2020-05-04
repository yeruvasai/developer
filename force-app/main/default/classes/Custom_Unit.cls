public class Custom_Unit {


    public item__c item { get; set; }
    
    public custom_unit(){
    item = new item__c();
    }

    public list<item__c> getUnit() {
        return [select id, name, item_name__c, unit_price__c from item__c];
    }


    public void save() {
        /*item__c it = new item__c();
        it.item_name__c = item.item_name__c ;
        it.unit_price__c  = item.unit_price__c ;
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'records created successfully'));*/
       
        try{
        insert item;
        }
        catch(exception e){
            system.debug('Error'+ e.getCause());
        }
        item = new item__c();
    }


    public Decimal uprice { get; set; }

    public String iname { get; set; }
}
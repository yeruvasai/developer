public class BatchapexUpdate implements database.Batchable<item__c>{
    
    public iterable<item__c> start(database.BatchableContext bc){
        list<item__c> item = [select id,item_name__c,unit_price__c from item__c]; 
        return item;
    }
    
    public void execute(database.BatchableContext bc,list<item__c> items){
        for(item__c itm:items){
            itm.unit_price__c +=5000;
        }
        update items;
    }
    
    public void finish(database.BatchableContext bc){
        
    }
}
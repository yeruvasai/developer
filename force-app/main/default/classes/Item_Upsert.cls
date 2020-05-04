public class Item_Upsert {

    public Item_Upsert(){
        item = new item__c();
        list<item__c> item = [select id from item__c];    
    }
    
    

    public PageReference upsertrecord() {
    
    list<item__c> price = [select id,name,item_name__c,unit_price__c from item__c where id =:item.id];
    for(item__c pr:price){
        item = pr ;
    }
    item__c obj = new item__c();
    item = obj;
    
    price.add(obj);
    
    upsert price;
        return null;
    }


    public item__c item { get; set; }
}
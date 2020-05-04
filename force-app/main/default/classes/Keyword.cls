public with sharing class Keyword {

    public boolean hide { get; set; }


    public list<item__c> getItem() {
    hide = true;
        return [select item_name__c,unit_price__c from item__c where item_name__c like :'%' +fetch+ '%'];
    }
        
    public PageReference word() {
      if(fetch == null || fetch == ''){
      hide = false;
      }
        return null;
    }


    public String fetch { get; set; }
}
public class qprice {

    public list<item__c> iunit{get;set;}
    
    public qprice(ApexPages.StandardController controller) {
     
     iunit = [select id,item_name__c, unit_price__c from item__c];

    }

}
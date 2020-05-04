@istest
public class TestClass1 {
    
    public static testmethod void testing(){
       
       Custom_Unit uni = new Custom_Unit ();
        uni.item = new item__c(item_name__c='abc',unit_price__c=1000);
        
		       uni.save();     
        		uni.uprice = 1000;
        		uni.iname = 'sai';
        
        list<item__c> er = new Custom_Unit().getUnit();
        system.assertEquals(1,er.size());
        
        custom_unit dum = new custom_unit();
        dum.item = new item__c(item_name__c='abcssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhssssssssssssssssssssssssssssss',unit_price__c=1000);
        dum.save();
        
    }
     

}
public class RecordFetchInsert {
    
    @AuraEnabled
    
    public static void recordins(Registration_Form__c recins){
        insert recins ; 
    }

    @AuraEnabled
    
    public static list<Registration_Form__c> recordfet(){
        
        return[select id,name,Parent_Name__c,Class_Name__c,Mobile_Number__c from Registration_Form__c];
    }
    
}
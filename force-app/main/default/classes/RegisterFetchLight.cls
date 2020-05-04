public class RegisterFetchLight {
    
    @AuraEnabled
    
    public static list<Registration_Form__c> regfetch(string forms){
        string searchtext = '%'+forms+'%' ;
        return[select id,name,Parent_Name__c,Class_Name__c,Mobile_Number__c from Registration_Form__c where name like:searchtext];
    }

}
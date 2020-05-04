public class DatatableTask {

    @AuraEnabled
    
    public static list<Registration_Form__c> recordfet(){
        
        return[select id,name,Parent_Name__c,Class_Name__c,Mobile_Number__c from Registration_Form__c];
    }
    
    @AuraEnabled
    public static list<Registration_Form__c> updatecontact(List<id> acc ){
        system.debug(acc);
		
        list<Registration_Form__c> cons = [select id,name from Registration_Form__c where id in:acc];
        update cons;
        return cons;
    }
    
}
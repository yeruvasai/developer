public class RegistrationInsertLight {
    
    @AuraEnabled 
    
    public static id reginsert(Registration_Form__c regs){
        
        insert regs;
        return regs.id;
        
    }

}
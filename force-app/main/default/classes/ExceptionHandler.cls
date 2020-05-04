public class ExceptionHandler {
    
    @AuraEnabled

      public static void recordins(Registration_Form__c recins){
          system.debug('hi'+recins);
       try{
           insert recins;
       }
       catch(exception e){
           throw new AuraHandledException('save'+ e.getMessage()+'&'+e.getLineNumber()+'&'+e.getCause());  
       }
        
   }

}
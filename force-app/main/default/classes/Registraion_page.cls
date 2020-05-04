public class Registraion_page {
    
    @auraenabled
    public static candidate__c regins(candidate__c candetails){
        try{
            insert candetails;
        }
        catch(exception e){
            system.debug('Errors'+e.getMessage());
        }
        system.debug(candetails);
        return candetails;
    }

}
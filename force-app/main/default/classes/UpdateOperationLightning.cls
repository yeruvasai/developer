public class UpdateOperationLightning {
    
    @AuraEnabled
    public static List<contact> getAllcontact(){
        return [Select Id,Name,phone from contact] ; 
        
    }
    @AuraEnabled
    public static list<contact> updatecontact(List<id> acc ){
        system.debug('hi'+acc);
		
        list<contact> cons = [select id,name from contact where id in:acc];
        update cons;
        return cons;
    }

}
public class RegistrationInsertFetchLightning {
    
    @AuraEnabled
    
    public static list<contact> regfetch(contact regis){
        
        return[select id,name from contact ];
       
     
    }
    @AuraEnabled
    
    public static list<contact> delrec(list<id> del){
        system.debug(del);
        
        list<contact> cont = [select id,name from contact where id in : del];
        system.debug(cont);
        delete cont;
        list<contact> con = database.query('select id,name from contact');
        return con;
    }
    

}
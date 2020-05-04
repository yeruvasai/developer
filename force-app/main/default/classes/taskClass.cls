public class taskClass {
    
    @AuraEnabled
    
    public static list<contact> regfetch(contact regis ){
        
        return[select id,name from contact limit 5];
       
     
    }

}
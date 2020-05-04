public class Login_Page {
    
    @auraenabled
    public static candidate__c submits(string email,string word){
        candidate__c c = new candidate__c();
        try{
         c = [select name,id,Password__c from candidate__c where email__c =:email and password__c =: word];
        }
        catch(exception e){
            c = null;
        }
        return c;
    }
      /*  system.debug(c);
        if(c!= null){
        if(c.Password__c == word){
            return c;
        }
        else{
            return null;
        }
    } 
        else{
            return null;
        }
    } */

}
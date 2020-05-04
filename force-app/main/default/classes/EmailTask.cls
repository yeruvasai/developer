public class EmailTask {
    
    @auraenabled 
    public static void recins(Registration_Form__c reg){
        
        try{
            insert reg;
        }
        catch(exception e){
            system.debug('Errors'+e.getMessage());
        }
        
    }
    
    @auraenabled 
    public static list<Registration_Form__c> regfetch(){
    	return[select Name,Parent_Name__c,Class_Name__c,Mobile_Number__c,Email__c from Registration_Form__c ];
    }
    
    @auraenabled 
    public static list<Registration_Form__c> delrec(list<id> del){
        system.debug(del);
        list<Registration_Form__c> reg =[select id from Registration_Form__c where id in:del];
        delete reg;
        list<Registration_Form__c> regs=database.query('select Name,Parent_Name__c,Class_Name__c,Mobile_Number__c,Email__c from Registration_Form__c ');
        return regs;
    }
    
    @auraenabled 
    public static void mailsend(string mails,string body,string subject){
        
        messaging.SingleEmailMessage semail = new messaging.SingleEmailMessage();
       // string[] sending = new string[]{mails};
        semail.ToAddresses = new string[]{mails};
		semail.setSubject(subject);
        semail.setPlainTextBody(body);
        messaging.sendEmail(new messaging.SingleEmailMessage[]{semail});
    }
    
    @auraenabled
    public static void uptrec(Registration_Form__c reg){
        update reg;
    }
        
    

}
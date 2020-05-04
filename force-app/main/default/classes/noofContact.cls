public class noofContact {
    
    public static void noofrecords(list<contact> cont){
        set<id> contact = new set<id>();
        for(contact con:cont){
            if(con.accountid != null ){
            contact.add(con.AccountId);
            }
        }
        
         list<account> ac = [select id,name,No_of_Contacts__c,(select id from contacts) from account where id in :contact];
        for(account a:ac){
            a.No_of_Contacts__c = a.contacts.size();
        }
        try{
            update ac;
        }
        catch(exception e){
             system.debug('errors'+ e);
        }
        
    }

}
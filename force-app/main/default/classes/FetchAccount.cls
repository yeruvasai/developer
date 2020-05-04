public class FetchAccount {
    @AuraEnabled 
    
    public static list<account> getContactList(list<id> accountIds){
        list<account> contactList  = [select id,Name,Phone,Industry from account where id in: accountIds];
        return contactList ;
    }

}
trigger ContactUpdate on Account (after update) {
    Map < Id,  Account > mapAccount = new Map < Id, Account >();
    List<Contact> listContact = new List<Contact>();
   
    for(Account acct : trigger.new){
        mapAccount.put(acct.Id, acct);
        system.debug(mapAccount);
    }
   
    listContact = [ SELECT MailingStreet, MailingCity, AccountId FROM Contact WHERE AccountId IN : mapAccount.keySet() ];
   
    if ( listContact.size() > 0 ) {
        for ( Contact con : listContact ) {
            con.MailingStreet = mapAccount.get(con.AccountId).BillingStreet;
            con.MailingCity = mapAccount.get(con.AccountId).BillingCity;
        }
        update listContact;
    }
}
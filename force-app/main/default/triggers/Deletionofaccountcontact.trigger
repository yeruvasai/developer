trigger Deletionofaccountcontact on Account (after delete) {
    
    set<id> accounts =new set<id>();
    for(account acc:trigger.old){
        accounts.add(acc.id);
    }
    
    try{
        list<contact> contacts = [select id,accountid from contact where accountid in:accounts];
        delete contacts;
    }
    catch(exception e){
        system.debug('errors'+ e);
    }

}
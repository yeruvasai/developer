trigger NoofContacts on Contact (after insert,after delete) {
   
    set<id> cont = new set<id>();
    
    if(trigger.isinsert){
        for(contact con:trigger.new){
            cont.add(con.accountid);
        }
    }
    if(trigger.isdelete){
        for(contact con:trigger.old){
            cont.add(con.accountid);
        }
    }
        
     
    list<account> acc = [select id,name,No_of_Contacts__c,(select id from contacts) from account where id in :cont];
    for(account acc1:acc){
        acc1.No_of_Contacts__c = acc1.contacts.size();
    }
    update acc;

}
trigger Account_Contact1 on Account (after insert) {
    list<contact> con = new list<contact>();
    for(account acc:trigger.new){
        if(acc.Type == 'prospect'){
            contact cont = new contact();
            cont.LastName = acc.Name ;
            cont.Phone = acc.Phone ;
            cont.AccountId = acc.Id;
            con.add(cont);
        }
    }
    insert con;
}
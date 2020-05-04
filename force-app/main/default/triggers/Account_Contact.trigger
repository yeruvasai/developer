trigger Account_Contact on Account (after insert) {
    
    list<contact> con = new list<contact>();
    list<opportunity> oppo = new list<opportunity>();
    for(account acc:trigger.new){
        contact cont = new contact();
        cont.LastName = acc.Name ;
        cont.AccountId = acc.Id ;
        con.add(cont) ;
        opportunity opp = new opportunity();{
            opp.Name = acc.Name ;
            opp.AccountId = acc.Id ;
            opp.StageName = 'closed won';
            opp.CloseDate = date.today()+10;
            oppo.add(opp);
        }
    }
    insert con;
    insert oppo;
}
trigger Account_Opportunity on Account (after insert) {
    list<opportunity> oppo = new list<opportunity>();
    for(account acc :trigger.new){
        if(acc.AnnualRevenue == 5000000 && acc.industry== 'Energy'){
            opportunity opp = new opportunity();
            opp.Name = acc.name;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today()+30;
            opp.AccountId = acc.Id;
            oppo.add(opp);
        }
    }
    insert oppo;
}
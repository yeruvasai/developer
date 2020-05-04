trigger AccountTrigger on Account (after insert) {
    
    Opportunity opp = new Opportunity();
  //  opp = [SELECT Name,StageName,CreatedBy FROM Opportunity];
    
    for(Account acc : Trigger.new){
        
        if((acc.AnnualRevenue > 500000) && (acc.Industry== 'Education')){
            opp.Name = acc.Name;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today() + 30;   
        }
        insert opp;
    }
    

}
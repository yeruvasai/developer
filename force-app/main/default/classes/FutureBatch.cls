global class FutureBatch implements database.Batchable<sobject>{
    
    global database.QueryLocator start(database.BatchableContext bc){
       string query = 'select name,annualrevenue from account';
        return database.getQueryLocator(query);
    }
    
    global void execute(database.BatchableContext bc,list<account> scope){
        list<account> ac = new list<account>();
        for(account acc:scope){
            if(acc.AnnualRevenue == null){
                acc.AnnualRevenue = 1000000 ;
            }
            ac.add(acc);
        }
        update ac;
    }
    
    global void finish(database.BatchableContext bc){
        
        FutureMethodinBatch.updatecontact();
        
    }
    

}
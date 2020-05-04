public class AccountFieldUpdate implements database.Batchable<sobject> {
    
  public  map<id,integer> acc = new map<id,integer>(); 
    
    public database.QueryLocator start(database.BatchableContext bc){
        string query = 'select name,accountid from contact where accountid != null';
        return database.getQueryLocator(query);
    }
        public void execute(database.BatchableContext bc,list<contact> scope){
            for(contact co:scope){
                integer n =acc.get(co.accountid);
                if(n == null){
                    acc.put(co.accountid,1);
                }
                else{
                    n=n+1;
                    acc.put(co.accountid,n);
                }
            }
            list<account> acco = new list<account>();
            for(id i:acc.keySet()){
                account ac = new account(id=i,No_of_Contacts__c = acc.get(i));
                acco.add(ac);
            }
            update acco;
        }   
        
        public void finish(database.BatchableContext bc){
            
        }

}
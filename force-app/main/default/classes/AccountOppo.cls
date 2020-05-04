public class AccountOppo {
    
    public static Map<string,list<opportunity>> mapopp;
    
    @auraenabled
    
    public static list<account> acc(){
        list<account> accs = new list<account>();
        try{
            accs = [select id,name from account];
        }
        catch(exception e){
            system.debug('Error'+e.getMessage());
        }
        return accs;
    }
    
    @auraenabled
    
   public static  map<string,list<opportunity>> fetchingOpp(string ids){
       
        mapopp=new map<string,list<opportunity>>();
        for(opportunity opp:[select Name,StageName from opportunity where accountid=:ids]){
            if(opp.stageName!=Null){
                list<opportunity> op=mapopp.get(opp.stageName);
                system.debug(op);
                if(op==null){
                    op=new list<Opportunity>();
                    mapopp.put(opp.StageName,op);
                    system.debug(mapopp);
                } 	
                op.add(opp);
                system.debug(op);
            }
            
        }
        
        return mapopp;
    }
 
    
}
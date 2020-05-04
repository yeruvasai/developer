public class SearchingRecords {
    
    @auraenabled
    
    public static list<account> accounts(string acc){
        
        
        acc='%'+acc+'%';
        system.debug(acc);
        list<account> accs = [select id,name,phone from account where name like :acc];
        
        system.debug(accs);
        
        return accs;
        
    }

}
public class InsertData {
    
    /* insert operation*/
    public void testData(){
        list<Account> listacc = [SELECT AnnualRevenue from Account Where Name =: 'prasad' ];
        for(Account acc:listacc){
            acc.AnnualRevenue = 60000;
            update acc;
        }
        
    }

}
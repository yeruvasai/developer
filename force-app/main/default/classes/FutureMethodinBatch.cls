global class FutureMethodinBatch {
    
    
    @future (callout=true)
    global static void updatecontact(){
        list<account> acc = new list<account>([select id,name,annualrevenue from account]);
        contact con = new contact();
        for(account a:acc){
            if(a.annualrevenue == 1000000 && a.Id == con.AccountId){
                con.Phone = '040';
            }
            
        }
        update con;
       
    }

}
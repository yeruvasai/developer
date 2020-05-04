public class Account_Opportunity1 {

     public string accid{get; set;}

        
     public Account_Opportunity1(){
         
         accounts = [select id,name from account order by annualrevenue asc limit 10];
         
     }

    public list<opportunity> opportunity { get; set; }

    public PageReference submit() {
        
        opportunity = [select id ,name from opportunity where accountid=:accid];
    
        return null;
    }


    public list<account> accounts { get; set; }
}
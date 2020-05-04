public class Account_Opportunity {

    public list<opportunity> opportunity{get;set;}

    
    public list<opportunity> getOpportunity() {
        return null;
    }


    public PageReference submit() {
    
        return null;
    }


    public list<account> getAccounts() {
    
      return  [select id,name from account order by annualrevenue asc limit 10 ];
        
    }

}
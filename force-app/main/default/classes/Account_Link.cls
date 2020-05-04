public class Account_Link {

    public string recid{get;set;}

    public list<contact> contacts { get; set; }

    //public account A;
    
    public Account_Link(){
    Account = [select name from account];
    //contacts = null;
    }

    public void setcontact() {
      contacts=[select id, FirstName, LastName from Contact where AccountId=:recid];
      
 
    }


    public list<account> Account { get; set; }
}
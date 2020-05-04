public class Account_Wrapper {
    public Contact_Wrapper con;

    public integer account_number;
    
    public class Contact_Wrapper{
        public string firstname;
        public string lastname;
    }
    
    public Account_Wrapper(integer account_number){
      
        this.account_number = account_number;
        
        con = new Contact_Wrapper();
       
        con.lastname='prasad';
    }
    
}
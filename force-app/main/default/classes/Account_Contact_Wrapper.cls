public class Account_Contact_Wrapper {

    public String lname { get; set; }

    public String aname { get; set; }

    public contact ins1 { get; set; }

    public account ins { get; set; }
    
    public Account_Contact_Wrapper (){
        ins = new account();
        ins1 = new contact();
    }

    public PageReference insertrecord() {
    insert ins1;
    insert ins;
        return null;
    }

}
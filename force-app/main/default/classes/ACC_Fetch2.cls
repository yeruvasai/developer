public class ACC_Fetch2 {

    public list<contact> getContats() {
        return [select name,email,phone from contact];
    }


    public list<account> getAccounts() {
        return [select id,name from account];
    }

}
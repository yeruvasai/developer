public class ACC_Fetch {

    public list<account> getAccounts() {
        return [select id,name from account];
    }


    public list<account> getAcc() {
        return [select name from account];
    }


    public list<account> getFetch() {
        return [select name from account];
    }

}
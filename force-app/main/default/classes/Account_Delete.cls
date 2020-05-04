public class Account_Delete {
    
    @auraenabled
    public static list<account> acclis(){
        return[select name,phone,industry from account];
    }

}
public class PopupTask {
    
    @auraenabled
    public static list<account> popup(){
        return[select id,name,phone,type,industry from account limit 5];
    }    
    
    @auraenabled
    public static list<account> acclist(string ids){
        return[select id,name,phone from account where id=:ids ];
    }

}
public class HTMLTABLE {
    
    @auraenabled
    public static list<account> datrec(){
        return[select name from account limit 5];
    }

}
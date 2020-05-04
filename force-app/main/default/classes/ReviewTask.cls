public class ReviewTask {
    
    @auraenabled
    
    public static list<account> cit(){
        list<account> acc = new list<account>();
        try{
            acc = [select id,name,(select name,accountid,phone from contacts)from account ];
        }
        catch(exception e){
            system.debug(e.getMessage());
        }
        return acc;
    }

}
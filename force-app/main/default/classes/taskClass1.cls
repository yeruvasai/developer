public class taskClass1 {

    public static list<contact> delrec(list<id> del){
        system.debug(del);
        
        list<contact> cont = [select id,name from contact where id in : del];
        system.debug(cont);
        return cont;
    
}
}
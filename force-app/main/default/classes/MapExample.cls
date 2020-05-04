@istest

public class MapExample {
    public static testmethod void main(){ 
        list<account> a = new list<account>();
        a=[select name from account];
        map<string,list<account>> books = new map<string,list<account>>();
        for(account ac:a){
            string st=ac.name.substring(0,1);
            list<account> acc=books.get(st);
              system.debug(acc);
        }
     
    }	
}
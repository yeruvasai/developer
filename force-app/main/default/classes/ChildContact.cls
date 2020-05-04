public class ChildContact {

    @auraenabled
    
    public static list<contact> getcall(string accs){
        system.debug(accs);
      account acc = [select id from account where name =: accs];
        system.debug(acc);
        list<contact> contacts = [select id,firstname,lastname from contact where accountid =:acc.id];
        system.debug(contacts);
        return contacts;
    }
    
}
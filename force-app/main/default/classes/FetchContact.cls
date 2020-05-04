public class FetchContact {
    @Auraenabled
    public static string createcontact(Contact contobj){
        system.debug('contact::'+contobj.FirstName);
        insert contobj;
        return contobj.id;
    }
    @Auraenabled
    public static list<contact> retriveContacts(){
        return[select lastname,firstname,phone,email from contact  ];
    }

}
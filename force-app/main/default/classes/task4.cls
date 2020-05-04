public class task4 {

    public void search() {
            customer__c cus = new customer__c();
        cus = [select id,name,Email__c ,Address__c,Telephone__c from customer__c where name like:cname limit 1];
       cname = cus.name;
        mail = cus.Email__c;
        address = cus.Address__c;
        phone = cus.Telephone__c ;
        
    }


    public String fetch { get; set; }


    public String phone { get; set; }

    public String address { get; set; }

    public String mail { get; set; }

    public String cname { get; set; }

    public void save() {
        customer__c cus = new customer__c();
        cus = [select id,name,Email__c ,Address__c,Telephone__c from customer__c where name like:cname limit 1];
       cname = cus.name;
        mail = cus.Email__c;
        address = cus.Address__c;
        phone = cus.Telephone__c ;
        //customer__c c = new customer__c();
       /* cus.name = cname;
        cus.Email__c = mail;
        cus.Address__c = address;
        cus.Telephone__c = phone; */
       //insert cus ;
    }

}
public class Custom_Update {

    public String cus { get; set; }

    public String phone { get; set; }

    public String addr { get; set; }

    public String email { get; set; }

    public String custname { get; set; }

    public void fetch() {
     customer__c c1 = new customer__c();
        c1 = [select id ,name,email__c,address__c,telephone__c from customer__c where id = :fetchID limit 1];
         custname = c1.name ;
         email = c1.Email__c ;
         addr = c1.Address__c ;
         phone = c1.Telephone__c ;
        
    }


    public String fetchID { get; set; }

    public void save() {
        customer__c c = new customer__c();
        c = [select id ,name,email__c,address__c,telephone__c from customer__c where id = :fetchID limit 1];
        c.name = custname;
        c.Email__c = email;
        c.Address__c = addr;
        c.Telephone__c = phone; 
       update c;
        
    }

}
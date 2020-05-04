public class task3 {

    public void save1() {
       customer__c c = new customer__c();
        c = [select id ,name,email__c,address__c,telephone__c from customer__c where id = :fetchID limit 1];
        c.name = custname;
        c.Email__c = email;
        c.Address__c = addr;
        c.Telephone__c = phone; 
       update c;
    }


    public String phone { get; set; }

    public String addr { get; set; }

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

    public PageReference order() {
        pagereference p1 = new pagereference('https://yvsp-dev-ed--c.visualforce.com/apex/Task_Standard_List');
        return p1;
    }


   /* public String getTab1() {
    
        return null;
    }*/


  //  public String cname { get; set; }

    public String tel { get; set; }

    public String add { get; set; }

    public String email { get; set; }

   public String cname { get; set; }

    public void save() {
         customer__c c = new customer__c();
        c.name = cname;
        c.Email__c = email;
        c.Address__c = add;
        c.Telephone__c = tel; 
       insert c ;
        
        
        
    }

}
public class task2 {

    public PageReference snew() {
    customer__c c = new customer__c();
        c.name = cname;
        c.Email__c = email;
        c.Address__c = add;
        c.Telephone__c = tel; 
       insert c;
       PageReference pr = new PageReference('https://yvsp-dev-ed--c.visualforce.com/apex/Task2');
        return pr;
    }


    public PageReference action() {
      customer__c c3 = new customer__c ();
         c3=[select id,name,Email__c,Address__c,Telephone__c from customer__c  where name like:cname limit 1];
        delete c3;
         PageReference pr = new PageReference('https://yvsp-dev-ed--c.visualforce.com/apex/Task2');
        return pr;
    }


    public void view() {
       customer__c c1 = new customer__c ();
         c1=[select id,name,Email__c,Address__c,Telephone__c from customer__c  where name like:cname limit 1];
         cname = c1.name ;
         email = c1.Email__c ;
         add = c1.Address__c ;
         tel = c1.Telephone__c ;
        
    }


    public void edit() {
      
         
         customer__c c2 = new customer__c ();
         
         c2=[select id,name,Email__c,Address__c,Telephone__c from customer__c  where name like:cname limit 1];
        c2.name = cname;
        c2.Email__c = email;
        c2.Address__c = add;
        c2.Telephone__c = tel;
        //c2.add(c1);
        update c2;
         
        
       
    }


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
       insert c;
    }

}
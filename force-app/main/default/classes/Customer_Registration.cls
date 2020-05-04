public class Customer_Registration {

    public customer__C customer1 { get; set; }

    public customer__C customer2 { get; set; }

    public void submit() {
        insert customer2;
    }


    public PageReference next2() {
   customer2 = customer1;
    PageReference page1 = new PageReference('https://yvsp-dev-ed--c.visualforce.com/apex/Customer_Registration3');
        return page1;
    }


    public PageReference next1() {
    customer1 = customer;
    PageReference page = new PageReference('https://yvsp-dev-ed--c.visualforce.com/apex/Customer_Registration2');
        return page;
    }


    public customer__c customer { get; set; }
    
    public Customer_Registration (){
        customer = new customer__c ();
        customer1 = new customer__c ();
        customer2 = new customer__c ();
    }
}
public class Registration {

    public String customerwebsite { get; set; }

    public String customeremail { get; set; }
    
    public String customeraddress { get; set; }
    
    public date customerdate { get; set; }
    
    public String customerphone { get; set; }

    public String customername { get; set; }
    
    public customer__c customer{get;set;}


   public Registration (){
       customer = new customer__c();
       
   }

    public PageReference submit() {
    
    
    
    customer.Name = customername;
    customer.Telephone__c = customerphone ;
    customer.DOB__c = customerdate ;
    customer.Address__c = customeraddress ;
    customer.Email__c = customeremail ;
    customer.Website__c = customerwebsite ;
    
    insert customer;
    
      return null;
    }


    public PageReference next2() {
    
    PageReference page2 = new PageReference('/apex/Registration3');
    
        return page2;
        
    }


    public PageReference next1() {
    
    PageReference page1 = new PageReference('/apex/Registration2');
    
        return page1;
    }



}
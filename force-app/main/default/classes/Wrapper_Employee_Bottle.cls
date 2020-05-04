public class Wrapper_Employee_Bottle {

    public list<employee> bottle { get; set; }
    
    public Wrapper_Employee_Bottle (){
        
        bottle = new list<employee>();
        
        list<Bottle__c> bot = [select name from Bottle__c];
        list<Employee__c> emp = [select ename__c from Employee__c];
        
        for(Bottle__c bots:bot){
            bottle.add(new employee(bots));
        }
        
        for(Employee__c emps:emp){
            bottle.add(new employee(emps));
            
        }
        
    }
    
    public class employee{
        public bottle__c nam{get;set;}
        public employee__c enam{get;set;}
        
     public employee(Bottle__c bots)   {
      this.nam = bots;
     } 
     public employee(Employee__c emps) {
         this.enam = emps;
     }
     
    }
}
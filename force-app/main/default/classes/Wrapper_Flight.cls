public class Wrapper_Flight {

    public list<details> flight { get; set; }
    
    public Wrapper_Flight (){
    
        flight = new list<details>();
    
        list<Flight__c> fly = [select Departure__c,arrival__c from flight__c];
        list<contact> con = [select lastname from contact];
        list<account> acc = [select name from account];
    
        for(Flight__c flys :fly){
            flight.add(new details(flys));
        }
        for(contact cons:con){
            flight.add(new details(cons));
        }
        for(account accs:acc){
            flight.add(new details(accs));
        }
    
    }
    
    public class details{
    
        public flight__c Depart{get;set;}
        public contact name{get;set;}
        public account nam{get;set;}
        
        public details(flight__c flys){
            this.depart = flys;
            
            
        }
        
        public details(contact cons){
            this.name = cons;
        }
        
        public details(account accs){
            this.nam = accs;
        }
    
    }
}
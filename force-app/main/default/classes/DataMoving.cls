public class DataMoving {

    public list<bottle__c> bottles { get; set; }

    public void transfer() {
    
    bottles= new  list<bottle__c>();
      for(integer i = bottle.size() - 1;i >=0;i--){
          DataTransfer dat =bottle[i];
      if(dat.selectid == true){
      bottles.add(dat.bottlename);    
          bottle.remove(i);
      }
          
      }
    }

    
    public list<DataTransfer> bottle{get;set;}
    
    
    
    public DataMoving(){
        
        bottle = new list<DataTransfer>();
        
        list<bottle__c> bot = [select id,name,price__c from bottle__c];
        list<employee__c> emp = [select id,name,Ename__c,Esalary__c from employee__c];
        
        if(bottle!= null){
            for(bottle__c bots:bot){
                bottle.add(new DataTransfer(bots,false));
            }
        }
       if(bottle!= null){
            for(employee__c emps:emp){
                bottle.add(new DataTransfer(emps,false));
            }
        }
        
    }

}
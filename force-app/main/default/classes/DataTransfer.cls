public class DataTransfer {
    
    public bottle__c bottlename{get;set;}
    public Employee__c empnumber{get;set;}
    public boolean selectid{get;set;}
    
    public DataTransfer(bottle__c rc , boolean selectcheck ){
        bottlename = rc;
        selectid = selectcheck ;
        
    }
    
    public DataTransfer(Employee__c emp ,boolean selectcheck){
       empnumber = emp ;
       selectid = selectcheck ; 
        
    }
}
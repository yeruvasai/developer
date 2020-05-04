public class UpdateEmployee {
    
        @AuraEnabled 

     public static List<Employee__c> recordSearch(String searchKeyWord){
        String Searchtext = '%'+searchKeyWord+'%';
        return[select Name,Ename__c,Esalary__c from Employee__c where Ename__c like :Searchtext];      
    }

}
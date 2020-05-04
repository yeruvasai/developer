public with sharing class createrecord {
     
@auraenabled

public static Employee__c saveStudent(Employee__c employee){
        insert employee;
    return employee;
    }
}
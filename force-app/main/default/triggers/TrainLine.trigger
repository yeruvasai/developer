trigger TrainLine on Trainline__c (before insert,before update) {
    
    
        map<id,account> acmap = new map<id,account>([select id, parentid from account]);
        
    for(Trainline__c tran:trigger.new){        
        account acc = acmap.get(tran.Accountname__c);
       tran.ParentAccount__c = acc.ParentId; 
    }
      
    
}
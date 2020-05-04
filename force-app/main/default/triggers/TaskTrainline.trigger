trigger TaskTrainline on Trainline__c (before insert,before update) {
    
    map<id,account> acmap = new map<id,account>([select id,name,parentid,parent.name,phone from account]);
        system.debug(acmap);
    for(Trainline__c tran:trigger.new){        
        if(tran.Accountname__c != null){
        account acc = acmap.get(tran.Accountname__c);
        system.debug(acc);
        if(acc.ParentId != null){
            tran.AName__c = acc.Parent.name;
            tran.Account_Phone__c = acc.Phone;
        }
        else{
            tran.AName__c = acc.Name;
            tran.Account_Phone__c = acc.Phone;
        }
        }
        else{
            tran.AName__c = 'Null';
            tran.Account_Phone__c = 'Null';
        }

    }

}
trigger Email_Duplicate_Set on Candidate__c (before insert) {
    set<string> ser = new set<string>();
    for(Candidate__c c:trigger.new){
        ser.add(c.email__c);
    }
    list<Candidate__c> can = [select id,email__c from Candidate__c where email__c =:ser];
    for(Candidate__c c1:can){
        if(can.size()>0){
            c1.adderror('error');
        }
    }
}
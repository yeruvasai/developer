trigger Email_Duplicate on Candidate__c (before insert,before update) {
    
    set<string> setmail = new set<string>();
    set<string> existmail = new set<string>();
    
    for(candidate__c ca:trigger.new)
    {
        setmail.add(ca.email__c);
    }
    list<candidate__c> con = [select email__c from candidate__c where email__c in :setmail]; 
    for(candidate__c ca:con)
    {
        existmail.add(ca.Email__c);
    }
    for(candidate__c ca1:trigger.new)
    {
    	if(existmail.contains(ca1.email__c))
        {
            ca1.Email__c.adderror('This email already exists');
        }
    }
}
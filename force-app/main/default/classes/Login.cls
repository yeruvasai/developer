public class Login {

    public PageReference reg() {
    if(log.email__c == null || log.password__c == null){
     PageReference page = new PageReference('https://yvsp-dev-ed--c.visualforce.com/apex/Signup');
    return page;
   }
    return null;    
    }


    public Candidate__c log { get; set; }
    
    public Login(){
    log = new Candidate__c ();
    }

    public PageReference register() {
    if(log.email__c == null || log.password__c == null){
        return null;
        }
    list<Candidate__c> cand = [select email__c,password__c from Candidate__c ];
    for(Candidate__c cand1:Cand)
    {
    if(cand1.email__c == log.email__c && cand1.password__c == log.password__c)
    {
    PageReference page = new PageReference('https://yvsp-dev-ed--c.visualforce.com/apex/Account_Contact');
    return page;
    }
    }
    return null;
    }

}
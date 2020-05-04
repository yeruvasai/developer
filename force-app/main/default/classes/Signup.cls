public class Signup {

    public Candidate__c sign { get; set; }
    
    public Signup(){
    sign = new Candidate__c();
    }

    public PageReference singup() {
    
    if(sign.Last_Name__c == null && sign.Email__c == null && sign.Password__c == null)
    {
    apexpages.addmessage(new apexpages.message(apexpages.severity.error,'enter required fields'));
    }
    
    if(sign.Last_Name__c != null && sign.Email__c != null && sign.Password__c != null)
    {
    insert sign;
    PageReference page = new PageReference ('https://yvsp-dev-ed--c.visualforce.com/apex/LoginForm');
    return page;
    }
        return null;
    }

}
trigger Prevent_Opportunity on Account (before delete) {
    
    for(account acc:trigger.old){
         list<Opportunity> op = [select id from Opportunity where accountid = : acc.Id];
    if(op.size()!=0){
   acc.addError('records cannot delete');
    }
   
    }
}
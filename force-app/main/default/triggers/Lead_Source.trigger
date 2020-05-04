trigger Lead_Source on Lead (before insert , before update) 
{
    for(lead lr:trigger.new)
    {
        integer score = 0;
        if((trigger.isinsert || trigger.isupdate)&& trigger.isbefore){
            
        if(lr.email != null ){
            score=score+10;
        }
         if(lr.Phone !=null){
            score=score+10;
        }
         if(lr.Industry !=null){
            score=score+20;
        }
       
            lr.Lead_Source__c = score;
      
         }
        else
        {
            lr.Lead_Source__c = null;
        }
}
}
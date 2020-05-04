trigger CaseAssignUser on Case (after insert) {
    user op = [select id from user where alias='prasad' limit 1];
    List<CaseShare> share=new List<CaseShare>();
    
    for(Case c:Trigger.New){
         if((Trigger.isinsert || Trigger.isupdate) && Trigger.isafter){
            if(c.Priority=='High' && c.Origin=='Email'){
                CaseShare cas=new CaseShare();
                cas.CaseId=c.Id;
                cas.UserorGroupId=op.id;
                cas.CaseAccessLevel='Edit';
                share.add(cas);
            }
        }
    }
   database.insert(share);
}
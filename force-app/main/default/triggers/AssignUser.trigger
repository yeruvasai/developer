trigger AssignUser on Opportunity (after insert) {
    
    user op = [select id from user where alias='prasad' limit 1];
    
    list<OpportunityShare> share = new list<OpportunityShare>();
    
    for(Opportunity opp:trigger.new){
        if(opp.stagename == 'closedwon'){
            OpportunityShare oppor = new OpportunityShare();
            oppor.OpportunityId = opp.id;
            oppor.UserOrGroupId = op.id;
            oppor.OpportunityAccessLevel = 'edit';
                    share.add(oppor);

        }
    }
	database.insert(share);
}
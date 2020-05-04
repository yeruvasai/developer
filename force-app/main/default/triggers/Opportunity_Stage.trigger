trigger Opportunity_Stage on Opportunity (after insert) {
	user op =[select id from user where alias='PRASAD' limit 1];
    list<opportunityshare> oppo = new list<opportunityshare>();
    for(opportunity opp :trigger.new){
        if(opp.StageName == 'Closed Won'){
            opportunityshare ops = new opportunityshare();
            ops.OpportunityId = opp.Id;
            ops.UserOrGroupId = op.Id;
            ops.OpportunityAccessLevel = 'edit';
            oppo.add(ops);
        }
    }
    insert oppo;
}
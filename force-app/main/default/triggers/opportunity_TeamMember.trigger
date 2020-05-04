trigger opportunity_TeamMember on Opportunity (after insert) {
    user op = [select id from user where alias='prasad' limit 1];
    list<OpportunityTeamMember> team = new list<OpportunityTeamMember>();
  
    for(opportunity oppo : trigger.new)
    {
        if(oppo.StageName =='closed won'){
            OpportunityTeamMember opp = new OpportunityTeamMember();
            opp.Opportunityid = oppo.Id;
            opp.teammemberrole = 'account manager';
            opp.userid = op.Id;
            team.add(opp);
        }        
    }
    insert team;
}
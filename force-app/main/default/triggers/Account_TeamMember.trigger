trigger Account_TeamMember on Account (after insert) {
    user ac = [select id from user where alias='PRASAD' limit 1 ];
    list<AccountTeamMember> team = new list<AccountTeamMember>();
    for(account acc:trigger.new)
    {
        if(acc.industry=='education' && acc.AnnualRevenue == 1000000){
            AccountTeamMember acct = new AccountTeamMember();
            acct.accountid = acc.Id;
            acct.teammemberrole = 'marketing manager';
            acct.userid = ac.Id;
            team.add(acct);
        }
    }
    insert team;    
}
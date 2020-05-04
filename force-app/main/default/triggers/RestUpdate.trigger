trigger RestUpdate on Account (after update) {
    
    set<id> accid = new set<id>();
    for(account acc:trigger.new){
        if(acc.industry == 'Banking'){
            accid.add(acc.Id);
        }
        system.debug('hi'+acc.Id);
    }
    if(accid.size()>0){
        RestApiServices.getUpdateRec(accid);
    }

}
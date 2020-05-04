trigger Prevent_Test on Account (before delete) {
    list<account> acc = [select id from account];
    list<opportunity> opp = [select id from opportunity where accountid =:acc];
    for(account ac:trigger.old){
        if(opp.size()!=0){
            ac.addError('record cannot insert');
        }
    }
}
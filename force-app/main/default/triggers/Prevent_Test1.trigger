trigger Prevent_Test1 on Account (before delete) {
    map<id,opportunity> opp = new map<id,opportunity>([select id ,accountid from opportunity]);
    for(account acc:trigger.old){
        if(opp.size()!=0){
            acc.addError('Records cannot deleted');
        }
    }
}
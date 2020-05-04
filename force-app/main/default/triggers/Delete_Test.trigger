trigger Delete_Test on Account (after delete) {
    list<account> acc = [select id from account];
    list<contact> con = [select id from contact where accountid =:acc];
    for(account ac :trigger.old){
        
    }
    delete con;
}
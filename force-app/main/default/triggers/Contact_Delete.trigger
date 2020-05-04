trigger Contact_Delete on Account (after delete) {
    //set<id> con = new set<id>();
    for(account acc:trigger.old){
        //con.add(acc.Id);
         list<contact> c =[select id from contact where accountid =:acc.Id];
    delete c;
    }
   
}
global class taskschedule implements schedulable{
     
     global list<string> ids;
     global integer num;
     global taskschedule (list<string> ids,integer num){
         this.ids = ids;
         this.num = num;
     }
     global void execute(schedulablecontext sc){
     list<contact> con = new list<contact>();
     try{
         for(contact cons:[select name,pay_time__c from contact where id in :ids ]){
             
             cons.pay_time__c = cons.pay_time__c.addhours(num);
             con.add(cons);
         
         }
     }
     catch(exception e){
         system.debug('errors'+e.getmessage());
     }
     if(con.size()>0){
     update con;
     }
     
     
     }
     
 }
public Class oppRec{

public static list<wrapper> wrap;
public static string acc;
public static list<contact> con;

 @auraenabled
        
        public static list<opportunity> rec(){
        
            list<opportunity> lead = new list<opportunity>();
            try{
            
                lead = [select id,accountid,name from opportunity];
            
            }
            catch(exception e){
            
                system.debug('Errors'+e.getMessage());
            
            }
            return lead;
            
        }
        
 @auraenabled
 
     public static list<wrapper> conRec(string id){
     wrap = new list<wrapper>();
     
     list<account> accounts = [select id,name from account where id=:id];
     list<contact> contacts = [select id,name,accountid from contact];
         
         try{
             if(accounts!=null){
         for(account accs:accounts){
             con = new list<contact>();
             acc = accs.name;
             if(contacts!=null){
             for(contact cont:contacts){
                 if(accs.id == cont.accountid){
                     con.add(cont);
                 }
             }
             wrap.add(new wrapper(acc,con));
             }
         }
             }
         }
         catch(exception e){
             system.debug('error'+e.getMessage());
         }
     
        return wrap;         
     }    
     
     public class wrapper{
         @auraenabled public string acco{get;set;}
         @auraenabled public list<contact> cons{get;set;}
         
         public wrapper(string ac,list<contact> co){
             
             acco = ac;
             cons = co;
             
         } 
         
     }
    
    @auraenabled
 
 public static void sched(list<string> ids,integer numb){
     system.debug(ids);
     system.debug(numb);
 
 if(ids.size()>0){
 
 taskschedule sts = new taskschedule (ids,numb);
     
 system.schedule('conjob1','0 39 11 25 nov ? 2019',sts);
 
     
 }
     
 }
    
    

}
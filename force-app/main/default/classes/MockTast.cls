public class MockTast {
    
    @auraenabled
    
    public static list<account> cit(){
        list<account> acc = new list<account>();
        try{
            acc = [select name from account ];
            system.debug(acc);
            
        }
        catch(exception e){
            system.debug(e.getMessage());
        }
        return acc;
    }
    
      //public opportunity opp{get;set;}
   public static list<wrapperclass> wrap{get;set;}
   @AuraEnabled
   public static list<wrapperClass> getData(string value){
      string acc = value;
       system.debug(acc);
       try{
       
       wrap=new list<wrapperclass>();
       system.debug(value);
           
       
       
      list<opportunity> opp=[select Name,account.Name,(select opportunityid,productCode from opportunitylineitems)from opportunity where account.name like :acc];
       system.debug(opp);
       
       for(opportunity oppo:opp){
//list<opportunitylineitem> opppro=oppo.opportunityLineItems;

system.debug(oppo);
          if(oppo.opportunityLineItems.size()>0){
               
       for(opportunitylineitem op:oppo.opportunitylineitems){
           if(!wrap.isEmpty()){
           wrap.add(new wrapperclass(oppo.Name,oppo.Account.Name,op.ProductCode));
               
       }
       }
          }  
           else{
               if(! wrap.isEmpty()){
               wrap.add(new wrapperclass(oppo.Name,oppo.Account.Name,null));
           }
               
       }
       }
       system.debug(wrap);
       }
       catch(exception e){
           
       }
       return wrap;
   }
       
   public class wrapperClass{
   @AuraEnabled public string opportunityid{get;set;}
   @AuraEnabled public string accountid{get;set;}
   @AuraEnabled public string productid{get;set;}
   public wrapperClass(string opportunityid,string accountid, string productid){
       this.opportunityid=opportunityid;
       this.accountid=accountid;
       this.productid=productid;
   }
}


}
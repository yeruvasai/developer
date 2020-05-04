public class Acc_ConLightning {
    
    @auraenabled
    
    public static list<wrapper> rec(){
        list<account> acs = new list<account>();
        list<contact> cos = new list<contact>();
        list<wrapper> wr = new list<wrapper>();
        list<account> ac = [select name from account ];
        list<contact> co = [select lastname from contact ];
        
        for(account accs:ac){
            wrapper wrs = new wrapper(accs,null);
            wr.add(wrs);
        }
        integer i = 0;
        for(contact cons:co){
            if(i<ac.size()){
                wrapper wrs = new wrapper(ac[i],cons);
                wr.set(i,wrs);
                i++;
            }
            else{
                wrapper wc = new wrapper(null,cons);
                wr.add(wc);
            }
        }
        
        return wr; 
    }    
      public class wrapper{
    
      @auraenabled public account acc{get; set;}
      @auraenabled public contact con{get; set;}
        
        public wrapper(account acco,contact cont) {
            	acc = acco ;
            	con = cont ;
        }
        
        }
    

}
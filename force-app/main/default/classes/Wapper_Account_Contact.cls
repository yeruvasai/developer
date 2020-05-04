public class Wapper_Account_Contact {
    
    public list<wrapper> wraptab{get;set;}
    public list<account> accs {get;set;}
    public list<contact> cons {get;set;}
    
    public Wapper_Account_Contact (){
    
        wraptab = new list<wrapper>();
        
        accs = [select name from account];
        cons = [select Lastname from contact];
        
        for(account ac:accs){
             wrapper wr = new wrapper(ac,null,false);
             wraptab.add(wr);   
        }
        integer i=0;
        for(contact co:cons){
            if(i<accs.size()){
                wrapper wp = new wrapper(accs[i],co,false);
                wraptab.set(i,wp);
                i++;
            }
            else{
                wrapper wd = new wrapper(null,co,false);
                wraptab.add(wd);
            }
        }
        system.debug(wraptab);
    
    }


    public class Wrapper {
        
        public account acc {get;set;}
        public contact con {get;set;}
        public boolean selectchek {get;set;}
        
        public wrapper(account acco ,contact cont,boolean selcheck){
            acc = acco ;
            con = cont ;
            selectchek = selcheck;
        }
        
        
    }
}
public class Wrapper_Transfer {

    public PageReference remove() {
    for(integer i = wraptable.size() - 1;i >=0;i--){
              wrapper w = wraptable[i];
              if(w.selectid == true){
                  wrapper wr = new wrapper(w.acc,w.con,false);
                  wraptab.add(wr);
                  wraptable.remove(i);
              }
          }

        return null;
    }


    public PageReference transfer() {
          for(integer i = wraptab.size() - 1;i >=0;i--){
              wrapper w = wraptab[i];
              if(w.selectid == true){
                  wrapper wr = new wrapper(w.acc,w.con,false);
                  wraptable.add(wr);
                  wraptab.remove(i);
              }
          }

        return null;
    }

    public list<wrapper> wraptable{get;set;}
    public list<wrapper> wraptab{get;set;}
    public list<account> accs {get;set;}
    public list<contact> cons {get;set;}
    
    public Wrapper_Transfer (){
        
        wraptable = new list<wrapper>();
        wraptab = new list<wrapper>();
        
        accs = [select name from account limit 10];
        cons = [select Lastname from contact limit 10];
        
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
    
    }


    public class Wrapper {
        
        public account acc {get;set;}
        public contact con {get;set;}
        public boolean selectid{get;set;}
        
        public wrapper(account acco ,contact cont,boolean selectcheck ){
            acc = acco ;
            con = cont ;
            selectid = selectcheck ;
        }
        
        
    }
}
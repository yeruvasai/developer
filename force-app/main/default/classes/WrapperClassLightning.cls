public class WrapperClassLightning {
    
    @auraenabled
    public static wrapper getRec(){
        
        list<account> ac = [select name from account];
        list<contact> co = [select lastname from contact];
        wrapper wr = new wrapper(ac,co);
        return wr;
    }
    
    
    public class wrapper {
        
        @auraenabled public list<account> listacc{get; set;}
        @auraenabled public list<contact> listcon{get; set;}
        
        public wrapper (list<account> acc,list<contact> con){
            
            listacc = acc ;
            listcon = con ;
        }
    }

}
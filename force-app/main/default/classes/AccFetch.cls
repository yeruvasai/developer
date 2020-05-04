public class AccFetch {

    @auraenabled

public static list<opportunity> greater(integer gre){
list<opportunity> oppo = [select name from opportunity where account.annualrevenue >: gre];
   system.debug(oppo);
    return oppo ;
    
}

@auraenabled
public static list<opportunity> less(integer les){
return[select name from opportunity where account.annualrevenue <: les];
}

@auraenabled
public static list<opportunity> equal(integer equ){
return[select name from opportunity where account.annualrevenue =: equ];
}
    
}
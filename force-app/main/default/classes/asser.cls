@istest
public class asser {
    public static testmethod void main(){
        integer num = 10;
        integer den = 0;
        integer res;
        system.assert(den>0 && num>0,'condition false');
        system.assertEquals(den,0);
        system.assertNotEquals(den,0);
        res = num/den ;
        system.debug('we cannot divide the number by 0');
    }
}
public class ProductFetch {
    
    @auraenabled
    public static list<book__c> prodfet(){
        list<book__c> can = new list<book__c>();
        try{
            can = [select name,Author_Name__c,ISBN__c from book__c];
        }
        catch(exception e){
            system.debug('Error'+e.getMessage());
        }
        return can;
    }
    
    @auraenabled
    public static list<cart__c> mycartrec(string custId){
        system.debug('Id'+custId);
        list<cart__c> cart = new list<cart__c>();
        cart = [select id,book__r.name,book__r.Author_Name__c,candidate__c from cart__c where candidate__c =:custId];
        system.debug(cart);
        return cart;
    }

}
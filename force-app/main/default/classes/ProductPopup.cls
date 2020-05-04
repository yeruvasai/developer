public class ProductPopup {
    
    @auraenabled
    public static void cartins(string customers,string products){
        system.debug('cus'+products);
        system.debug('pro'+customers);
        cart__c ca = new cart__c();
        ca.Candidate__c = products;
        ca.Book__c = customers;
        insert ca;
        
        
    }

}
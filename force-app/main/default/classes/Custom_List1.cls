public class Custom_List1 {

    public list<customer__C> getCustomer() {
        return[select id,name,Email__c,Address__c,Telephone__c from customer__c order by name ASC];
    }

}
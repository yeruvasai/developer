public class Custom_page {

    public String getNext() {
        return null;
    }


    public String getPrevious() {
        return null;
    }


    public list<customer__c> getCustomer() {
        return [select id,name from customer__c];
    }



public void setList(list<customer__c> l){
}

    public list<customer__c> getList() {
        return null;
    }

}
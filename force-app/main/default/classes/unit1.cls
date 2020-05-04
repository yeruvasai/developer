public class unit1 {

    public item__c item { get; set; }
    
    public unit1 (){
        item = new item__c();
    }
    

    public PageReference save() {
        insert item;
        return null;
    }

}
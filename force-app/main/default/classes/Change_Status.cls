public class Change_Status {

    public order_no__c ord{get;set;}

    public Change_Status(ApexPages.StandardController controller) {
    
    ord = [select id,name,customer__c,status__c,Deliverd__c  from order_no__c limit 1];
    }
    
        public order_no__c pickrecord(){
        
        order_no__c odd = new order_no__c(); 
               
        if(odd.Deliverd__c == true){
            odd.status__c = 'processing';
        }
        else if(odd.Deliverd__c == false){
            odd.status__c = null;
        }
        //update odd;
        return odd;

}

    public order_no__c delivery()
    {
    return null;
    }

}
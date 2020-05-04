trigger Phone_City on customer__c (before insert,before update) {
	
    if((trigger.isinsert || trigger.isupdate)&& trigger.isbefore){
                        
        for(customer__c customer:trigger.new){
            
            if(customer.telephone__c == '040'){
                customer.Address__c = 'Hyderabad';
            }
            
            if(customer.telephone__c == '0832'){
                customer.Address__c = 'Goa';
            }
            
        }
        
    }
    
}
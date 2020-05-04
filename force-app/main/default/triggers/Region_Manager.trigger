trigger Region_Manager on position__c (before insert) {
    
    if(trigger.isinsert && trigger.isbefore){
        
        for(position__c position:trigger.new){
            
            if(position.Region_Manager__c == 'Asia'){
                position.Manager_Name__c = 'Prasad';
            }
            
            if(position.Region_Manager__c == 'America'){
                position.Manager_Name__c = 'bran';
                
            }
            if(position.Region_Manager__c == 'China'){
                position.Manager_Name__c = 'jon lee';            
        }
            if(position.Region_Manager__c == 'Europe'){
                position.Manager_Name__c = 'robb';            
        
    }
            if(position.Region_Manager__c == 'Japan'){
                position.Manager_Name__c = 'eddard';    
            }
        }
    }

}
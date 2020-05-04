trigger Location on Lead (before insert) {
    for(lead le:trigger.new){
        if(le.phone == '91'|| le.phone == '040'){
            le.Location__c = 'india';
        }
    }
}
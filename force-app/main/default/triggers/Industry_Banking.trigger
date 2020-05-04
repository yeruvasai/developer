trigger Industry_Banking on Lead (before insert ) {
    
    user g = [select id from user where alias ='PRASAD' limit 1];
    for(lead lr:trigger.new){

        if(lr.industry=='banking'){
            lr.OwnerId= g.Id;
            
     
    }
    }

}
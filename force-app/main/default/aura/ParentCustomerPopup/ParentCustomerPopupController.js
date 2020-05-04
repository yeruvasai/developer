({
    
	submit : function(component, event, helper) {
        
        var mail = component.get("v.acc");
        var documents = component.get("v.values");
        console.log(documents);
        console.log(mail);
        var action = component.get("c.mailsend");
        action.setParams({mails:mail,ids:documents});
        action.setCallback(this,function(response){
           var state = response.getState();
            if(state == 'SUCCESS'){
                alert('SUCCESS');
            }else{
                alert('FAILED')
            }
            
        });
		$A.enqueueAction(action);
		
	},
    invoke:function(component,event,helper){
        var action = component.get("c.doc");
        action.setCallback(this,function(response){
            var state = response.getState();
         	var value = response.getReturnValue();
            console.log(value);
            if(state == 'SUCCESS'){
                var temp =[];
                value.forEach(function(res){
                    temp.push({label:res.Name,value:res.Id});
                })
                alert('SUCCESS');
                component.set("v.docu",temp);
                
            }else{
                alert('FAILED')
            }
            
        });
		$A.enqueueAction(action);
            
     	
        
    }
})
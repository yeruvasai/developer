({
	doinit : function(component, event, helper) {
        
        var names = component.get("v.cities");
        var action = component.get("c.cit");
        action.setParams({
            
        });
        action.setCallback(this,function(response){
           var state = response.getState();
            if(state == 'SUCCESS'){
                var result = response.getReturnValue();
           console.log(result);
                    component.set("v.cities",result);
                
            } 
        });
		$A.enqueueAction(action);
	}
})
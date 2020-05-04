({
    invoke : function(component, event, helper) {
	var sup = component.get("v.acc");
        console.log('hi'+sup)
        var action = component.get("c.acclist");
        
        action.setParams({"ids":sup});
        
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.account",response.getReturnValue());
                console.log(response.getReturnValue());
            }
        });
		$A.enqueueAction(action);
	}
})
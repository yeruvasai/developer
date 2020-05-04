({
	init : function(component, event, helper) {
        
        var acc = component.get("v.wrapdata");
        
        var action = component.get("c.rec");
        action.setParams({ });
        action.setCallback(this,function(response){
           var state = response.getState();
            if(state === "SUCCESS"){
                console.log(response.getReturnValue());
                component.set("v.wrapdata",response.getReturnValue());
            } 
            else{
                alert('failed')
            }
        });
		$A.enqueueAction(action);
	}
})